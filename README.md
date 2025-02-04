#import <Foundation/Foundation.h>

// JSON key constants
static NSString *const kKeyTestType = @"testType";
static NSString *const kKeyFailed = @"failed";
static NSString *const kKeyFailedIteration = @"failedIteration";
static NSString *const kKeyFailedReason = @"faiedReason";
static NSString *const kKeyCommonFailedIterations = @"commonFailedIterations";

@interface TestComparison : NSObject
@end

@implementation TestComparison

+ (void)compareTestResultsWithJSONA:(NSString *)jsonAPath jsonB:(NSString *)jsonBPath {
    NSLog(@"Starting test comparison...");

    // Read JSON files
    NSData *dataA = [NSData dataWithContentsOfFile:jsonAPath];
    NSData *dataB = [NSData dataWithContentsOfFile:jsonBPath];

    if (!dataA || !dataB) {
        NSLog(@"[Error] Failed to read one or both JSON files.");
        return;
    }

    NSError *error;
    NSDictionary *jsonDictA = [NSJSONSerialization JSONObjectWithData:dataA options:NSJSONReadingMutableContainers error:&error];
    NSDictionary *jsonDictB = [NSJSONSerialization JSONObjectWithData:dataB options:NSJSONReadingMutableContainers error:&error];

    if (error) {
        NSLog(@"[Error] JSON parsing failed: %@", error.localizedDescription);
        return;
    }

    NSMutableDictionary *resultDict = [NSMutableDictionary dictionary];

    NSLog(@"Processing test data...");

    // Iterate through testNumber in testType A
    for (NSString *testNumber in jsonDictA) {
        NSDictionary *testA = jsonDictA[testNumber];
        NSDictionary *testB = jsonDictB[testNumber];

//        if (!testB || ![testA[kKeyTestType] isEqualToString:@"A"] || ![testB[kKeyTestType] isEqualToString:@"B"]) {
//            NSLog(@"[Warning] Skipping testNumber %@ due to missing testType B or incorrect type.", testNumber);
//            continue;
//        }

        NSArray *failedA = testA[kKeyFailed];
        NSArray *failedB = testB[kKeyFailed];

        if (![failedA isKindOfClass:[NSArray class]] || ![failedB isKindOfClass:[NSArray class]]) {
            NSLog(@"[Error] Invalid JSON structure for testNumber %@", testNumber);
            continue;
        }

        NSMutableSet *failedIterationsA = [NSMutableSet set];
        NSMutableDictionary *failedReasonA = [NSMutableDictionary dictionary];

        NSMutableSet *failedIterationsB = [NSMutableSet set];
        
        // Record failedIteration and failedReason for testType A
        for (NSDictionary *fail in failedA) {
            if (![fail isKindOfClass:[NSDictionary class]]) continue;

            NSString *iteration = fail[kKeyFailedIteration];
            NSString *reason = fail[kKeyFailedReason];

            if (iteration) {
                [failedIterationsA addObject:iteration];
                failedReasonA[iteration] = reason ? : @"N/A";
            }
        }

        // Record failedIteration for testType B
        for (NSDictionary *fail in failedB) {
            if (![fail isKindOfClass:[NSDictionary class]]) continue;

            NSString *iteration = fail[kKeyFailedIteration];
            if (iteration) {
                [failedIterationsB addObject:iteration];
            }
        }

        // Compute common failed iterations
        NSMutableSet *commonIterations = [failedIterationsA mutableCopy];
        [commonIterations intersectSet:failedIterationsB];

        NSMutableDictionary *commonFailures = [NSMutableDictionary dictionary];
        for (NSString *iteration in commonIterations) {
            commonFailures[iteration] = failedReasonA[iteration];
        }

        // Store result
        resultDict[testNumber] = @{
            kKeyCommonFailedIterations: commonFailures
        };

        NSLog(@"[Info] Processed testNumber %@: Found %lu common failed iterations.", testNumber, (unsigned long)commonIterations.count);
    }

    // Convert result to JSON
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:resultDict options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSLog(@"Comparison completed. Output:\n%@", jsonString);
}

@end

