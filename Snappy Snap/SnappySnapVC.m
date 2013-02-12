#import "SnappySnapVC.h"
#import "GSDropboxActivity.h"

@interface SnappySnapVC () <UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UIImageView *fishView;
@property (weak, nonatomic) IBOutlet UIImageView *shareItView;
@end

@implementation SnappySnapVC
-(void) imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
	self.photoView.image = info[UIImagePickerControllerOriginalImage];
    self.fishView.hidden = YES;
    self.shareItView.hidden = NO;
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
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIImagePickerController *imagePickerController = segue.destinationViewController;
#if TARGET_IPHONE_SIMULATOR
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
#else
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
#endif
    imagePickerController.editing = YES;
    imagePickerController.delegate = (id)self;

}
@end
