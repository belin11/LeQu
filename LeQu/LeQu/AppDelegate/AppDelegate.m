//
//  AppDelegate.m
//  LeQu
//
//  Created by apple on 16/6/10.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
//#import "LQMediaPlayerViewController.h"
#import "LQOAuthController.h"
#import "LQAccountTool.h"
#import "LQRootViewControllerTool.h"

#import <SDWebImageManager.h>

@interface AppDelegate ()
{
    AVAudioPlayer *_player;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    // 注册通知，就能发送通知
    [application registerUserNotificationSettings:settings];
    
    // 要在真机上后台播放，要设置音频会话
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    // 设置会话类型（后台播放）
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    // 激活会话
    [session setActive:YES error:nil];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
 
    // 判断有没有授权
    if ([LQAccountTool account]) { // 已经授权
       
        // 选择根控制器
        [LQRootViewControllerTool chooseRootViewController:self.window];
    }else { // 没有授权
        // 进行授权
        LQOAuthController *OAuthVC = [LQOAuthController new];
        self.window.rootViewController = OAuthVC;
    }
    [self.window makeKeyAndVisible];
    
    return YES;
}
// 接收到内存警告会调用这个方法
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    // 停止所有的下载
    [[SDWebImageManager sharedManager] cancelAll];
    // 删除缓存
    [[SDWebImageManager sharedManager].imageCache clearMemory];
}

// 失去焦点
- (void)applicationWillResignActive:(UIApplication *)application {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"ss" withExtension:@"mp3"];
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [player prepareToPlay];
    // 无限循环播放
    player.numberOfLoops = -1;
    [player play];
    _player = player;
}

// 程序进入后台调用
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    // 开启一个后台任务，时间不确定，优先级比较低，假如系统要因内存不足关闭应用，首先会考虑
    UIBackgroundTaskIdentifier ID = [application beginBackgroundTaskWithExpirationHandler:^{
        // 当后台任务结束的时候调用
        [application endBackgroundTask:ID];
    }];
    
    // 如何提高后台任务的优先级，欺骗苹果，我们的做法是后台播放音乐
    
    //  但是苹果会检测你的程序有没有播放音乐，如果没有，会干掉你
    
    // 微博：在程序将要进入后台的时候，添加一个静音的音乐
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
