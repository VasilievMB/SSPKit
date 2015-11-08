//
//  SSPPaginationViewController.h
//  SSPKit
//
//  Created by Mikhail on 07/11/15.
//  Copyright © 2015 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSPPaginationController.h"

@interface SSPPaginationViewController : UIViewController <SSPPaginationControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) SSPPaginationController *paginationController;

- (BOOL)showsRefreshControl;
- (void)paginationController:(SSPPaginationController *)paginationController didFetchItems:(NSArray *)items offset:(NSInteger)offset;

@end
