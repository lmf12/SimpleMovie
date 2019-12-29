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
    CMTime cursorTime = kCMTimeZero;
    CMTime transitionTime = CMTimeMakeWithSeconds(1.0, 600);
    
    NSMutableArray *firstTrack = [[NSMutableArray alloc] init];
    NSMutableArray *secondTrack = [[NSMutableArray alloc] init];
    
    NSMutableArray *transitions = [[NSMutableArray alloc] init];
    
    NSInteger trackIndex = 0;
    for (AVAsset *asset in self.assets) {
        NSMutableArray *track = trackIndex == 0 ? firstTrack : secondTrack;
        MFClip *clip = [MFClip clipWithAsset:asset];
        clip.startTime = cursorTime;
        [track addObject:clip];
        CMTime endTime = CMTimeAdd(cursorTime, clip.timeRange.duration);
        cursorTime = CMTimeSubtract(endTime, transitionTime);
        trackIndex = (trackIndex + 1) % 2;
    }
    MFTimeLine *timeLine = [[MFTimeLine alloc] init];
    timeLine.clips = @[[firstTrack copy], [secondTrack copy]];
    timeLine.videoTransitions = transitions;
    
    MFCompositionBuilder *builder = [MFCompositionBuilder compositionBuilderWithTimeLine:timeLine];
    MFComposition *composition = [builder bulidComposition];
    
    AVVideoComposition *videoComposition = [builder bulidVideoComposition];
    AVPlayerItem *playerItem = [composition createPlayerItem];
    playerItem.videoComposition = videoComposition;
    
    return playerItem;
}

#pragma mark - Action

- (void)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
