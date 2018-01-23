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
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "WZVideo.h"

@interface WZLoginViewController ()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playerItem;


@end

@implementation WZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 添加子控件
    [self addChildViews];
    
}



// 改方法弹出一个控制器播放视频
- (void)buttonClick {
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"MV" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:videoPath];
    AVPlayer *player = [AVPlayer playerWithURL:url];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    [self presentViewController:playerViewController animated:YES completion:nil];
    [playerViewController.player play];
}

- (void)addChildViews {
    
    WZVideo *video = [[WZVideo alloc] initWithFrame:self.view.bounds andURL:[[NSBundle mainBundle] pathForResource:@"MV" ofType:@"mp4"]];
    [self.view addSubview:video];
    
    __weak typeof(self) weakSelf = self;
    WZLoginView *loginView = [[WZLoginView alloc]  initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [loginView nextVCButtonClick:^(NSString *account, NSString *password) {
        NSLog(@"%@--%@", account, password);
        if (account.length > 0 && password > 0) {
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        } else {
            NSLog(@"请输入账号密码");
        }
    }];
    [self.view addSubview:loginView];
    
}

@end
