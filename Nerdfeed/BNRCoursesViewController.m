//
//  ViewController.m
//  Nerdfeed
//
//  Created by Xiao Lu on 7/25/15.
//  Copyright (c) 2015 Xiao Lu. All rights reserved.
//

#import "BNRCoursesViewController.h"

@interface BNRCoursesViewController ()

@property (nonatomic) NSURLSession *session;
@property (nonatomic, copy) NSArray *courses;

@end


@implementation BNRCoursesViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationController.title = @"BNRCourses";
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:nil
                                            delegateQueue:nil];
        [self fetchFeed];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.courses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    NSDictionary *course = self.courses[indexPath.row];
    cell.textLabel.text = course[@"title"];
    return cell;
}

#pragma mark - Custom methods
- (void)fetchFeed
{
    NSString *requestString = @"http://bookapi.bignerdranch.com/courses.json";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req
                                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                     NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                options:0
                                                                                                                  error:nil];
                                                         self.courses = jsonObject[@"courses"];
                                                         NSLog(@"%@", self.courses);
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             [self.tableView reloadData];
                                                         });
                                                     }];
    [dataTask resume];
}

@end