//
//  ViewCtrl.m
//  WKAlertViewDemo
//
//  Created by biyuhuaping on 2016/10/18.
//  Copyright © 2016年 王琨. All rights reserved.
//

#import "ViewCtrl.h"
#import "WKAlertView.h"

@interface ViewCtrl ()
{
    UIWindow *_sheetWindow ;//window必须为全局变量或成员变量
}
@end

@implementation ViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)show:(UIButton *)sender{
    NSString * title = nil;
    NSString * detail = nil;
    NSString * cancle = @"取消";
    NSString * ok = @"确定";
    switch (sender.tag) {
        case WKAlertViewStyleSuccess:
        case WKAlertViewStyleDefalut:
            title = @"温馨提示";
            detail = @"登录成功";
            cancle = nil;
            break;
        case WKAlertViewStyleFail:
            title = @"错误提示";
            detail = @"您输入的号码有误。";
            break;
        case WKAlertViewStyleWaring:
            title = @"警告";
            detail = @"您正在进行非安全操作！！";
        default:
            break;
    }
    //为成员变量Window赋值则立即显示Window
    _sheetWindow = [WKAlertView showAlertViewWithStyle:sender.tag title:title detail:detail canleButtonTitle:cancle okButtonTitle:ok callBlock:^(MyWindowClick buttonIndex) {
        //Window隐藏，并置为nil，释放内存 不能少
        _sheetWindow.hidden = YES;
        _sheetWindow = nil;
    }];
}

@end
