//
//  TZImageManager+AVAsset.m
//  SimpleMovie
//
//  Created by Lyman Li on 2019/12/7.
//  Copyright © 2019 Lyman Li. All rights reserved.
//

#import "TZImageManager+AVAsset.h"

@implementation TZImageManager (AVAsset)

- (void)getAVAssetWithAsset:(PHAsset *)asset
                 completion:(void (^)(AVAsset *, AVAudioMix *, NSDictionary *))completion {
    [self getAVAssetWithAsset:asset
              progressHandler:NULL
                   completion:completion];
}

- (void)getAVAssetWithAsset:(PHAsset *)asset
            progressHandler:(void (^)(double, NSError *, BOOL *, NSDictionary *))progressHandler
                 completion:(void (^)(AVAsset *, AVAudioMix *, NSDictionary *))completion {
    PHVideoRequestOptions *option = [[PHVideoRequestOptions alloc] init];
    option.networkAccessAllowed = YES;
    option.progressHandler = ^(double progress,
                               NSError *error,
                               BOOL *stop,
                               NSDictionary *info) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (progressHandler) {
                progressHandler(progress, error, stop, info);
            }
        });
    };
    [[PHImageManager defaultManager] requestAVAssetForVideo:asset
                                                    options:option
                                              resultHandler:^(AVAsset *asset, AVAudioMix *audioMix, NSDictionary *info) {
        if (completion) {
            completion(asset, audioMix, info);
        }
    }];
}

@end
