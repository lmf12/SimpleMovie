//
//  SMMovieController+Private.h
//  SimpleMovie
//
//  Created by Lyman Li on 2019/12/7.
//  Copyright © 2019 Lyman Li. All rights reserved.
//

#import "SMMovieController+UI.h"

#import "SMMovieController.h"

@interface SMMovieController ()

@property (nonatomic, strong) UIButton *backButton;  // 返回按钮
@property (nonatomic, strong) UIView *playerView;  // 播放器视图
@property (nonatomic, strong) AVPlayer *player;  // 播放器

/// 播放器视图尺寸
- (CGSize)playerViewSize;

#pragma mark - Action

/// 返回
- (void)backAction:(id)sender;

@end
