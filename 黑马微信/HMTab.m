//
//  HMTab.m
//  黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import "HMTab.h"

@implementation HMTab

+(instancetype)tabWithNormalImage:(NSString *)normalImage andSelectedImage:(NSString *)selectedImage andTitle:(NSString *)title{
    HMTab *tab = [[HMTab alloc] init];
    
    tab.selectedImage = selectedImage;
    
    tab.normalImage =normalImage;
    
    tab.title = title;
    
    return tab;
    
}

@end
