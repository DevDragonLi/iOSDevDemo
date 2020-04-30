//
//  ViewController.m
//  preloadListData
//
//  Created by DragonLi on 2018/1/19.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic)  NSMutableArray *datas;

@property (strong, nonatomic)  NSMutableArray *requestPageDatas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configs];
}

- (void)configs{
    self.requestPageDatas =[NSMutableArray array];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.datas = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat totalHeight = scrollView.contentSize.height;
    CGFloat currentHeight = scrollView.contentOffset.y + [UIScreen mainScreen].bounds.size.height;
    NSString * exampleRequestPage = @"1"; // 当前需要请求的下页码
    if (! [self.requestPageDatas containsObject:exampleRequestPage] && totalHeight - currentHeight < 100.0) {
        [self.requestPageDatas addObject:exampleRequestPage];
        [self exampleLoadMordDatas];
    }
}
/**
 example request MordDatas
 */
- (void)exampleLoadMordDatas{
    [self.datas addObjectsFromArray:@[@"11",@"12",@"13",@"14",@"15",@"16"]];
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

@end
