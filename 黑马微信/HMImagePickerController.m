//
//  HMImagePickerController.m
//  04-黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import "HMImagePickerController.h"

#import "HMImage.h"

#import "HMImagePickerCell.h"

#import "HMImageNavController.h"

@interface HMImagePickerController ()<UICollectionViewDataSource, UICollectionViewDelegate, HMImagePickerCellDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *finishItem;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, copy) NSArray<HMImage *> *images;

@property (nonatomic, copy) NSMutableArray *selectedImages;

@end

@implementation HMImagePickerController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    //设置标题栏的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //设置标题
    self.title = @"胶卷照片";
    
    //设置右边的取消按钮
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(didCancelItemClicked)];
    
    self.navigationItem.rightBarButtonItem = cancelItem;
    
    self.collectionView.dataSource = self;
    
    self.collectionView.delegate = self;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //cell之间的间距
    CGFloat margin = 4;
    
    NSInteger columnNum = 4;
    
    //计算cell的宽度
    CGFloat cellWidth = (self.view.frame.size.width - margin * (columnNum + 1)) / columnNum;
    
    self.flowLayout.minimumLineSpacing = margin;
    
    self.flowLayout.minimumInteritemSpacing = margin;
    
    self.flowLayout.itemSize = CGSizeMake(cellWidth, cellWidth);
    
    //设置collectionView的内边距
    self.collectionView.contentInset = UIEdgeInsetsMake(margin, margin, margin+ 44, margin );
    
    self.finishItem.enabled = NO;
    
    self.finishItem.tintColor = [UIColor grayColor];
}

//点击了完成按钮
- (IBAction)didFinishItemClicked:(id)sender {
    
    HMImageNavController *navController = (HMImageNavController *)self.navigationController;
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    if([navController.imageNavDelegate respondsToSelector:@selector(didFinishSelectingImages:)]){
        
        [navController.imageNavDelegate  didFinishSelectingImages:self.selectedImages];
    }
    
    
}

//保存选中的图片
-(NSMutableArray *)selectedImages{
    
    if(!_selectedImages){
        
        _selectedImages = [NSMutableArray arrayWithCapacity:9];
    }
    
    return _selectedImages;
}

//读取所有的图片数据
-(NSArray *)images{
    
    if(_images == nil){
        
        NSMutableArray *images = [NSMutableArray array];
        
        for(int i = 1; i<34; i++){
            
            HMImage *image = [HMImage imageWithName:[NSString stringWithFormat:@"pic%d", i]];
            
            [images addObject:image];
        }
        
        _images = images;
    }
    return _images;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.images.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HMImagePickerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageID" forIndexPath:indexPath];
    
    cell.image = self.images[indexPath.item];
    
    cell.delegate = self;
    
    return cell;
}

-(BOOL)didSlectedImage:(HMImage *)selectedImage{
    
    //如果点击的按钮为选中状态,就从选中图片的数组中移除
    if(selectedImage.selected){
        
        [self.selectedImages removeObject:selectedImage];
        
        //告诉cell取消选中状态
    }else{
        
        //如果点击的按钮未选中,判断是否超过9张
        
        if(self.selectedImages.count == 9){
            
            //如果超过9张,弹窗提示
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"最多可以选择9张照片" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler: nil];
            
            [alertController addAction:action];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            //返回NO,不更改点击的按钮的状态
            return NO;
            
        }else{
            
            //如果没有超过9张,添加到选中的图片的数组中
            [self.selectedImages addObject:selectedImage];
        }
    }
    
    self.finishItem.enabled = self.selectedImages.count > 0 ? YES : NO;
    
    self.finishItem.tintColor = self.finishItem.enabled ? [UIColor greenColor] : [UIColor grayColor];
    
    //返回YES,改变按钮的状态
    return YES;
    
}

//点击了取消按钮,关闭Controller
-(void)didCancelItemClicked{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

@end
