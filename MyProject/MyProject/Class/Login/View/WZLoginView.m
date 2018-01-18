//
//  WZLoginView.m
//  MyProject
//
//  Created by neoby on 2018/1/18.
//  Copyright © 2018年 arther. All rights reserved.
//

#import "WZLoginView.h"
#import "Common.h"

@interface WZLoginView ()

@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;

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
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, SCREENWIDTH, 50)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"个人登录";
    titleLabel.font = [UIFont systemFontOfSize:30];
    [self addSubview:titleLabel];
    
    _accountTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 200, SCREENWIDTH - 40 * 2, 40)];
    _accountTextField.placeholder = @"请输入用户名";
    _accountTextField.layer.borderWidth = 1;
    _accountTextField.layer.borderColor = [UIColor blackColor].CGColor;
    _accountTextField.layer.cornerRadius = 20;
    _accountTextField.layer.masksToBounds = YES;
    _accountTextField.textColor = [UIColor whiteColor];
    _accountTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    _accountTextField.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:_accountTextField];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(_accountTextField.frame) + 20, SCREENWIDTH - 40 * 2, 40)];
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.layer.borderWidth = 1;
    _passwordTextField.layer.borderColor = [UIColor blackColor].CGColor;
    _passwordTextField.layer.cornerRadius = 20;
    _passwordTextField.layer.masksToBounds = YES;
    _passwordTextField.textColor = [UIColor whiteColor];
    _passwordTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:_passwordTextField];
    
    UIButton *passwordButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_passwordTextField.frame) - 45, CGRectGetMinY(_passwordTextField.frame) + 5, 40, 30)];
    passwordButton.backgroundColor = [UIColor redColor];
    passwordButton.layer.cornerRadius = 20;
    passwordButton.layer.masksToBounds = YES;
    [passwordButton addTarget:self action:@selector(passwordButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:passwordButton];
    
    _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(_passwordTextField.frame) + 40, SCREENWIDTH - 40 * 2, 50)];
    _loginButton.backgroundColor = [UIColor redColor];
    _loginButton.layer.cornerRadius = 25;
    _loginButton.layer.masksToBounds = YES;
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginButtonWithClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_loginButton];
    
}

- (void)loginButtonWithClick {
    
}

- (void)passwordButtonClick {
    if (_passwordTextField.secureTextEntry) {
        _passwordTextField.secureTextEntry = NO;
    } else {
        _passwordTextField.secureTextEntry = YES;
    }
}

- (void)addLayoutViews {
    
}


@end
