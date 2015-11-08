//
//  SSPPaginationViewController.m
//  SSPKit
//
//  Created by Mikhail on 07/11/15.
//  Copyright © 2015 Softinform. All rights reserved.
//

#import "SSPPaginationViewController.h"
#import "SSPAbstractMethod.h"

@interface SSPPaginationViewController ()

@end

@implementation SSPPaginationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.paginationController = [[SSPPaginationController alloc] init];
    self.paginationController.delegate = self;
    
    if ([self showsRefreshControl]) {
        self.refreshControl = [[UIRefreshControl alloc] init];
        [self.tableView addSubview:self.refreshControl];
        [self.refreshControl addTarget:self action:@selector(onRefreshControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
}

- (BOOL)showsRefreshControl {
    return YES;
}

- (void)onRefreshControlValueChanged:(UIRefreshControl *)sender {
    [self.paginationController refresh];
}

- (void)paginationController:(SSPPaginationController *)paginationController didFetchItems:(NSArray *)items offset:(NSInteger)offset {
//    [self.tableView beginUpdates];
    [paginationController didFetchItems:items offset:offset];
//    [self.tableView endUpdates];
    
    [self.tableView reloadData];
    
    [self.refreshControl endRefreshing];
}

- (NSArray *)indexPathsWithRange:(NSRange)range {
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (NSInteger row = range.location; row < range.location + range.length; ++row) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        [indexPaths addObject:indexPath];
    }
    return [indexPaths copy];
}

#pragma mark - SSPPaginationController delegate

- (NSOperation *)paginationController:(SSPPaginationController *)paginationController
             fetchOperationWithOffset:(NSInteger)offset
                                limit:(NSInteger)limit SSP_ABSTRACT_METHOD

//- (void)paginationController:(SSPPaginationController *)paginationController didAddItemsInRange:(NSRange)range {
//    [self.tableView insertRowsAtIndexPaths:[self indexPathsWithRange:range] withRowAnimation:UITableViewRowAnimationAutomatic];
//}
//
//- (void)paginationController:(SSPPaginationController *)paginationController didRemoveItemsInRange:(NSRange)range {
//    [self.tableView deleteRowsAtIndexPaths:[self indexPathsWithRange:range] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark - TableView data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.paginationController numberOfItems];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath SSP_ABSTRACT_METHOD

#pragma mark - TableView delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.paginationController tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
}

@end
