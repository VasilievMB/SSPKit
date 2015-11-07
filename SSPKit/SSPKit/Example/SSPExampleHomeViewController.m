//
//  SSPExampleHomeViewController.m
//  SSPKit
//
//  Created by Mikhail on 07/11/15.
//  Copyright © 2015 Softinform. All rights reserved.
//

#import "SSPExampleHomeViewController.h"
#import "SSPImagePickerController.h"

@interface SSPExampleHomeViewController ()

@end

@implementation SSPExampleHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.title = @"SSPKit";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"Pick photo";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [SSPImagePickerController pickImageWithPresentingViewController:self
                                                         sourceType:UIImagePickerControllerSourceTypeCamera
                                                         completion:^(UIImagePickerController *picker, NSDictionary *info) {
                                                             UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
                                                             
                                                         } failure:^{
                                                             NSLog(@"Failed to pick photo");
                                                         }];
}

@end
