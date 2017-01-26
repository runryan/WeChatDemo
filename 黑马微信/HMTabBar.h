//
//  HMTabBar.h
//  黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HMTabBarDelegate <NSObject>

-(void)didTabButtonClicked:(UIButton *)selectedButton;

@end

@interface HMTabBar : UIView

+(instancetype)tabBarWithTabs:(NSArray *)tabs;

@property (nonatomic, weak) id<HMTabBarDelegate> delegate;

@end
