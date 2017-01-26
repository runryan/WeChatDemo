//
//  HMImageController.m
//  04-黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import "HMImageNavRootController.h"

#import "HMImagePickerController.h"

@interface HMImageNavRootController ()

@end

@implementation HMImageNavRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //在当前的控制器还没有展示之前,就跳转到下一个控制器,给人一种是直接跳过去的错觉
    HMImagePickerController *imagePickerController = [self.storyboard instantiateViewControllerWithIdentifier:@"imageID"];
    
    [self.navigationController pushViewController:imagePickerController animated:NO];
}

//点击了取消按钮
- (IBAction)didCancelItemClicked:(id)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}



@end
