//
//  SMHomeViewController.m
//  SimpleMovie
//
//  Created by Lyman Li on 2019/12/7.
//  Copyright © 2019 Lyman Li. All rights reserved.
//

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

#pragma mark - Action

- (void)addVideoAction:(id)sender {
    MFImagePickerController *imagePickerVc = [[MFImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

#pragma mark - TZImagePickerControllerDelegate

- (void)imagePickerController:(TZImagePickerController *)picker
        didFinishPickingVideo:(UIImage *)coverImage
                 sourceAssets:(PHAsset *)asset {
}

@end
