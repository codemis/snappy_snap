#import "DropboxActivity.h"

@interface DropboxActivity ()
@property(strong,nonatomic)UIImage *snapImage;
@end

@implementation DropboxActivity
+(NSString *)bundleIdentifier {
    NSString *infoPlistPath = [[NSBundle mainBundle] pathForResource:@"Info"
                                                              ofType:@"plist"];
    NSData *infoPlistData =[NSData dataWithContentsOfFile:infoPlistPath];
    NSError *error = nil;
    NSDictionary *infoPlist =
    [NSPropertyListSerialization propertyListWithData:infoPlistData
                                              options:0
                                               format:NULL
                                                error:&error];
    return infoPlist[@"CFBundleIdentifier"];
}
-(UIImage *)activityImage {
    return [UIImage imageNamed:@"Dropbox icon.png"];
}
-(NSString *)activityTitle {
    return @"Save Snap To Dropbox";
}
-(NSString *)activityType {
    return [NSString stringWithFormat:@"%@.DropboxActivity",
             [self.class bundleIdentifier]];
}
-(BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    for (id item in activityItems)
        if ([item class] != [UIImage class]) return NO;
    return YES;
}
-(void)prepareWithActivityItems:(NSArray *)activityItems {
    for (id item in activityItems)
        self.snapImage = item;
}
-(void)performActivity {
    
    [self activityDidFinish:YES];
}
@end
