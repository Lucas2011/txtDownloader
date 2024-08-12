//
//  ConfigurationSettingsManager.m
//  picker
//
//  Created by Lucas on 8/12/24.
//

#import "ConfigurationSettingsManager.h"

// Define private keys as macros
#define KEY_IS_LOGGING_ON @"isLoggingOn"
#define KEY_IS_LOGGING_B_ON @"isLoggingBOn"
#define KEY_SELECTED_PATH @"selectedPath"
#define KEY_REBOOT_COUNT @"rebootCount"
#define KEY_IS_REBOOT_IN_PROGRESS @"isRebootInProgress"
#define KEY_REBOOT_COUNT_B @"rebootCountB"
#define KEY_IS_REBOOT_IN_PROGRESS_B @"isRebootInProgressB"
#define KEY_CONFIGURATION_SETTINGS @"configurationSettings"

@implementation ConfigurationSettingsManager

+ (instancetype)sharedManager {
    static ConfigurationSettingsManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // Check if there is existing data in NSUserDefaults
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *settings = [defaults dictionaryForKey:KEY_CONFIGURATION_SETTINGS];
        
        if (settings) {
            // Load data if available
            self.isLoggingOn = [[settings objectForKey:KEY_IS_LOGGING_ON] boolValue];
            self.isLoggingBOn = [[settings objectForKey:KEY_IS_LOGGING_B_ON] boolValue];
            self.selectedPath = [settings objectForKey:KEY_SELECTED_PATH];
            self.rebootCount = [[settings objectForKey:KEY_REBOOT_COUNT] integerValue];
            self.isRebootInProgress = [[settings objectForKey:KEY_IS_REBOOT_IN_PROGRESS] boolValue];
            self.rebootCountB = [[settings objectForKey:KEY_REBOOT_COUNT_B] integerValue];
            self.isRebootInProgressB = [[settings objectForKey:KEY_IS_REBOOT_IN_PROGRESS_B] boolValue];
        } else {
            // Set default values if no data is found
            _isLoggingOn = NO;
            _selectedPath = @"";
            _rebootCount = 0;
            _isRebootInProgress = NO;
            _rebootCountB = 0;
            _isRebootInProgressB = NO;
            _isLoggingBOn = NO;
        }
    }
    return self;
}

- (void)loadData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *settings = [defaults dictionaryForKey:KEY_CONFIGURATION_SETTINGS];
    
    if (settings) {
        self.isLoggingOn = [[settings objectForKey:KEY_IS_LOGGING_ON] boolValue];
        self.isLoggingBOn = [[settings objectForKey:KEY_IS_LOGGING_B_ON] boolValue];
        self.selectedPath = [settings objectForKey:KEY_SELECTED_PATH];
        self.rebootCount = [[settings objectForKey:KEY_REBOOT_COUNT] integerValue];
        self.isRebootInProgress = [[settings objectForKey:KEY_IS_REBOOT_IN_PROGRESS] boolValue];
        self.rebootCountB = [[settings objectForKey:KEY_REBOOT_COUNT_B] integerValue];
        self.isRebootInProgressB = [[settings objectForKey:KEY_IS_REBOOT_IN_PROGRESS_B] boolValue];
    }
}

- (void)saveData {
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    [settings setObject:@(self.isLoggingOn) forKey:KEY_IS_LOGGING_ON];
    [settings setObject:@(self.isLoggingBOn) forKey:KEY_IS_LOGGING_B_ON];
    [settings setObject:self.selectedPath forKey:KEY_SELECTED_PATH];
    [settings setObject:@(self.rebootCount) forKey:KEY_REBOOT_COUNT];
    [settings setObject:@(self.isRebootInProgress) forKey:KEY_IS_REBOOT_IN_PROGRESS];
    [settings setObject:@(self.rebootCountB) forKey:KEY_REBOOT_COUNT_B];
    [settings setObject:@(self.isRebootInProgressB) forKey:KEY_IS_REBOOT_IN_PROGRESS_B];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:settings forKey:KEY_CONFIGURATION_SETTINGS];
    [defaults synchronize];
}

#pragma mark Setter Logging A
- (void)setIsLoggingOn:(BOOL)isLoggingOn {
    if (_isLoggingOn != isLoggingOn) {
        _isLoggingOn = isLoggingOn;
        [self saveData];
    }
}

- (void)setSelectedPath:(NSString *)selectedPath {
    if (![selectedPath isEqualToString:_selectedPath]) {
        _selectedPath = [selectedPath copy];
        [self saveData];
    }
}

- (void)setRebootCount:(NSInteger)rebootCount {
    if (_rebootCount != rebootCount) {
        _rebootCount = rebootCount;
        [self saveData];
    }
}

- (void)setIsRebootInProgress:(BOOL)isRebootInProgress {
    if (_isRebootInProgress != isRebootInProgress) {
        _isRebootInProgress = isRebootInProgress;
        [self saveData];
    }
}


#pragma mark Setter Logging B
-(void)setIsLoggingBOn:(BOOL)isLoggingBOn {
    if (_isLoggingBOn != isLoggingBOn) {
        _isLoggingBOn = isLoggingBOn;
        [self saveData];
    }
}
- (void)setRebootCountB:(NSInteger)rebootCountB {
    if (_rebootCountB != rebootCountB) {
        _rebootCountB = rebootCountB;
        [self saveData];
    }
}

- (void)setIsRebootInProgressB:(BOOL)isRebootInProgressB {
    if (_isRebootInProgressB != isRebootInProgressB) {
        _isRebootInProgressB = isRebootInProgressB;
        [self saveData];
    }
}



@end


