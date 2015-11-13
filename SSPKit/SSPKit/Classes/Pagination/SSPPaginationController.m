//
//  SSPPaginationController.m
//  SSPKit
//
//  Created by Mikhail on 07/11/15.
//  Copyright © 2015 Softinform. All rights reserved.
//

#import "SSPPaginationController.h"

const NSInteger SSPPaginationControllerDefaultLimit = 20;

@interface SSPPaginationController ()

@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) id<SSPPaginationFetchOperation> fetchOperation;
@property (nonatomic) BOOL shouldFetchMore;

@end

@implementation SSPPaginationController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.limit = SSPPaginationControllerDefaultLimit;
        self.shouldFetchMore = YES;
        self.items = [NSMutableArray array];
    }
    return self;
}

- (void)fetchItemsWithOffset:(NSInteger)offset limit:(NSInteger)limit {
    NSAssert(self.fetchOperation == nil, @"Fetch operation already in process");
    self.fetchOperation = [self.delegate paginationController:self fetchOperationWithOffset:offset limit:self.limit];
}

- (void)didFetchItems:(NSArray *)items offset:(NSInteger)offset {
    self.fetchOperation = nil;
    self.shouldFetchMore = self.limit != NSNotFound && [items count] >= self.limit;
    
    if ([self.items count] > offset) {
        NSRange range = {offset, [self.items count] - offset};
        [self.items removeObjectsInRange:range];
        
        if ([self.delegate respondsToSelector:@selector(paginationController:didRemoveItemsInRange:)]) {
            [self.delegate paginationController:self didRemoveItemsInRange:range];
        }
    }
    NSRange range = NSMakeRange(self.items.count, items.count);
    [self.items addObjectsFromArray:items];
    
    if ([self.delegate respondsToSelector:@selector(paginationController:didAddItemsInRange:)]) {
        [self.delegate paginationController:self didAddItemsInRange:range];
    }
}

- (void)didFailWithError:(NSError *)error {
    self.fetchOperation = nil;
}

- (void)refresh {
    [self cancelFetching];
    [self fetchItemsWithOffset:0 limit:self.limit];
}

- (void)cancelFetching {
    [self.fetchOperation cancel];
    id<SSPPaginationFetchOperation> operation = self.fetchOperation;
    self.fetchOperation = nil;
    
    if ([self.delegate respondsToSelector:@selector(paginationController:didCancelFetchOperation:)]) {
        [self.delegate paginationController:self didCancelFetchOperation:operation];
    }
}

- (void)reset {
    [self cancelFetching];
    [self.items removeAllObjects];
    self.shouldFetchMore = YES;
}

- (BOOL)isFetching {
    return self.fetchOperation != nil;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1 &&
        ![self isFetching] && self.shouldFetchMore) {
        [self fetchItemsWithOffset:[self offset] limit:self.limit];
    }
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[indexPath.row];
}

- (NSInteger)numberOfItems {
    return self.items.count;
}

- (NSInteger)offset {
    return [self numberOfItems];
}

@end
