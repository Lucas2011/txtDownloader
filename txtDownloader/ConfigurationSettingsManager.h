//
//  ConfigurationSettingsManager.h
//  picker
//
//  Created by Lucas on 8/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConfigurationSettingsManager : NSObject

@property (nonatomic, assign) BOOL isLoggingOn;
@property (nonatomic, strong) NSString *selectedPath;
@property (nonatomic, assign) NSInteger rebootCount;
@property (nonatomic, assign) BOOL isRebootInProgress; 

@property (nonatomic, assign) NSInteger rebootCountB;
@property (nonatomic, assign) BOOL isRebootInProgressB;
@property (nonatomic, assign) BOOL isLoggingBOn;

+ (instancetype)sharedManager;

@end

NS_ASSUME_NONNULL_END
