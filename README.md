#define bbLog(path, format, ...) ExtendedBBLog(path, __FILE__, __LINE__, __PRETTY_FUNCTION__, format, ##__VA_ARGS__)


#import <Foundation/Foundation.h>

void ExtendedBBLog(const char *path, const char *file, int lineNumber, const char *functionName, NSString *format, ...);


#import <Foundation/Foundation.h>
#import <stdarg.h>

void ExtendedBBLog(const char *path, const char *file, int lineNumber, const char *functionName, NSString *format, ...) {
    va_list args;
    va_start(args, format);

    // Format the log message
    NSString *formattedMessage = [[NSString alloc] initWithFormat:format arguments:args];

    // Create the final log message
    NSString *logMessage = [NSString stringWithFormat:@"[%s] %s:%d %s: %@", path, file, lineNumber, functionName, formattedMessage];

    // Output the log message
    NSLog(@"%@", logMessage);

    va_end(args);
}