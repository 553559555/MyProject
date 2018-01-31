//
//  WZHomeCollectionViewCell.m
//  MyProject
//
//  Created by neoby on 2018/1/23.
//  Copyright © 2018年 arther. All rights reserved.
//

#import "WZHomeCollectionViewCell.h"
#import "Common.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

@interface WZHomeCollectionViewCell()

@property (nonatomic, strong) UIImageView   *iconImageView;
@property (nonatomic, strong) UILabel       *nameLabel;
@property (nonatomic, strong) UILabel       *personCountLabel;
@property (nonatomic, strong) UILabel       *titleLabel;

@end

@implementation WZHomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addChildViews];
        [self addLayoutViews];
    }
    return self;
}

- (void)addChildViews {
    
    _iconImageView = [[UIImageView alloc] init];
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:@"https://rpic.douyucdn.cn/amrpic-180124/2267291_1121.jpg"]];
    _iconImageView.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:_iconImageView];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.text = @"海风眷恋的沙";
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_nameLabel];
    
    _personCountLabel = [[UILabel alloc] init];
    _personCountLabel.text = @"1.2万";
    _personCountLabel.textColor = [UIColor whiteColor];
    _personCountLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_personCountLabel];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.text = @"今晚吃鸡大吉大利";
    _titleLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_titleLabel];
    
}

- (void)addLayoutViews {
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(5 * WIDTH_RATIO);
        make.right.equalTo(self.contentView).offset(-5 * WIDTH_RATIO);
        make.bottom.equalTo(self.contentView).offset(-20 * HEIGHT_RATIO);
        make.top.equalTo(self.contentView).offset(5 * HEIGHT_RATIO);
        make.centerX.equalTo(self.contentView);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView).offset(5 * WIDTH_RATIO);
        make.bottom.equalTo(_iconImageView);
    }];
    
    [_personCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_iconImageView).offset(-5 * WIDTH_RATIO);
        make.bottom.equalTo(_iconImageView);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(5 * WIDTH_RATIO);
    }];
    
}

@end
