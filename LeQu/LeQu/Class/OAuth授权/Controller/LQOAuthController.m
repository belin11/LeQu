//
//  LQOAuthController.m
//  LeQu
//
//  Created by apple on 16/7/10.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQOAuthController.h"
//#import "LQAccount.h"
#import "LQAccountTool.h"
#import "LQRootViewControllerTool.h"
#import "MBProgressHUD.h"
//#import "AFNetworking.h"

#define LQBaseURL @"https://api.weibo.com/oauth2/authorize"
#define LQClient_id  @"3320613549"
#define LQRedirect_uri @"http://www.baidu.com"
#define LQKeyWindow [UIApplication sharedApplication].keyWindow


@interface LQOAuthController () <UIWebViewDelegate>

@end

@implementation LQOAuthController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    webView.delegate = self;
    
    NSString *urlStr = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",LQBaseURL,LQClient_id,LQRedirect_uri];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}

#pragma mark - webView delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *urlStr = request.URL.absoluteString;
    NSLog(@"%@",urlStr);

    // 获取code (RequestToken)
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) {
        
        NSString *codeStr = [urlStr substringWithRange:NSMakeRange(range.location + range.length, 32)];
        NSLog(@"%@",codeStr);
        // 获取accessToken
        [self accessTokenWithCode:codeStr];
        return NO;
    }
    return YES;
}

#pragma mark - 获取AccessToken
- (void)accessTokenWithCode:(NSString *)code {
 
    [LQAccountTool accountWithCode:code success:^{
        
        // 进入主页或新特性
        [LQRootViewControllerTool chooseRootViewController:LQKeyWindow];

    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
