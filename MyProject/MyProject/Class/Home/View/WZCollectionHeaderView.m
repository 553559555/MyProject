//
//  WZCollectionHeaderView.m
//  MyProject
//
//  Created by neoby on 2018/1/23.
//  Copyright © 2018年 arther. All rights reserved.
//

#import "WZCollectionHeaderView.h"
#import <Masonry.h>
#import "Common.h"

@interface WZCollectionHeaderView()

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation WZCollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addChildViews];
        [self addLayoutViews];
    }
    return self;
}

- (void)addChildViews {
    
    _title = [[UILabel alloc] init];
    _title.text = @"最近推荐";
    _title.font = [UIFont systemFontOfSize:15];
    [self addSubview:_title];
    
    _nextButton = [[UIButton alloc] init];
    [_nextButton setImage:[UIImage imageNamed:@"huanyihuan"] forState:UIControlStateNormal];
    _nextButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [_nextButton setTitle:@"换一换" forState:UIControlStateNormal];
    [_nextButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _nextButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_nextButton];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    [self addSubview:_lineView];
    
}

- (void)addLayoutViews {
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10 * WIDTH_RATIO);
    }];
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-10 * WIDTH_RATIO);
    }];
//    
//    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH, 0.5));
//        make.bottom.equalTo(self);
//    }];
    
}

@end
