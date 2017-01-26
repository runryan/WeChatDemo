//
//  HMTabBar.m
//  黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import "HMTabBar.h"
#import "HMTab.h"

@interface HMTabBar ()

@property (nonatomic, weak) UIButton *selectedButton;

@end

/**
 * 自定义的TabBar
 */
@implementation HMTabBar

/**
 * 根据传进来的Tabs来创建对应的TabBar对象
 * @param tabs 创建TabBar对象多需要的Tab对象数组
 */
+(instancetype)tabBarWithTabs:(NSArray *)tabs{
    
    HMTabBar *tabBar = [[HMTabBar alloc] init];
    
    for(int i =0 ; i<tabs.count; i++){
        
        HMTab *tab = tabs[i];
        
        UIButton *tabButton = [[UIButton alloc] init];
        
        [tabButton setImage:[UIImage imageNamed:tab.normalImage] forState:UIControlStateNormal];
        
        [tabButton setImage:[UIImage imageNamed:tab.selectedImage] forState:UIControlStateSelected];
        
        tabButton.tag = i;
        
        if(i == 0){
            
            tabButton.selected = YES;
            
            tabBar.selectedButton = tabButton;
        }
        
        tabButton.contentEdgeInsets = UIEdgeInsetsMake(5, 0, 10, 0);
        
        tabButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [tabButton addTarget:tabBar action:@selector(tabButtonClicked:) forControlEvents:UIControlEventTouchDown];
        
        [tabBar addSubview:tabButton];
    }
    
    return tabBar;
}

-(void)tabButtonClicked:(UIButton *)tabButton{
    
    //取消上个选中的Button的选中状态
    self.selectedButton.selected = NO;
    
    tabButton.selected = YES;
    
    self.selectedButton = tabButton;
    
    if([self.delegate respondsToSelector:@selector(didTabButtonClicked:)]){
        [self.delegate didTabButtonClicked:tabButton];
    }
}

//设置所有子控件的frame
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGRect frame = self.frame;
    
    NSArray<UIView *> *subviews = self.subviews;
    
    CGFloat width = frame.size.width / subviews.count;
    
    CGFloat height = frame.size.height - 5;
    
    for(int i =0; i<subviews.count; i++){
        
        CGFloat x = width * i;
        
        subviews[i].frame = CGRectMake(x, 0, width, height);
    }
    
}


@end
