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

@interface WZLoginViewController ()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playerItem;


@end

@implementation WZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //获取视频路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MV" ofType:@"mp4"];
    //创建AVPlayerItem
    _playerItem = [AVPlayerItem playerItemWithURL:[NSURL fileURLWithPath:path]];
    //添加给AVPlayer
    self.player = [AVPlayer playerWithPlayerItem:_playerItem];
    //设置视频声音
    self.player.volume = 0;
    //添加监听
    [_playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
    // 创建AVPlayerlayer
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    //设置模式
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    playerLayer.contentsScale = [UIScreen mainScreen].scale;
    playerLayer.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self.view.layer addSublayer:playerLayer];
    // 添加子控件
    [self addChildViews];
    
}

// 监听视频播放完成继续播放
-(void)playbackFinished:(NSNotification *)notification{
    NSLog(@"视频播放完成.");
    // 播放完成后重复播放
    // 跳到最新的时间点开始播放
    [_player seekToTime:CMTimeMake(0, 1)];
    [_player play];
}

//监听视频加载完成开始播放
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    
    if ([keyPath isEqualToString:@"loadedTimeRanges"]){
        
    }else if ([keyPath isEqualToString:@"status"]){
        if (playerItem.status == AVPlayerItemStatusReadyToPlay){
            NSLog(@"playerItem is ready");
            [self.player play];
        } else{
            NSLog(@"load break");
        }
    }
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

- (void)dealloc {
    //释放KVO、通知
    [_playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [_playerItem removeObserver:self forKeyPath:@"status"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)addChildViews {
    
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
