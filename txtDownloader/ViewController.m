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

