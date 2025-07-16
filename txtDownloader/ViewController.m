// ViewController.m
#import <UIKit/UIKit.h>
#import "ConfigurationSettingsManager.h"


@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UISwitch *loggingSwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeSystem];
    selectButton.frame = CGRectMake(100, 200, 200, 50);
    [selectButton setTitle:@"Select Option" forState:UIControlStateNormal];
    [selectButton addTarget:self action:@selector(showAlertController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectButton];
    
    

    [self.loggingSwitch setOn:[ConfigurationSettingsManager sharedManager].isLoggingOn];

}


- (void)showAlertController {
    self.dataArray = [self getTheFilesFromPath:@"11"];
    self.dataArray = @[@"11"];
    UIAlertController *alert;
       if (self.dataArray.count == 0) {
           alert = [UIAlertController alertControllerWithTitle:@"No available files"
                                                        message:@"There are no available files.\nPlease move the files to the device's path xxxx"
                                                 preferredStyle:UIAlertControllerStyleAlert];
       } else {
           alert = [UIAlertController alertControllerWithTitle:@"Please note"
                                                        message:@"After selecting the file, the device will reboot twice to enable the selected option"
                                                 preferredStyle:UIAlertControllerStyleActionSheet];
           
           for (NSString *option in self.dataArray) {
               UIAlertAction *action = [UIAlertAction actionWithTitle:option
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * _Nonnull action) {
                   [self handleSelectedOption:action.title];
               }];
               [alert addAction:action];
           }
       }

       UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                              style:UIAlertActionStyleCancel
                                                            handler:^(UIAlertAction * _Nonnull action) {
           [self.loggingSwitch setOn:NO];
           NSLog(@"Switch off");
           NSLog(@"User canceled the selection.");
       }];
       [alert addAction:cancelAction];

       [self presentViewController:alert animated:YES completion:nil];

}

- (void)handleSelectedOption:(NSString *)selectedOption {
    NSLog(@"Performing action for Option %@.",selectedOption);
    NSLog(@"Pre save command %@.",[ConfigurationSettingsManager sharedManager].selectedPath);

    [ConfigurationSettingsManager sharedManager].selectedPath = selectedOption;
}



- (IBAction)loggingSwitchToggle:(id)sender {
    UISwitch * loggignSwitch = sender;
    
    if (loggignSwitch.isOn){
        [self showAlertController];
        NSLog(@"Switch on");

    }else{
        NSLog(@"Switch off");
    }
   
}

- (NSArray*)getTheFilesFromPath:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    // Check if the directory exists
    BOOL isDirectory;
    BOOL directoryExists = [fileManager fileExistsAtPath:path isDirectory:&isDirectory];

    if (!(directoryExists && isDirectory)) {
        // Directory does not exist, create it
        BOOL success = [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (!success) {
            NSLog(@"Failed to create directory at %@ with error: %@", path, error.localizedDescription);
            return @[];
        }
    }

    // Populate dataArray with files in the directory
    NSArray *files = [fileManager contentsOfDirectoryAtPath:path error:&error];
    if (error) {
        NSLog(@"Failed to list files at %@ with error: %@", path, error.localizedDescription);
        return @[];
    }

    return files;
}

@end



@[CurlUploadTask simulateBrokenPipeWrite];

#import "CurlUploadTask.h"

@interface CurlUploadTask ()
@property (nonatomic, strong) NSString *filePath;
@property (nonatomic, strong) NSString *uploadURL;
@property (nonatomic, strong) NSTask *task;
@property (nonatomic, strong) dispatch_queue_t queue;
@end

@implementation CurlUploadTask

