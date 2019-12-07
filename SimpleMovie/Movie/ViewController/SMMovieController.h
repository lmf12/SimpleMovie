//
//  SMMovieController.h
//  SimpleMovie
//
//  Created by Lyman Li on 2019/12/7.
//  Copyright © 2019 Lyman Li. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

#import "SMViewController.h"

@interface SMMovieController : SMViewController

@property (nonatomic, strong) AVPlayerItem *playerItem;

@end
