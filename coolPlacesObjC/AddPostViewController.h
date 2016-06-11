//
//  AddPostViewController.h
//  coolPlacesObjC
//
//  Created by Maciej Serwicki on 6/5/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataArchiver.h"

@interface AddPostViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *postTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *postDescriptionTextField;
@property (weak, nonatomic) IBOutlet UIButton *postPhotoBrowserButton;
@property (weak, nonatomic) IBOutlet UIImageView *postPhotoImageView;


@end
