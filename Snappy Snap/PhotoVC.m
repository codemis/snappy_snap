#import "PhotoVC.h"
@interface PhotoVC ()<UIImagePickerControllerDelegate>
@end

@implementation PhotoVC
- (void)viewDidLoad
{
    [super viewDidLoad];
#if TARGET_IPHONE_SIMULATOR
    self.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
#else
    self.sourceType = UIImagePickerControllerSourceTypeCamera;
#endif
    self.editing = YES;
    self.delegate = (id)self.presentingViewController;
}
@end
