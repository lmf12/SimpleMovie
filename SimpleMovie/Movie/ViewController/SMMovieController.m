//
//  SMMovieController.m
//  SimpleMovie
//
//  Created by Lyman Li on 2019/12/7.
//  Copyright © 2019 Lyman Li. All rights reserved.
//

#import "MFMovieKit.h"

#import "SMMovieController+Private.h"

#import "SMMovieController.h"

@implementation SMMovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self setupPlayer];
}

#pragma mark - Private

- (CGSize)playerViewSize {
    CGFloat width = self.view.frame.size.width * 0.6;
    CGFloat height = width / 9 * 16;
    return CGSizeMake(width, height);
}

- (void)setupPlayer {
    self.player = [[AVPlayer alloc] initWithPlayerItem:[self createPlayerItem]];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.backgroundColor = [UIColor blackColor].CGColor;
    CGSize layerSize = [self playerViewSize];
    playerLayer.frame = CGRectMake(0, 0, layerSize.width, layerSize.height);
    [self.playerView.layer addSublayer:playerLayer];
    
    [self.player play];
}

- (AVPlayerItem *)createPlayerItem {
    NSMutableArray *clips = [[NSMutableArray alloc] init];
    for (AVAsset *asset in self.assets) {
        MFClip *clip = [MFClip clipWithAsset:asset];
        [clips addObject:clip];
    }
    MFTimeLine *timeLine = [[MFTimeLine alloc] init];
    timeLine.clips = @[[clips copy]];
    
    MFCompositionBuilder *builder = [MFCompositionBuilder compositionBuilderWithTimeLine:timeLine];
    MFComposition *composition = [builder bulidComposition];
    return [composition createPlayerItem];
}

#pragma mark - Action

- (void)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
