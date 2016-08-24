//
//  ViewController.m
//  RYCircleAutoScrollView
//
//  Created by Rainer on 16/8/24.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYViewController.h"
#import "RYCircleAutoScrollView.h"

@interface RYViewController () <RYCircleAutoScrollViewDelegate>

@end

@implementation RYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *imageModelArray = [NSMutableArray array];
    
    // 1.循环添加图片到滚动视图中
    for (int i = 0; i < 5; i++) {
        RYImageModel *imageModel = [[RYImageModel alloc] init];
        
        // 1.1.创建图片视图并设置图片
        NSString *imageName = [NSString stringWithFormat:@"img_%02d", i + 1];
        
        imageModel.imageName = imageName;
        
        [imageModelArray addObject:imageModel];
    }
    
    CGFloat imageScrollViewX = 0;
    CGFloat imageScrollViewY = 0;
    CGFloat imageScrollViewW = self.view.bounds.size.width;
    CGFloat imageScrollViewH = 200;
    
    CGRect frame = CGRectMake(imageScrollViewX, imageScrollViewY, imageScrollViewW, imageScrollViewH);
    
    RYCircleAutoScrollView *circleView = [RYCircleAutoScrollView circleAutoScrollViewWithFrame:frame ImageModelArry:imageModelArray scrollTimeInterval:2.0];
    
    circleView.delegate = self;
    
    self.tableView.tableHeaderView = circleView;
}

- (void)circleAutoScrollView:(RYCircleAutoScrollView *)circleAutoScrollView didClickedAtIndex:(NSInteger)index {
    NSLog(@"========%@=========%ld", circleAutoScrollView, index);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    tableViewCell.textLabel.text = @"测试了";
    
    return tableViewCell;
}

@end
