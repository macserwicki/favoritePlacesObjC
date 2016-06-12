//
//  ViewController.h
//  coolPlacesObjC
//
//  Created by Maciej Serwicki on 6/3/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataArchiver.h"
#import "PostCellView.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *posts;
@property PostModel *postModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void) postsLoaded:(NSNotification *)notification;



@end

