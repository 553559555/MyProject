//
//  WZMainTabBarController.m
//  MyProject
//
//  Created by neoby on 2018/1/22.
//  Copyright © 2018年 arther. All rights reserved.
//

#import "WZMainTabBarController.h"
#import "WZHomeViewController.h"
#import "WZSortViewController.h"
#import "WZMeViewController.h"
#import "WZLoginViewController.h"
#import "WZMainNavigationController.h"

@interface WZMainTabBarController ()

@end

@implementation WZMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    [self addChildViewControllers];
    self.title = @"首页";
}

- (void)addChildViewControllers {
    
    [self settingChildVC:[[WZMainNavigationController alloc] initWithRootViewController:[WZHomeViewController new]] title:@"首页" imageName:@"TabBar_Home_nor" selectedImageName:@"TabBar_Home_sel"];
    
    [self settingChildVC:[[WZMainNavigationController alloc] initWithRootViewController:[WZSortViewController new]] title:@"分类" imageName:@"TabBar_Sort_nor" selectedImageName:@"TabBar_Sort_sel"];
    
    [self settingChildVC:[[WZMainNavigationController alloc] initWithRootViewController:[WZMeViewController new]] title:@"我的" imageName:@"TabBar_Me_nor" selectedImageName:@"TabBar_Me_sel"];
    
}

- (void)settingChildVC:(UIViewController *)VC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *selectImage = [UIImage imageNamed:selectedImageName];
    selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    VC.title                    = title;
    VC.tabBarItem.image         = image;
    VC.tabBarItem.selectedImage = selectImage;
    [self addChildViewController:VC];
    
}

@end
