//
//  ViewController.m
//  preloadListData
//
//  Created by DragonLi on 2018/1/19.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak,nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)NSMutableArray *datas;
@property (strong,nonatomic)NSMutableArray *indesPaths;
@property (assign,nonatomic)CGFloat dataArrayNumber;
@property (strong,nonatomic)NSTimer * timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.datas = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
    self.dataArrayNumber = -1;
    NSMutableArray *indexPaths = @[].mutableCopy;
    self.indesPaths = indexPaths;
    self.timer =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(showCells) userInfo:nil repeats:YES];
}

-(void)showCells{
    self.dataArrayNumber = self.dataArrayNumber +1;
    if (self.dataArrayNumber < self.datas.count) {
        [self.indesPaths addObject:[NSIndexPath indexPathForItem:self.dataArrayNumber inSection:0]];
        [self.tableView insertRowsAtIndexPaths:self.indesPaths withRowAnimation:UITableViewRowAnimationRight];
        [self.indesPaths removeAllObjects];
    }else{
        [self.timer invalidate];
        self.timer = nil;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArrayNumber + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

@end
