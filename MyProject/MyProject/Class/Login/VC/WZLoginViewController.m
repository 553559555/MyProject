//
//  WZLoginViewController.m
//  MyProject
//
//  Created by neoby on 2018/1/18.
//  Copyright © 2018年 arther. All rights reserved.
//

#import "WZLoginViewController.h"
#import "WZLoginView.h"
#import "Common.h"

@interface WZLoginViewController ()

@end

@implementation WZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViews];
}

- (void)addChildViews {
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    WZLoginView *loginView = [[WZLoginView alloc]  initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [self.view addSubview:loginView];
    
    
}

@end
