//
//  WZVideo.m
//  MyProject
//
//  Created by neoby on 2018/1/22.
//  Copyright © 2018年 arther. All rights reserved.
//

#import "WZVideo.h"
#import <AVFoundation/AVFoundation.h>


@interface WZVideo()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playerItem;

@end

@implementation WZVideo

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        
    }
    return self;
}

@end
