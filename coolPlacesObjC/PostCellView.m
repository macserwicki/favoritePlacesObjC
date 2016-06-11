//
//  PostCellView.m
//  coolPlacesObjC
//
//  Created by Maciej Serwicki on 6/7/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "PostCellView.h"

@implementation PostCellView {

}

- (void)awakeFromNib {
    [super awakeFromNib];
    [[self.postImageView layer] setCornerRadius: self.postImageView.frame.size.width / 2];
    [self.postImageView setClipsToBounds:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)configureCellWithPost: (PostModel*)post {
    _postTitleLabel.text = [post postTitleTxt];
    _postImageView.image = [UIImage imageWithContentsOfFile:[post postImagePath]];
    _postDescriptionLabel.text = [post postDescriptionTxt];
}




@end
