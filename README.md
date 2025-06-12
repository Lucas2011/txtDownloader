#import "WatchAlertView.h"

@interface WatchAlertView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIButton *yesButton;
@property (nonatomic, strong) UIButton *noButton;
@property (nonatomic, copy) WatchAlertCallback callback;
@property (nonatomic, assign) BOOL responded;
@end

@implementation WatchAlertView

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                    showNoBtn:(BOOL)showNo
                     callback:(WatchAlertCallback)callback {
    
    self = [super initWithFrame:CGRectMake(0, 0, 180, 150)];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        self.layer.cornerRadius = 12;
        self.callback = callback;
        self.responded = NO;
        
        CGFloat w = self.bounds.size.width;

        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, w - 20, 20)];
        _titleLabel.text = title;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [self addSubview:_titleLabel];

        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, w - 20, 40)];
        _messageLabel.text = message;
        _messageLabel.textColor = [UIColor lightGrayColor];
        _messageLabel.numberOfLines = 2;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_messageLabel];

        _yesButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_yesButton setTitle:@"Yes" forState:UIControlStateNormal];
        _yesButton.frame = CGRectMake(showNo ? 20 : (w - 60)/2, 90, 60, 30);
        [_yesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _yesButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _yesButton.layer.borderWidth = 1;
        _yesButton.layer.cornerRadius = 5;
        [_yesButton addTarget:self action:@selector(yesTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_yesButton];

        if (showNo) {
            _noButton = [UIButton buttonWithType:UIButtonTypeSystem];
            [_noButton setTitle:@"No" forState:UIControlStateNormal];
            _noButton.frame = CGRectMake(w - 80, 90, 60, 30);
            [_noButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            _noButton.layer.borderColor = [UIColor whiteColor].CGColor;
            _noButton.layer.borderWidth = 1;
            _noButton.layer.cornerRadius = 5;
            [_noButton addTarget:self action:@selector(noTapped) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_noButton];
        }
    }
    return self;
}

- (void)showInView:(UIView *)parentView timeout:(NSTimeInterval)timeout {
    self.center = parentView.center;
    self.alpha = 0;
    [parentView addSubview:self];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1.0;
    }];
    
    if (timeout > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (!self.responded && self.callback) {
                self.responded = YES;
                self.callback(nil); // Timeout
                [self removeFromSuperview];
            }
        });
    }
}

- (void)yesTapped {
    if (self.callback && !self.responded) {
        self.responded = YES;
        self.callback(@"yes");
    }
    [self removeFromSuperview];
}

- (void)noTapped {
    if (self.callback && !self.responded) {
        self.responded = YES;
        self.callback(@"no");
    }
    [self removeFromSuperview];
}

@end


#import <UIKit/UIKit.h>

typedef void (^WatchAlertCallback)(NSString * _Nullable result);

@interface WatchAlertView : UIView

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                    showNoBtn:(BOOL)showNo
                     callback:(WatchAlertCallback)callback;

- (void)showInView:(UIView *)parentView timeout:(NSTimeInterval)timeout;

@end

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                    showNoBtn:(BOOL)showNo
                     callback:(WatchAlertCallback)callback {

    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGFloat alertWidth = screenBounds.size.width * 0.85;
    CGFloat alertHeight = 140;

    self = [super initWithFrame:CGRectMake(0, 0, alertWidth, alertHeight)];
    if (self) {
        self.center = CGPointMake(screenBounds.size.width / 2, screenBounds.size.height / 2);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.85];
        self.layer.cornerRadius = 12;
        self.callback = callback;
        self.responded = NO;

        CGFloat padding = 10;

        // Title Label
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, padding, alertWidth - 2*padding, 20)];
        self.titleLabel.text = title;
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [self addSubview:self.titleLabel];

        // Message Label
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, 35, alertWidth - 2*padding, 40)];
        self.messageLabel.text = message;
        self.messageLabel.textColor = [UIColor lightGrayColor];
        self.messageLabel.numberOfLines = 2;
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        self.messageLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.messageLabel];

        // Buttons
        CGFloat buttonWidth = 60;
        CGFloat buttonHeight = 30;
        CGFloat buttonY = 90;

        // Yes Button
        self.yesButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.yesButton setTitle:@"Yes" forState:UIControlStateNormal];
        self.yesButton.frame = showNo ?
            CGRectMake(alertWidth / 2 - buttonWidth - 10, buttonY, buttonWidth, buttonHeight) :
            CGRectMake((alertWidth - buttonWidth) / 2, buttonY, buttonWidth, buttonHeight);

        [self.yesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.yesButton.layer.borderColor = [UIColor whiteColor].CGColor;
        self.yesButton.layer.borderWidth = 1;
        self.yesButton.layer.cornerRadius = 5;
        [self.yesButton addTarget:self action:@selector(yesTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.yesButton];

        if (showNo) {
            self.noButton = [UIButton buttonWithType:UIButtonTypeSystem];
            [self.noButton setTitle:@"No" forState:UIControlStateNormal];
            self.noButton.frame = CGRectMake(alertWidth / 2 + 10, buttonY, buttonWidth, buttonHeight);
            [self.noButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal]; // 红色文字
            self.noButton.layer.borderColor = [UIColor redColor].CGColor;
            self.noButton.layer.borderWidth = 1;
            self.noButton.layer.cornerRadius = 5;
            [self.noButton addTarget:self action:@selector(noTapped) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:self.noButton];
        }
    }
    return self;
}
