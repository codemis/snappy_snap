#import "SnappySnapVC.h"
@interface SnappySnapVC () <UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@end
@implementation SnappySnapVC
#pragma mark - Image picker delegate methods
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.photoView.contentMode = UIViewContentModeScaleAspectFill;
	self.photoView.image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)shareItClicked:(id)sender {
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[self.photoView.image] applicationActivities:nil];
    [self presentViewController:activityVC animated:YES completion:nil];
}
@end
