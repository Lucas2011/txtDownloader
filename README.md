
#import <UIKit/UIKit.h>

typedef void (^WatchAlertCallback)(NSString * _Nullable result);

@interface WatchAlertView : UIView

/// 初始化 Alert
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                    showNoBtn:(BOOL)showNo
                     callback:(WatchAlertCallback)callback;

/// 展示 Alert（传入父视图 & 超时时间）
- (void)showInView:(UIView *)parentView timeout:(NSTimeInterval)timeout;

@end

#import "WatchAlertView.h"
#import <QuartzCore/QuartzCore.h>

@interface WatchAlertView ()
@property (nonatomic, strong) UIVisualEffectView *blurView;
@property (nonatomic, strong) UIView *dialogView;
@property (nonatomic, copy) WatchAlertCallback callback;
@property (nonatomic, assign) BOOL responded;
@end

@implementation WatchAlertView

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                    showNoBtn:(BOOL)showNo
                     callback:(WatchAlertCallback)callback {
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    self = [super initWithFrame:screenBounds];
    if (self) {
        self.callback = callback;
        self.responded = NO;

        // 1️⃣ 模糊背景
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        self.blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
        self.blurView.frame = self.bounds;
        [self addSubview:self.blurView];

        // 2️⃣ 中心弹窗容器
        CGFloat dialogW = screenBounds.size.width * 0.85;
        CGFloat dialogH = 150;
        self.dialogView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, dialogW, dialogH)];
        self.dialogView.center = self.center;
        self.dialogView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.85];
        self.dialogView.layer.cornerRadius = 12;
        [self addSubview:self.dialogView];

        CGFloat padding = 10;

        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, padding, dialogW - 2*padding, 22)];
        titleLabel.text = title;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont boldSystemFontOfSize:16];
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.minimumScaleFactor = 0.5;
        [self.dialogView addSubview:titleLabel];

        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, 40, dialogW - 2*padding, 40)];
        messageLabel.text = message;
        messageLabel.textColor = [UIColor lightGrayColor];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.numberOfLines = 2;
        messageLabel.font = [UIFont systemFontOfSize:14];
        messageLabel.adjustsFontSizeToFitWidth = YES;
        messageLabel.minimumScaleFactor = 0.5;
        [self.dialogView addSubview:messageLabel];

        // 3️⃣ 按钮
        CGFloat buttonY = 95;
        CGFloat buttonW = 60;

        UIButton *yesBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [yesBtn setTitle:@"Yes" forState:UIControlStateNormal];
        [yesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        yesBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        yesBtn.layer.borderWidth = 1;
        yesBtn.layer.cornerRadius = 5;
        [yesBtn addTarget:self action:@selector(yesTapped) forControlEvents:UIControlEventTouchUpInside];

        UIButton *noBtn;
        if (showNo) {
            yesBtn.frame = CGRectMake(dialogW / 2 - 70, buttonY, buttonW, 30);
            noBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            [noBtn setTitle:@"No" forState:UIControlStateNormal];
            [noBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            noBtn.layer.borderColor = [UIColor redColor].CGColor;
            noBtn.layer.borderWidth = 1;
            noBtn.layer.cornerRadius = 5;
            noBtn.frame = CGRectMake(dialogW / 2 + 10, buttonY, buttonW, 30);
            [noBtn addTarget:self action:@selector(noTapped) forControlEvents:UIControlEventTouchUpInside];
            [self.dialogView addSubview:noBtn];
        } else {
            yesBtn.frame = CGRectMake((dialogW - buttonW) / 2, buttonY, buttonW, 30);
        }

        [self.dialogView addSubview:yesBtn];
    }
    return self;
}

- (void)showInView:(UIView *)parentView timeout:(NSTimeInterval)timeout {
    self.alpha = 0;
    [parentView addSubview:self];

    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1.0;
    }];

    if (timeout > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (!self.responded) {
                [self performCallback:@"timeout"];
            }
        });
    }
}

- (void)yesTapped {
    if (!self.responded) {
        [self performCallback:@"yes"];
    }
}

- (void)noTapped {
    if (!self.responded) {
        [self performCallback:@"no"];
    }
}

- (void)performCallback:(NSString *)result {
    self.responded = YES;
    __weak typeof(self) weakSelf = self;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (weakSelf.callback) {
            weakSelf.callback(result);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.2 animations:^{
                weakSelf.alpha = 0;
            } completion:^(BOOL finished) {
                [weakSelf removeFromSuperview];
            }];
        });
    });
}
@end


