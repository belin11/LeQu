//
//  LQMediaPlayerViewController.m
//  LeQu
//
//  Created by apple on 16/6/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQMediaPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface LQMediaPlayerViewController ()

@end

@implementation LQMediaPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"demo5" withExtension:@"mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:url];
    AVPlayerLayer *playLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:playLayer];
    [player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
