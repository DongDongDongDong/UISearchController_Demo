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
    self.tableView.tableFooterView = [[UIView alloc]init];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.resultsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RESULT_CELL"];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"RESULT_CELL" forIndexPath:indexPath];
    }
    cell.textLabel.text = self.resultsArray[indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *title = self.resultsArray[indexPath.row];
    NSString *num = [NSString stringWithFormat:@"第%ld行",indexPath.row + 1 ];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:num message:title delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
