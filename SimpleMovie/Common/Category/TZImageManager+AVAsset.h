//
//  TZImageManager+AVAsset.h
//  SimpleMovie
//
//  Created by Lyman Li on 2019/12/7.
//  Copyright © 2019 Lyman Li. All rights reserved.
//

#import "TZImageManager.h"

@interface TZImageManager (AVAsset)

- (void)getAVAssetWithAsset:(PHAsset *)asset
                 completion:(void (^)(AVAsset *asset, AVAudioMix *audioMix, NSDictionary *info))completion;

- (void)getAVAssetWithAsset:(PHAsset *)asset
            progressHandler:(void (^)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler
                 completion:(void (^)(AVAsset *asset, AVAudioMix *audioMix, NSDictionary *info))completion;

@end
