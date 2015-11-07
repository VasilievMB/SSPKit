//
//  SSPPaginationExampleViewController.m
//  SSPKit
//
//  Created by Mikhail on 07/11/15.
//  Copyright © 2015 Softinform. All rights reserved.
//

#import "SSPPaginationExampleViewController.h"

@interface SSPPaginationExampleViewController ()

@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) NSOperationQueue *operationQueue;

@end

@implementation SSPPaginationExampleViewController

- (void)loadView {
    [super loadView];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:tableView];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.operationQueue = [[NSOperationQueue alloc] init];
    
    self.items = [NSMutableArray array];
    for (NSInteger i = 0; i < 100; ++i) {
        [self.items addObject:[NSString stringWithFormat:@"Item %ld", (long)i]];
    }
    
    [self.paginationController refresh];
}

- (NSOperation *)paginationController:(SSPPaginationController *)paginationController
             fetchOperationWithOffset:(NSInteger)offset
                                limit:(NSInteger)limit {
    __weak typeof(self) weakSelf = self;
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:10.0];
    }];
    [operation setCompletionBlock:^{
        NSInteger off = MIN(weakSelf.items.count - 1, offset);
        NSUInteger count = MIN( weakSelf.items.count - off, limit );
        NSArray *itemsForView = [weakSelf.items subarrayWithRange: NSMakeRange(off, count)];
        [weakSelf.paginationController didFetchItems:itemsForView offset:off];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
            [weakSelf.refreshControl endRefreshing];
        });
    }];
    
    [self.operationQueue addOperation:operation];
    
    return operation;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    NSString *item = [self.paginationController itemAtIndexPath:indexPath];
    cell.textLabel.text = item;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
