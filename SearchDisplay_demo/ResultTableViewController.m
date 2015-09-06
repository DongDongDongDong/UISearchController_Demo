//
//  ResultTableViewController.m
//  SearchDisplay_demo
//
//  Created by andylau on 15/9/6.
//  Copyright (c) 2015年 andylau. All rights reserved.
//

#import "ResultTableViewController.h"

@interface ResultTableViewController ()

@end

@implementation ResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.resultsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    }
    cell.textLabel.text = self.resultsArray[indexPath.row];
    return cell;
}


@end
