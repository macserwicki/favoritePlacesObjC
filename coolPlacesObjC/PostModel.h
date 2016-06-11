//
//  PostModel.h
//  coolPlacesObjC
//
//  Created by Maciej Serwicki on 6/3/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostModel : NSObject <NSCoding>

@property (nonatomic, strong) NSString *postImagePath;
@property (nonatomic, strong) NSString *postTitleTxt;
@property (nonatomic, strong) NSString *postDescriptionTxt;

-(id)initWithPostImagePath: (NSString*)imgPath andPostImageTitle:(NSString*)imgTitle andPostDesc:(NSString*)postDesc;

-(id)initWithCoder:(NSCoder *)aDecoder;
-(void)encodeWithCoder:(NSCoder *)aCoder;

@end
