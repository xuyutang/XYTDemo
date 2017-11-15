//
//  ViewController.m
//  XYTNetworkingDemo
//
//  Created by iOS-Dev on 2017/11/13.
//  Copyright © 2017年 Administrator. All rights reserved.
//

#import "ViewController.h"
#import "XYTBaseRequest.h"
#import "XYTLocalManger.h"
#import "MyViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"XYTRequest";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom] ;
    button.frame = CGRectMake(100, 100, 100, 40);
    [button setTitle:@"网络请求" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(loadRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom] ;
    button2.frame = CGRectMake(80, 180, 150, 40);
    [button2 setTitle:@"本地数据保存" forState:UIControlStateNormal];
    
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [button2 addTarget:self action:@selector(dbSaveAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom] ;
    button3.frame = CGRectMake(80, 250, 150, 40);
    [button3 setTitle:@"删除本地数据" forState:UIControlStateNormal];
    
    [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [button3 addTarget:self action:@selector(dbDeleteAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom] ;
    button4.frame = CGRectMake(80, 320, 150, 40);
    [button4 setTitle:@"push" forState:UIControlStateNormal];
    
    [button4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [button4 addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)loadRequest {
    [[XYTBaseRequest shareRequest] getWithUrl:@"https://www.baidu.com" param:nil resultClass:[self class] success:^(id result) {
        NSLog(@"请求成功");
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请求成功" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"点击取消");
            
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"点击确认");
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    } failure:^(NSError *error) {
        NSLog(@"请求失败");
    }];
}

-(void)dbSaveAction {
    
    NSArray *arr = @[@{@"name":@"小明",@"age":@(25)}];
    [[XYTLocalManger manger] saveImformation:arr];
    NSLog(@"8888888888888%@",[[XYTLocalManger manger] getImformation]);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"保存成功" message:[NSString stringWithFormat:@"%@",[[XYTLocalManger manger] getImformation]] preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"好");
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
    //    [[XYTLocalManger manger] deleteTable];
}

-(void)dbDeleteAction {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定删除本地数据？" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [[XYTLocalManger manger] deleteTable];
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

-(void)pushAction {
    MyViewController *myVC = [[MyViewController alloc] init];
    [self.navigationController pushViewController:myVC animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

