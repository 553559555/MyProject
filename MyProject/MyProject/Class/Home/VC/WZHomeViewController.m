//
//  WZHomeViewController.m
//  MyProject
//
//  Created by neoby on 2018/1/22.
//  Copyright © 2018年 arther. All rights reserved.
//

#import "WZHomeViewController.h"
#import "WZLoginViewController.h"
#import "WZHomeView.h"

@interface WZHomeViewController ()

@property (nonatomic, strong) UILabel  *label;

@end

@implementation WZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    [self presentViewController:[WZLoginViewController new] animated:YES completion:nil];
    
    WZHomeView *homeView = [[WZHomeView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:homeView];
    
//    UILabel *(^block)(NSString *) = ^UILabel *(NSString *title) {
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 100, 20)];
//        label.text = title;
//        label.backgroundColor = [UIColor redColor];
//        [self.view addSubview:label];
//        self.label = label;
//        return label;
//    };
//    
//    block(@"123123");
    
}


@end
