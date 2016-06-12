//
//  PostCellView.h
//  coolPlacesObjC
//
//  Created by Maciej Serwicki on 6/7/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostModel.h"
#import "DataArchiver.h"

@interface PostCellView : UITableViewCell {
    DataArchiver *archiver;
}
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *postTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *postDescriptionLabel;


- (void)configureCellWithPost: (PostModel*)post;

@end
