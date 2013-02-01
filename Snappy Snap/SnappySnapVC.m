#import "SnappySnapVC.h"
@interface SnappySnapVC ()
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@end
@implementation SnappySnapVC
#pragma mark - Image picker delegate methods
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	self.photoView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
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
