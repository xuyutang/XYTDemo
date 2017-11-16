//
//  MyViewController.m
//  XYTAppDemo
//
//  Created by iOS-Dev on 2017/11/15.
//  Copyright © 2017年 Administrator. All rights reserved.
//

#import "MyViewController.h"
#import "MJRefresh.h"



@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource> {
    
    UITableView *tabView;
    NSMutableArray *dataArr;
    int index;
}

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArr = [[NSMutableArray alloc] init];
    self.navigationItem.title = @"mytableView";
    tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    tabView.delegate = self;
    tabView.dataSource = self;
    tabView.backgroundColor = [UIColor cyanColor];
    tabView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopic)];
    //自动更改透明度
    tabView.mj_header.automaticallyChangeAlpha = YES;
    
    //进入刷新状态
   // [tabView.mj_header beginRefreshing];
    
    //上拉刷新
    tabView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopic)];
    
   
    [self.view addSubview:tabView];
    
    // Do any additional setup after loading the view.
}

-(void)loadNewTopic{
    
   [tabView.mj_header endRefreshing];
}

-(void)loadMoreTopic {
    [dataArr addObject:[NSString stringWithFormat:@"第%d条数据",index++]];
    
     [tabView.mj_footer endRefreshing];
    [tabView reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tabView dequeueReusableCellWithIdentifier:@"swdqd"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"swdqd"];
        cell.textLabel.text = dataArr[indexPath.row];
        
    }
    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

