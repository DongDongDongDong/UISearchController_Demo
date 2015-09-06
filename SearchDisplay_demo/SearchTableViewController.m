//
//  SearchTableViewController.m
//  SearchDisplay_demo
//
//  Created by andylau on 15/9/6.
//  Copyright (c) 2015年 andylau. All rights reserved.
//

#import "SearchTableViewController.h"
#import "ResultTableViewController.h"
@interface SearchTableViewController ()<UISearchResultsUpdating,UISearchBarDelegate>
@property (nonatomic, strong) UISearchController *searchContrlller;
@property (nonatomic, strong) NSMutableArray *resultArray;
@property (nonatomic, strong) NSMutableArray *tempsArray;

@end

@implementation SearchTableViewController

-(NSMutableArray *)resultArray{
    if (!_resultArray) {
        _resultArray = [NSMutableArray array];
        for (int i = 1; i < 11 ; i ++) {
            NSString *str = [NSString stringWithFormat:@"num -- %d",i];
            [self.resultArray addObject:str];
        }
    }
    return _resultArray;
}

-(NSMutableArray *)tempsArray{
    if (!_tempsArray) {
        _tempsArray = [NSMutableArray array];
    }
    return _tempsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSearchController];
}

- (void)initSearchController{
    UINavigationController *resultVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"result_nav"];
    self.searchContrlller = [[UISearchController alloc]initWithSearchResultsController:resultVC];
    self.searchContrlller.searchResultsUpdater = self;
    self.searchContrlller.searchBar.frame = CGRectMake(self.searchContrlller.searchBar.frame.origin.x,self.searchContrlller.searchBar.frame.origin.y,self.searchContrlller.searchBar.frame.size.width,44);
    self.tableView.tableHeaderView = self.searchContrlller.searchBar;
    
    
    NSMutableArray *scopeButtonTitles = [NSMutableArray array];
    for (NSString *str in self.resultArray) {
        [scopeButtonTitles addObject:str];
    }
    self.searchContrlller.searchBar.delegate = self;
}



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    }
    cell.textLabel.text = self.resultArray[indexPath.row];
    return cell;
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    UINavigationController *navController = (UINavigationController *)self.searchContrlller.searchResultsController;
    ResultTableViewController *resultVC = (ResultTableViewController *)navController.topViewController;
    [self filterContentForSearchText:self.searchContrlller.searchBar.text];
    resultVC.resultsArray = self.tempsArray;
    [resultVC.tableView reloadData];
}

- (void)filterContentForSearchText:(NSString *)searchText{
    NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;
    [self.tempsArray removeAllObjects];
    for (int i = 0; i < self.resultArray.count; i++) {
        NSString *title = self.resultArray[i];
        NSRange storeRange = NSMakeRange(0, title.length);
        NSRange foundRange = [title rangeOfString:searchText options:searchOptions range:storeRange];
        if (foundRange.length) {
            [self.tempsArray addObject:self.resultArray[i]];
        }
    }
}



@end
