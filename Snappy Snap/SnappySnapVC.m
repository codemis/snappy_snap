#import "SnappySnapVC.h"
#import "GSDropboxActivity.h"

@interface SnappySnapVC () <UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@end

@implementation SnappySnapVC
-(void) imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
	self.photoView.image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:NO completion:nil];
}
-(IBAction)shareItClicked:(id)sender {
    NSString *snapPath = [NSTemporaryDirectory()
                          stringByAppendingPathComponent:@"snap.jpg"];
    [UIImageJPEGRepresentation(self.photoView.image,1.0)
     writeToFile:snapPath atomically:YES];
    UIActivityViewController *activityVC =
      [[UIActivityViewController alloc]
       initWithActivityItems:@[[NSURL fileURLWithPath:snapPath]]
       applicationActivities:@[[GSDropboxActivity new]]];
    [self presentViewController:activityVC animated:YES completion:nil];
}
@end
