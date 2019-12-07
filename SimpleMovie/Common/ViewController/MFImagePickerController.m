//
//  MFImagePickerController.m
//  SimpleMovie
//
//  Created by Lyman Li on 2019/12/7.
//  Copyright © 2019 Lyman Li. All rights reserved.
//

#import "MFImagePickerController.h"

@implementation MFImagePickerController

- (instancetype)initWithMaxImagesCount:(NSInteger)maxImagesCount
                              delegate:(id<TZImagePickerControllerDelegate>)delegate {
    self = [super initWithMaxImagesCount:maxImagesCount delegate:delegate];
    if (self) {
        self.allowPickingImage = NO;
        self.allowTakePicture = NO;
        self.allowTakeVideo = NO;
        self.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    return self;
}

@end
