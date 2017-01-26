//
//  HMImage.h
//  04-黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMImage : NSObject

@property (nonatomic, copy) NSString *imageName;

@property (nonatomic, assign) BOOL selected;

+(instancetype)imageWithName:(NSString *)imageName;

@end
