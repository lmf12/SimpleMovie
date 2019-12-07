//
//  SMMovieController+UI.m
//  SimpleMovie
//
//  Created by Lyman Li on 2019/12/7.
//  Copyright © 2019 Lyman Li. All rights reserved.
//

#import "SMMovieController+UI.h"

@implementation SMMovieController (UI)

#pragma mark - Public

- (void)setupUI {
    [self setupPlayerView];
    [self setupBackButton];
}

#pragma mark - Private

- (void)setupPlayerView {
    self.playerView = [[UIView alloc] init];
    [self.view addSubview:self.playerView];
    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo([self playerViewSize]);
        make.centerX.equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(60);
        } else {
            make.top.equalTo(self.view.mas_top).offset(60);
        }
    }];
}

- (void)setupBackButton {
    self.backButton = [[UIButton alloc] init];
    self.backButton.backgroundColor = [UIColor blackColor];
    [self.backButton addTarget:self
                        action:@selector(backAction:)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.left.equalTo(self.view).offset(15);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(15);
        } else {
            make.top.equalTo(self.view.mas_top).offset(15);
        }
    }];
}

@end
