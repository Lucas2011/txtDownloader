#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController : UIViewController <UIDocumentPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *openPickerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    openPickerButton.frame = CGRectMake(100, 100, 200, 50);
    [openPickerButton setTitle:@"Open File Picker" forState:UIControlStateNormal];
    [openPickerButton addTarget:self action:@selector(openDocumentPicker) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:openPickerButton];
}

- (void)openDocumentPicker {
    NSArray *documentTypes = @[(NSString *)kUTTypeContent,
                               (NSString *)kUTTypeItem,
                               (NSString *)kUTTypeData,
                               (NSString *)kUTTypePackage];

    UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:documentTypes inMode:UIDocumentPickerModeOpen];
    documentPicker.delegate = self;
    documentPicker.modalPresentationStyle = UIModalPresentationFormSheet;
    
    [self presentViewController:documentPicker animated:YES completion:nil];
}

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls {
    NSURL *selectedFileURL = [urls firstObject];
    
    if (selectedFileURL != nil) {
        NSString *filePath = [selectedFileURL path];
        NSLog(@"Selected file path: %@", filePath);
        
        // You can handle the file path here, e.g., display it on a label or perform further operations
    }
}

- (void)documentPickerWasCancelled:(UIDocumentPickerViewController *)controller {
    NSLog(@"Document picker was cancelled");
}

@end