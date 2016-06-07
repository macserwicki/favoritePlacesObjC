//
//  DataArchiver.m
//  coolPlacesObjC
//
//  Created by Maciej Serwicki on 6/5/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//
#import "DataArchiver.h"

@implementation DataArchiver {

     NSArray<PostModel*> *loadedPosts; //PostModel Array
    
    
}

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

- (void)savePosts {
    //returns data object
    NSKeyedArchiver *postsData = [NSKeyedArchiver archivedDataWithRootObject:loadedPosts];
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] init];
    NSString *key = [NSString stringWithFormat:@"%s",KEY_POSTS];
    [userDefaults setObject:postsData forKey: key];
    [userDefaults synchronize];
}

- (void)loadPosts {
    
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] init];
    NSString *key = [NSString stringWithFormat:@"%s",KEY_POSTS];
    //    if (x != nil)
    NSData *postsData = [userDefaults objectForKey: key];
    
   NSArray<PostModel*> *postArray = [NSKeyedUnarchiver unarchiveObjectWithData:postsData];
    
    if (postArray != nil) {
        loadedPosts = postArray;
    }
    
    NSNotificationCenter *notif = [[NSNotificationCenter alloc] init];
    [notif postNotificationName:@"postsLoaded" object:nil];
    
}

- (NSString*)saveImageAndCreatePathWithImage:(UIImage*)image {
    NSString *str = @"";
    return str;
}

- (UIImage* _Nullable) imageForPathString:(NSString*)path {
    UIImage *img = [UIImage imageWithContentsOfFile:path];
    return img;
}

- (void)addPost:(PostModel*)post {
    
}

- (NSString*)documentsPathForFileName:(NSString*)name {
    NSString *str = @"";
    return str;
}


@end
