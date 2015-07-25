//
//  ViewController.m
//  Nerdfeed
//
//  Created by Xiao Lu on 7/25/15.
//  Copyright (c) 2015 Xiao Lu. All rights reserved.
//

#import "BNRCoursesViewController.h"

@interface BNRCoursesViewController ()

@end

@implementation BNRCoursesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end