- (instancetype)initWithFilePath:(NSString *)filePath uploadURL:(NSString *)url {
    self = [super init];
    if (self) {
        _filePath = filePath;
        _uploadURL = url;
        _timeout = 40;
        _chunkSize = 64 * 1024;
        _retryCount = 0;
        _queue = dispatch_queue_create("com.example.curlUploadQueue", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)start {
    if (![[NSFileManager defaultManager] fileExistsAtPath:self.filePath]) {
        if (self.onFailure) {
            self.onFailure([NSError errorWithDomain:@"CurlUploadTask"
                                                code:404
                                            userInfo:@{NSLocalizedDescriptionKey: @"File not found"}]);
        }
        return;
    }

    NSPipe *inputPipe = [NSPipe pipe];
    NSPipe *outputPipe = [NSPipe pipe];
    NSPipe *errorPipe = [NSPipe pipe];

    self.task = [[NSTask alloc] init];
    self.task.launchPath = @"/usr/bin/curl";
    self.task.arguments = @[
        @"-X", @"POST",
        @"--data-binary", @"@-",
        @"--max-time", [NSString stringWithFormat:@"%.0f", self.timeout],
        @"--connect-timeout", @"10",
        @"--expect100-timeout", @"3",
        @"--retry", [NSString stringWithFormat:@"%lu", (unsigned long)self.retryCount],
        @"--retry-delay", @"3",
        self.uploadURL
    ];
    self.task.standardInput = inputPipe;
    self.task.standardOutput = outputPipe;
    self.task.standardError = errorPipe;

    NSFileHandle *writeHandle = [inputPipe fileHandleForWriting];
    NSFileHandle *readOutput = [outputPipe fileHandleForReading];
    NSFileHandle *readError = [errorPipe fileHandleForReading];

    [self.task launch];

    // 写数据（分段写入）
    dispatch_async(self.queue, ^{
        NSData *data = [NSData dataWithContentsOfFile:self.filePath];
        if (!data) {
            NSLog(@"❌ Failed to read file data");
            if (self.onFailure) {
                self.onFailure([NSError errorWithDomain:@"CurlUploadTask"
                                                    code:500
                                                userInfo:@{NSLocalizedDescriptionKey: @"Failed to read file data"}]);
            }
            return;
        }

        for (NSUInteger offset = 0; offset < data.length; offset += self.chunkSize) {
            if (!self.task.isRunning) break;

            NSData *chunk = [data subdataWithRange:NSMakeRange(offset, MIN(self.chunkSize, data.length - offset))];
            @try {
                [writeHandle writeData:chunk];
            } @catch (NSException *e) {
                NSLog(@"❌ Write error: %@", e);
                if (self.task.isRunning) [self.task terminate];
                break;
            }
        }

        [writeHandle closeFile];
    });

    // 超时机制
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.timeout * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.task.isRunning) {
            NSLog(@"⏰ Task timed out. Killing.");
            [self.task terminate];
        }
    });

    // 处理完成
    dispatch_async(self.queue, ^{
        [self.task waitUntilExit];

        NSData *outData = [readOutput readDataToEndOfFile];
        NSData *errData = [readError readDataToEndOfFile];
        NSString *outStr = [[NSString alloc] initWithData:outData encoding:NSUTF8StringEncoding];
        NSString *errStr = [[NSString alloc] initWithData:errData encoding:NSUTF8StringEncoding];

        if (self.task.terminationStatus == 0) {
            if (self.onSuccess) {
                self.onSuccess(outStr.length > 0 ? outStr : @"Upload succeeded.");
            }
        } else {
            if (self.onFailure) {
                NSString *msg = [NSString stringWithFormat:@"Upload failed: %@", errStr.length > 0 ? errStr : @"Unknown error"];
                NSError *err = [NSError errorWithDomain:@"CurlUploadTask"
                                                   code:self.task.terminationStatus
                                               userInfo:@{NSLocalizedDescriptionKey: msg}];
                self.onFailure(err);
            }
        }
    });
}

#pragma mark - 🔥 模拟 Broken Pipe 测试接口

+ (void)simulateBrokenPipeWrite {
    NSLog(@"🚨 模拟 Broken Pipe 开始");
    NSPipe *pipe = [NSPipe pipe];
    NSFileHandle *writeHandle = [pipe fileHandleForWriting];
    NSFileHandle *readHandle = [pipe fileHandleForReading];

    // 模拟 curl 提前关闭 pipe：关闭读取端
    [readHandle closeFile];

    NSData *data = [@"Simulate broken pipe" dataUsingEncoding:NSUTF8StringEncoding];

    @try {
        [writeHandle writeData:data];  // 这里必定报错
        NSLog(@"✅ Unexpected: Write succeeded");
    } @catch (NSException *e) {
        NSLog(@"❌ 捕捉到模拟异常: %@", e);
    } @finally {
        [writeHandle closeFile];
    }
    NSLog(@"🔚 模拟 Broken Pipe 完成");
}

@end



