//
//  AddPostViewController.m
//  coolPlacesObjC
//
//  Created by Maciej Serwicki on 6/5/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "AddPostViewController.h"

@interface AddPostViewController ()

@end

@implementation AddPostViewController

UIImagePickerController *imagePicker;
DataArchiver *dataArchiver;

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArchiver = [[DataArchiver alloc] init];
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    _postDescriptionTextField.delegate = self;
    _postTitleTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)savePostButtonPressed:(UIButton *)sender {
    
    NSString *title = _postTitleTextField.text;
    NSString *desc = _postDescriptionTextField.text;
    UIImage *image = _postPhotoImageView.image;
  
    NSString *imagePath;
    
    if (image) {
    
    NSString *imagePath = [[DataArchiver instance] saveImageAndCreatePathWithImage:image];
    }
    
    if (imagePath) {
    
        PostModel *post = [[PostModel alloc] initWithPostImagePath:imagePath andPostImageTitle:title andPostDesc:desc];
        [[DataArchiver instance] addPost:post];
    
    }
  
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)browsePhotosButtonPressed:(UIButton *)sender {
    [sender setTitle:@"" forState: UIControlStateNormal];
    [self presentViewController:imagePicker animated:YES completion:nil];
}


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo {
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
    [self.postPhotoImageView setImage:image];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.postPhotoBrowserButton setTitle:@"Browse Photos" forState: UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
