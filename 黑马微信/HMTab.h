//
//  HMTab.h
//  黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * 保存TabBar中Tab的模型,表示Tab各个状态显示的图片
 */
@interface HMTab : NSObject

@property (nonatomic, copy) NSString *normalImage;

@property (nonatomic, copy) NSString *selectedImage;

@property (nonatomic, copy) NSString *title;

+(instancetype)tabWithNormalImage:(NSString *) normalImage andSelectedImage:(NSString *)selectedImage andTitle:(NSString *)title;

@end
