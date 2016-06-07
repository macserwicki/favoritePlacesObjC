//
//  DataArchiver.h
//  coolPlacesObjC
//
//  Created by Maciej Serwicki on 6/5/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PostModel.h"

@interface DataArchiver : NSObject {
    NSUserDefaults *defaults;
}

@property (nonatomic, strong) NSMutableArray *loadedPosts;

+ (id)instance;
- (void)savePosts;
- (void)loadPosts;
- (NSString*)saveImageAndCreatePathWithImage:(UIImage*)image;
- (UIImage* _Nullable) imageForPathString:(NSString*)path;
- (void)addPost:(PostModel*)post;
+ (NSString*)documentsPathForFileName:(NSString*)name;

@end
