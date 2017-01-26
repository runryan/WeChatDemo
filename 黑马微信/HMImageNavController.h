//
//  HMImageNavController.h
//  04-黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HMImageNavControllerDelegate <NSObject>

-(void)didFinishSelectingImages:(NSArray *)selectedImages;

@end

@interface HMImageNavController : UINavigationController

@property (nonatomic, weak) id<HMImageNavControllerDelegate> imageNavDelegate;

@end
