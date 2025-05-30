@interface DataManager : NSObject

@property (nonatomic, strong) NSManagedObjectContext *mainContext;

- (void)updatePersonNameInBackground:(NSString *)newName;

@end


@implementation DataManager

- (instancetype)initWithMainContext:(NSManagedObjectContext *)context {
    self = [super init];
    if (self) {
        _mainContext = context; // 传入主线程 context，通常是 AppDelegate 的 mainContext
    }
    return self;
}

- (void)updatePersonNameInBackground:(NSString *)newName {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 直接使用主线程的 context，线程不安全！
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
        NSError *error = nil;
        NSArray *results = [self.mainContext executeFetchRequest:fetchRequest error:&error]; // ❌

        if (results.count > 0) {
            Person *person = results.firstObject;
            person.name = newName; // 直接在后台线程修改主线程对象，线程不安全！

            NSError *saveError = nil;
            [self.mainContext save:&saveError]; // 直接在后台线程保存主线程 context，线程不安全！
        }
    });

    // 这里创建了一个后台 context，但下面直接操作没有使用 performBlock
    NSManagedObjectContext *backgroundContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    backgroundContext.parentContext = self.mainContext;

    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSError *error = nil;
    NSArray *results = [backgroundContext executeFetchRequest:fetchRequest error:&error]; // ❌ 直接操作后台 context，没用 performBlock

    if (results.count > 0) {
        Person *person = results.firstObject;
        person.name = newName;

        [backgroundContext save:&error]; // 只保存了子 context，没保存 parent context
    }
}

@end