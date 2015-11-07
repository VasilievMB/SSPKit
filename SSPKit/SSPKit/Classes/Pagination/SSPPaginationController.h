//
//  SSPPaginationController.h
//  SSPKit
//
//  Created by Mikhail on 07/11/15.
//  Copyright © 2015 Softinform. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSInteger SSPPaginationControllerDefaultLimit;

@protocol SSPPaginationController;

@interface SSPPaginationController : NSObject

@property (weak, nonatomic) id<SSPPaginationController> delegate;
@property (nonatomic) NSInteger limit;

- (void)didFetchItems:(NSArray *)items offset:(NSInteger)offset;
- (void)didFailWithError:(NSError *)error;
- (void)refresh;
- (void)reset;
- (NSInteger)offset;
- (BOOL)isFetching;
- (void)cancelFetching;
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfItems;

@end


@protocol SSPPaginationController <NSObject>

- (NSOperation *)paginationController:(SSPPaginationController *)paginationController
             fetchOperationWithOffset:(NSInteger)offset
                                limit:(NSInteger)limit;

@end