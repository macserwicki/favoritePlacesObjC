//
//  ViewController.m
//  coolPlacesObjC
//
//  Created by Maciej Serwicki on 6/3/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    self.posts = [[NSMutableArray alloc] init];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postsLoaded:) name:@"postsLoaded" object:nil];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.tableView reloadData];
    [[DataArchiver instance] loadPosts];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
    PostModel *post = [[DataArchiver instance]loadedPosts][indexPath.row];
 
    PostCellView *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCellView"];
    
    if (cell) {
        [cell configureCellWithPost:post];
        return cell;
    } else {
        cell = [[PostCellView alloc] init];
        [cell configureCellWithPost: post];
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(int)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[DataArchiver instance]loadedPosts]count];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [[[DataArchiver instance] loadedPosts] removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) postsLoaded:(NSNotification *)notification {
    [self.tableView reloadData];
}

@end
