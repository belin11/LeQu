//
//  LQOAuthController.m
//  LeQu
//
//  Created by apple on 16/7/10.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQOAuthController.h"
#import "LQAccount.h"
#import "LQAccountTool.h"
#import "LQRootViewControllerTool.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"

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
        // accessToken
        [self accessTokenWithCode:codeStr];
        return NO;
    }
    return YES;
}
// 获取AccessToken
- (void)accessTokenWithCode:(NSString *)code {
 
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *baseURL = @"https://api.weibo.com/oauth2/access_token";
 /*
    必选	类型及范围	说明
    client_id	true	string	申请应用时分配的AppKey。
    client_secret	true	string	申请应用时分配的AppSecret。
    grant_type	true	string	请求的类型，填写authorization_code
    
    grant_type为authorization_code时
    必选	类型及范围	说明
    code	true	string	调用authorize获得的code值。
    redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
*/
    NSMutableDictionary *paras = [NSMutableDictionary dictionary];
    paras[@"client_id"] = LQClient_id;
    paras[@"client_secret"] = @"e0a90f8a1df848177baebe1367aebaf5";
    paras[@"grant_type"] = @"authorization_code";
    paras[@"code"] = code;
    paras[@"redirect_uri"] = LQRedirect_uri;
    // 发送POST请求
    [manager POST:baseURL parameters:paras progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 字典转模型
        LQAccount *account = [LQAccount accountWithDict:responseObject];
        // 保存账号信息,抽出一个业务类 以后想保存到数据库 只要对业务类进行操作
        [LQAccountTool saveAccount:account];
        
        // 进入主页或新特性
        [LQRootViewControllerTool chooseRootViewController:LQKeyWindow];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
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
