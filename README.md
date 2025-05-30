#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject
- (void)loadData;
@end

@implementation NetworkManager {
    dispatch_queue_t _syncQueue;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _syncQueue = dispatch_queue_create("com.example.syncQueue", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)loadData {
    dispatch_group_t group = dispatch_group_create();

    __block NSMutableArray *results = [NSMutableArray array];

    for (int i = 0; i < 3; i++) {
        dispatch_group_enter(group);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(arc4random_uniform(2) + 1);
            NSString *result = [NSString stringWithFormat:@"Result %d", i];

            dispatch_barrier_sync(self->_syncQueue, ^{
                [results addObject:result];
            });

            dispatch_group_leave(group);
        });
    }

    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"All data loaded: %@", results);
    });
}

@end