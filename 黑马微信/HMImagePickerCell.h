//
//  HMImagePickerCell.h
//  04-黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMImage;
@protocol HMImagePickerCellDelegate <NSObject>

/**
 * 当前选中的HMImage对象
 *
 * @return YES 改变选中按钮的状态, NO 不改变按钮的选中状态, 是否改变按钮的状态由delegate对象决定
 */
-(BOOL)didSlectedImage:(HMImage *)selectedImage;

@end

@interface HMImagePickerCell : UICollectionViewCell

@property (nonatomic, strong) HMImage *image;

@property (nonatomic, weak) id<HMImagePickerCellDelegate> delegate;

@end
