//
//  HMImage.m
//  04-黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import "HMImage.h"

@implementation HMImage

+(instancetype)imageWithName:(NSString *)imageName{
    
    HMImage *image = [[HMImage alloc] init];
    
    image.imageName = imageName;
    
    return image;
}

@end
