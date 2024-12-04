+ (NSArray<NSString *> *)subpathsAtPath:(NSString *)path withLevel:(NSInteger)level {
    if (level <= 0 || ![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        return @[];
    }

    NSMutableArray<NSString *> *result = [NSMutableArray array];
    NSArray<NSString *> *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];

    for (NSString *item in contents) {
        NSString *fullPath = [path stringByAppendingPathComponent:item];
        [result addObject:item];

        BOOL isDirectory = NO;
        [[NSFileManager defaultManager] fileExistsAtPath:fullPath isDirectory:&isDirectory];

        if (isDirectory && level > 1) {
            NSArray<NSString *> *subpaths = [self subpathsAtPath:fullPath withLevel:level - 1];
            for (NSString *subpath in subpaths) {
                [result addObject:[item stringByAppendingPathComponent:subpath]];
            }
        }
    }

    return result;
}

