//
//  ViewController.m
//  黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import "HMMainController.h"

#import "HMTab.h"

#import "HMTabBar.h"

@interface HMMainController ()<HMTabBarDelegate>

@end

@implementation HMMainController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.viewControllers = [self loadControllers];
    
    [self loadTabBar];
    
    self.tabBar.tintColor = [UIColor colorWithRed:0.31 green:0.67 blue:0.19 alpha:1];
}

-(void)didTabButtonClicked:(UIButton *)selectedButton{
    //    NSLog(@"%s", __func__);
    self.selectedIndex = selectedButton.tag;
}

-(void)loadTabBar{
    
    //创建TabBar里面所有的item对应的模型数组
    
    NSMutableArray *tabs = [NSMutableArray arrayWithCapacity:4];
    
    HMTab *tab = [HMTab tabWithNormalImage:@"wechat_normal" andSelectedImage:@"wechat_selected" andTitle:@"微信"];
    
    [tabs addObject:tab];
    
    tab = [HMTab tabWithNormalImage:@"contact_normal" andSelectedImage:@"contact_selected" andTitle:@"通讯录"];
    
    [tabs addObject:tab];
    
    tab = [HMTab tabWithNormalImage:@"discovery_normal" andSelectedImage:@"discovery_selected" andTitle:@"发现"];
    
    [tabs addObject:tab];
    
    tab = [HMTab tabWithNormalImage:@"me_normal" andSelectedImage:@"me_selected" andTitle:@"我"];
    
    [tabs addObject:tab];
    
    HMTabBar *tabBar = [HMTabBar tabBarWithTabs:tabs];
    
    tabBar.delegate = self;
    
    tabBar.frame = self.tabBar.bounds;
    
    //    tabBar.backgroundColor = [UIColor yellowColor];
    
    [self.tabBar addSubview:tabBar];
    
}

-(NSArray *)loadControllers{
    
    NSArray *controllerNames = @[@"HMChat", @"HMContacts", @"HMDiscovery", @"HMMe"];
    
    NSArray *tabTitles = @[@"微信", @"通讯录", @"发现", @"我"];
    
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:controllerNames.count];
    
    for(int  i =0; i < controllerNames.count; i++){
        
        UINavigationController *navController =  [[UIStoryboard storyboardWithName:controllerNames[i] bundle:nil] instantiateInitialViewController];
        
        [controllers addObject:navController];
        
        navController.title = tabTitles[i];
    }
    
    return controllers;
}

@end
