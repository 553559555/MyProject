//
//  WZLoginView.h
//  MyProject
//
//  Created by neoby on 2018/1/18.
//  Copyright © 2018年 arther. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LOGINBUTTONCLICKBLOCK)(NSString *account,NSString *password);

@interface WZLoginView : UIView

@property (nonatomic, copy) LOGINBUTTONCLICKBLOCK  loginButtonClick;

- (void)nextVCButtonClick:(LOGINBUTTONCLICKBLOCK)loginButtonClick;

@end
