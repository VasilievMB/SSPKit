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

#pragma mark - SSPPaginationController delegate

- (NSOperation *)paginationController:(SSPPaginationController *)paginationController
             fetchOperationWithOffset:(NSInteger)offset
                                limit:(NSInteger)limit SSP_ABSTRACT_METHOD

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
