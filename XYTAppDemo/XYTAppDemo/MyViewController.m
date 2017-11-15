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
}

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"mytableView";
    tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 640) style:UITableViewStylePlain];
    tabView.delegate = self;
    tabView.dataSource = self;
    tabView.backgroundColor = [UIColor cyanColor];
    tabView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopic)];
    //自动更改透明度
    tabView.mj_header.automaticallyChangeAlpha = YES;
    
    //进入刷新状态
    [tabView.mj_header beginRefreshing];
    [self.view addSubview:tabView];
    
    // Do any additional setup after loading the view.
}

-(void)loadNewTopic{
    
   [tabView.mj_header endRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tabView dequeueReusableCellWithIdentifier:@"swdqd"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"swdqd"];
        cell.textLabel.text = @"1212121212";
        
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

