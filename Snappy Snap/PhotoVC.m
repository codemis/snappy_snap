#import "PhotoVC.h"
#import "SnappySnapVC.h"
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
    SnappySnapVC *snappySnapVC = ((UINavigationController*) self.presentingViewController).viewControllers[0];
    self.delegate = (id)snappySnapVC;
}
@end
