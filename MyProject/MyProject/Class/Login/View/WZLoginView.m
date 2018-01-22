//
//  WZLoginView.m
//  MyProject
//
//  Created by neoby on 2018/1/18.
//  Copyright © 2018年 arther. All rights reserved.
//

#import "WZLoginView.h"
#import "Common.h"
#import <Masonry.h>
#import <AVFoundation/AVFoundation.h>

@interface WZLoginView ()

@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *passwordButton;
@property (nonatomic, strong) AVPlayer *player;

@end

@implementation WZLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self addChildViews];
        [self addLayoutViews];
    }
    return self;
}

- (void)addChildViews {
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = @"个人登录";
    _titleLabel.font = [UIFont systemFontOfSize:30];
    [self addSubview:_titleLabel];
    
    _accountTextField = [[UITextField alloc] init];
    _accountTextField.placeholder = @"请输入用户名";
    _accountTextField.layer.borderWidth = 1;
    _accountTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _accountTextField.layer.cornerRadius = 20 * HEIGHT_RATIO;
    _accountTextField.layer.masksToBounds = YES;
    _accountTextField.textColor = [UIColor whiteColor];
    _accountTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    _accountTextField.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:_accountTextField];
    
    _passwordTextField = [[UITextField alloc] init];
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.layer.borderWidth = 1;
    _passwordTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _passwordTextField.layer.cornerRadius = 20 * HEIGHT_RATIO;
    _passwordTextField.layer.masksToBounds = YES;
    _passwordTextField.textColor = [UIColor whiteColor];
    _passwordTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20 * WIDTH_RATIO, 20 * HEIGHT_RATIO)];
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:_passwordTextField];
    
    _passwordButton = [[UIButton alloc] init];
    _passwordButton.backgroundColor = [UIColor redColor];
    _passwordButton.layer.cornerRadius = 20 * HEIGHT_RATIO;
    _passwordButton.layer.masksToBounds = YES;
    [_passwordButton setTitle:@"o" forState:UIControlStateNormal];
    [_passwordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_passwordButton addTarget:self action:@selector(passwordButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_passwordButton];
    
    _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(_passwordTextField.frame) + 40, SCREENWIDTH - 40 * 2, 50)];
    _loginButton.backgroundColor = [UIColor redColor];
    _loginButton.layer.cornerRadius = 25 * HEIGHT_RATIO;
    _loginButton.layer.masksToBounds = YES;
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginButtonWithClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_loginButton];
    
}

- (void)nextVCButtonClick:(LOGINBUTTONCLICKBLOCK)loginButtonClick {
    _loginButtonClick = loginButtonClick;
}

- (void)addLayoutViews {
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(100 * HEIGHT_RATIO);
    }];
    
    [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(80 * HEIGHT_RATIO);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH - 80 * WIDTH_RATIO, 40 * HEIGHT_RATIO));
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_accountTextField.mas_bottom).offset(20 * HEIGHT_RATIO);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH - 80 * WIDTH_RATIO, 40 * HEIGHT_RATIO));
    }];
    
    [_passwordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_passwordTextField.mas_right).offset(-5 * WIDTH_RATIO);
        make.centerY.equalTo(_passwordTextField);
        make.size.mas_equalTo(CGSizeMake(45 * WIDTH_RATIO, 30 * HEIGHT_RATIO));
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordTextField.mas_bottom).offset(40 * HEIGHT_RATIO);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH - 80 * WIDTH_RATIO, 50 * HEIGHT_RATIO));
    }];
    
    
}

- (void)loginButtonWithClick {
    if (self.loginButtonClick) {
        self.loginButtonClick(_accountTextField.text, _passwordTextField.text);
    }
}

- (void)passwordButtonClick {
    if (_passwordTextField.secureTextEntry) {
        _passwordTextField.secureTextEntry = NO;
    } else {
        _passwordTextField.secureTextEntry = YES;
    }
}




@end
