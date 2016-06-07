//
//  DataArchiver.m
//  coolPlacesObjC
//
//  Created by Maciej Serwicki on 6/5/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//
#import "DataArchiver.h"

@implementation DataArchiver 

#define KEY_POSTS "posts"

+ (id) instance {
    static DataArchiver *instance = nil;
    
    @synchronized (self) {
        if (instance == nil) {
            instance = [[DataArchiver alloc] init];
        }
    }
    return instance;
}

- (id) init {
    if (self = [super init]) {
        
        _loadedPosts = [[NSMutableArray alloc] init];
        defaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (void)savePosts {
    //returns data object
    NSData *postsData = [NSKeyedArchiver archivedDataWithRootObject:_loadedPosts];
    NSString *key = [NSString stringWithFormat:@"%s",KEY_POSTS];
    [defaults setObject:postsData forKey: key];
    [defaults synchronize];
}

- (void)loadPosts {
    
    NSString *key = [NSString stringWithFormat:@"%s",KEY_POSTS];
    NSData *postsData = [defaults objectForKey: key];
    
    if (postsData != nil) {
    
    NSMutableArray *postArray = [NSKeyedUnarchiver unarchiveObjectWithData:postsData];
    
    if (postArray != nil) {
        _loadedPosts = postArray;
    }
    
    NSNotificationCenter *notif = [[NSNotificationCenter alloc] init];
    [notif postNotificationName:@"postsLoaded" object:nil];
    }
}

- (NSString*)saveImageAndCreatePathWithImage:(UIImage*)image {
    NSData *imgData = UIImagePNGRepresentation(image);
    NSString *imgPath = [NSString stringWithFormat:@"image%f.png", [NSDate timeIntervalSinceReferenceDate]];
    NSString *fullPath = [self documentsPathForFileName:imgPath];
    [imgData writeToFile:fullPath atomically:YES];
    return imgPath;
}

- (UIImage* _Nullable) imageForPathString:(NSString*)path {
    NSString *fullPath = [self documentsPathForFileName:path];
    UIImage *img = [UIImage imageNamed:fullPath];
    return img;
}

- (void)addPost:(PostModel*)post {
    [_loadedPosts addObject:post];
    [self savePosts];
    [self loadPosts];
    
}

- (NSString*)documentsPathForFileName:(NSString*)name {
    NSArray<NSString*> *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fullPath = [paths objectAtIndex:0];
    return [fullPath stringByAppendingPathComponent:name];
}


@end
