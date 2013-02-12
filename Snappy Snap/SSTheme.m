#import "SSTheme.h"
@implementation SSTheme
+(void)applyStyle
{
    UINavigationBar *navBarProxy = [UINavigationBar appearance];
    [navBarProxy setTitleTextAttributes:
     @{
        UITextAttributeTextColor: [UIColor whiteColor],
        UITextAttributeFont: [UIFont fontWithName:@"Cooper STD" size:17.0]
     }];
    [navBarProxy setTitleVerticalPositionAdjustment:4 forBarMetrics:UIBarMetricsDefault];
}
@end
