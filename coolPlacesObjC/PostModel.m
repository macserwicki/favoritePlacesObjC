//
//  PostModel.m
//  coolPlacesObjC
//
//  Created by Maciej Serwicki on 6/3/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "PostModel.h"

@implementation PostModel


-(id)initWithPostImagePath: (NSString*)imgPath andPostImageTitle:(NSString*)imgTitle andPostDesc:(NSString*)postDesc {

    if (self = [super init]) {
    _postTitleTxt = imgTitle;
    _postImagePath = imgPath;
    _postDescriptionTxt = postDesc;
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _postTitleTxt = (NSString*)[aDecoder decodeObjectForKey:@"postTitle"];
        _postDescriptionTxt = (NSString*)[aDecoder decodeObjectForKey:@"postDescription"];
        _postImagePath = (NSString*)[aDecoder decodeObjectForKey:@"postImagePath"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_postImagePath forKey:@"postImagePath"];
    [aCoder encodeObject:_postTitleTxt forKey:@"postTitle"];
    [aCoder encodeObject:_postDescriptionTxt forKey:@"postDescription"];
}




@end
