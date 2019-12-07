//
//  SMHomeViewController.m
//  SimpleMovie
//
//  Created by Lyman Li on 2019/12/7.
//  Copyright © 2019 Lyman Li. All rights reserved.
//

#import "TZImageManager.h"

#import "SMMovieController.h"
#import "MFImagePickerController.h"

#import "SMHomeViewController.h"

@interface SMHomeViewController () <TZImagePickerControllerDelegate>

@property (nonatomic, strong) UIButton *addButton;

@end

@implementation SMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - Private

- (void)setupUI {
    [self setupAddButton];
}

- (void)setupAddButton {
    self.addButton = [[UIButton alloc] init];
    self.addButton.backgroundColor = [UIColor blackColor];
    self.addButton.layer.cornerRadius = 5;
    [self.addButton addTarget:self
                       action:@selector(addVideoAction:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addButton];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.center.equalTo(self.view);
    }];
}

/// 跳转到编辑页面
- (void)forwardToMovieControllerWithPlayerItem:(AVPlayerItem *)playerItem {
    SMMovieController *movieController = [[SMMovieController alloc] init];
    movieController.playerItem = playerItem;
    [self presentViewController:movieController animated:YES completion:NULL];
}

#pragma mark - Action

- (void)addVideoAction:(id)sender {
    MFImagePickerController *imagePickerController = [[MFImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

#pragma mark - TZImagePickerControllerDelegate

- (void)imagePickerController:(TZImagePickerController *)picker
        didFinishPickingVideo:(UIImage *)coverImage
                 sourceAssets:(PHAsset *)asset {
    @weakify(self);
    [[TZImageManager manager] getVideoWithAsset:asset
                                     completion:^(AVPlayerItem *playerItem, NSDictionary *info) {
        @strongify(self);
        dispatch_async(dispatch_get_main_queue(), ^{
            [picker dismissViewControllerAnimated:NO completion:NULL];
            [self forwardToMovieControllerWithPlayerItem:playerItem];
        });
    }];
}

@end
