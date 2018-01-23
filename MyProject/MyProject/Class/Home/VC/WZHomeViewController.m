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

@end

@implementation WZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
//    [self presentViewController:[WZLoginViewController new] animated:YES completion:nil];
    
    WZHomeView *homeView = [[WZHomeView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:homeView];
    
}

@end