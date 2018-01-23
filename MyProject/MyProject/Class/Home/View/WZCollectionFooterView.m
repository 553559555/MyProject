//
//  WZCollectionFooterView.m
//  MyProject
//
//  Created by neoby on 2018/1/23.
//  Copyright © 2018年 arther. All rights reserved.
//

#import "WZCollectionFooterView.h"
#import <Masonry.h>
#import "Common.h"

@interface WZCollectionFooterView()

@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation WZCollectionFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addChildViews];
        [self addLayoutViews];
    }
    return self;
}

- (void)addChildViews {
    
    _nextButton = [[UIButton alloc] init];
    [_nextButton setTitle:@"查看更多 》" forState:UIControlStateNormal];
    [_nextButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    _nextButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_nextButton];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    [self addSubview:_lineView];
    
}

- (void)addLayoutViews {
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.centerX.equalTo(self);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH - 20 * WIDTH_RATIO, 0.5));
        make.bottom.equalTo(self);
        make.centerX.equalTo(self);
    }];
    
}

@end
