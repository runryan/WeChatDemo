//
//  HMImagePickerController.h
//  04-黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HMImagePickerControllerDelegate <NSObject>

-(void)didFinishSelectingImages:(NSArray *)selectedImages;

@end

@interface HMImagePickerController : UIViewController

@property (nonatomic, weak) id<HMImagePickerControllerDelegate> delegate;

@end
