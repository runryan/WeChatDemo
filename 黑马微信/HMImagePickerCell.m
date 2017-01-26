//
//  HMImagePickerCell.m
//  04-黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import "HMImagePickerCell.h"

#import "HMImage.h"

@interface HMImagePickerCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@end

@implementation HMImagePickerCell

//通过代码的方式创建View对象的时候,调用这个方法初始化View对象
//-(instancetype)initWithFrame:(CGRect)frame{
//    
//    return self;
//}

//通过xib或者SB创建View对象的时候,调用这个方法初始化View对象,outlet的属性仍然为空
//-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    
//    if(self = [super initWithCoder:aDecoder]){
//        
//        
//    };
//    return self;
//}


//当xib的action和outlet属性建立连接完成之后,会调用这个方法
-(void)awakeFromNib{
    [super awakeFromNib];
    [self.selectButton addTarget:self action:@selector(didSelectedButtonClicked:) forControlEvents:UIControlEventTouchDown];
}

-(void)didSelectedButtonClicked:(UIButton *)selectedButton{
    
    NSLog(@"%s", __func__);
    
    
    if([self.delegate respondsToSelector:@selector(didSlectedImage:) ]){
        
        //点击一个按钮的时候,到ImagePickerController判断是否超过9张,是否改变当前按钮的状态,如果返回YES,改变点击的按钮的状态,否则不改变按钮的状态
        
        if([self.delegate didSlectedImage:self.image]){
            
            //改变按钮的状态,点按前为选中状态就取消,否则就选中
            
            selectedButton.selected = !selectedButton.selected;
            
            //更改当前的数据模型的属性,避免重用,状态错乱
            self.image.selected = self.selectButton.selected;
        };
    }
    
    
    
    
    
    //    if([self.delegate respondsToSelector:@selector(didImageButtonSelected:)]){
    //        
    //        [self.delegate didImageButtonSelected:selectedButton];
    //    }
    
    
    
}

-(void)setImage:(HMImage *)image{
    
    _image = image;
    
    self.imageView.image = [UIImage imageNamed:image.imageName];
    
    self.selectButton.selected = image.selected;
}

@end
