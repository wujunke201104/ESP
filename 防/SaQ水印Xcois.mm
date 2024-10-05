#import "SaQ水印Xcois.h"

@interface ViewController()

@end

UILabel *Ttime;
UIDevice *myDevice;

@implementation ViewController

static ViewController *extraInfo;

+ (void)load
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        extraInfo = [ViewController new];
        [extraInfo iniview];
    });
}

- (void)iniview
{
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    
    // 设备信息
    myDevice = [UIDevice currentDevice];
    [myDevice setBatteryMonitoringEnabled:YES];
    
    // 计算尺寸调整
    CGFloat additionalSize = 113.4; // 3 cm 转换为点
    CGFloat yOffset = 75.6; // 2 cm 转换为点
    
    // 创建 UILabel 并设置其属性
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 40 + additionalSize;
    CGFloat height = 40 + additionalSize;
    CGFloat xPosition = ([UIScreen mainScreen].bounds.size.width - width) / 2; // 居中计算
    CGFloat yPosition = 20; // 在屏幕顶部

    Ttime = [[UILabel alloc] initWithFrame:CGRectMake(xPosition, yPosition, width, height)];
    Ttime.font = [UIFont fontWithName:@"TimesNewRomanPS-BoldMT" size:27.6]; // 增加字体大小
    Ttime.backgroundColor = [UIColor clearColor]; // 去除背景颜色
    Ttime.layer.cornerRadius = 12;
    Ttime.textAlignment = NSTextAlignmentCenter;
    Ttime.layer.masksToBounds = YES;

    [self updateLabelText]; // 初始设置标签文本
    
    [mainWindow addSubview:Ttime];

    // 开启定时器，每秒更新一次
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateLabelText) userInfo:nil repeats:YES];
}

- (void)updateLabelText
{
    // 获取电池电量
    double batLeft = (float)[myDevice batteryLevel] * 100;
    NSString *text = [NSString stringWithFormat:@"ＩＯＳ - ＡＲＭ%0.0f%% 🔋", batLeft];
    
    // 创建带有轮廓的富文本字符串
    NSDictionary *attributes = @{
        NSForegroundColorAttributeName: [UIColor whiteColor], // 字体颜色
        NSStrokeColorAttributeName: [UIColor blackColor], // 轮廓颜色
        NSStrokeWidthAttributeName: @-3.0 // 负值表示轮廓
    };
    
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text attributes:attributes];
    Ttime.attributedText = attributedText;
}

@end