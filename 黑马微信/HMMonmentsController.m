//
//  HMMonmentsController.m
//  03-黑马微信
//
//  Created by shenzhenIOS on 16/7/26.
//  Copyright © 2016年 HeiMa. All rights reserved.
//

#import "HMMonmentsController.h"

#import "HMImageNavController.h"

@interface HMMonmentsController ()<UITableViewDataSource, UITableViewDelegate, HMImageNavControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, weak) UIImageView *loadingAnimView;

@property (nonatomic, weak) UIView *loadingView;

//记录上一次的滚动位置
@property (nonatomic, assign) CGPoint lastPosition;

@property (nonatomic, assign) BOOL isDragging;

@end

@implementation HMMonmentsController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //不要自动的为ScrollView添加内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"HMMomentsHeaderView" owner:nil options:nil] lastObject];
    
    headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width + 25);
    
    self.tableView.tableHeaderView = headerView;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.tableView.contentInset = UIEdgeInsetsMake(-self.view.frame.size.width / 3, 0, 0, 0);
    
    UIView *loadingView = [[UIView alloc] initWithFrame:CGRectMake(16, 35, 25, 25)];
    
    self.loadingView = loadingView;
    
    UIImageView *loadingAnimView = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0, 25, 25)];
    
    [loadingView addSubview:loadingAnimView];
    
    loadingAnimView.image = [UIImage imageNamed:@"loading"];
    
    self.loadingAnimView = loadingAnimView;
    
    [self.view addSubview:loadingView];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    self.isDragging = YES;
    
    self.lastPosition = scrollView.contentOffset;
    
    NSLog(@"起始偏移量:%@", NSStringFromCGPoint(scrollView.contentOffset));
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //    NSLog(@"当前位置: %@", NSStringFromCGPoint(scrollView.contentOffset));
    
    CGFloat dy = (scrollView.contentOffset.y - self.lastPosition.y);
    
    //    NSLog(@"两次之间的偏移量是: %f", dy);
    
    //位置偏移交给loadingView处理
    CGRect loadingFrame = self.loadingView.frame;
    
    if(self.isDragging){
        
        loadingFrame.origin.y -= dy;
        
        if(loadingFrame.origin.y > 100){
            
            loadingFrame.origin.y = 100;
        }
    }
    
    CGFloat rotateAngle = dy > 0 ? M_PI_4 / 8 : - M_PI_4 / 8;
    
    //动画交给loadingAnimView处理
    self.loadingAnimView.transform = CGAffineTransformRotate(self.loadingAnimView.transform, rotateAngle);
    
    NSLog(@"当前位置: %f", loadingFrame.origin.y);
    
    self.loadingView.frame = loadingFrame;
    
    self.lastPosition = scrollView.contentOffset;
}

//ScrollView减速停止后调用这个方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if(!self.isDragging){
        [UIView animateWithDuration:0.6 animations:^{
            CGRect loadingFrame = self.loadingView.frame;
            loadingFrame.origin.y = 35;
            self.loadingView.frame = loadingFrame;
        }];
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    self.lastPosition = scrollView.contentOffset;
    
    if(self.loadingView.frame.origin.y == 100){
        self.isDragging = NO;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    HMImageNavController *navController = segue.destinationViewController;
    
    navController.imageNavDelegate = self;
}

-(void)didFinishSelectingImages:(NSArray *)selectedImages{
    
    NSLog(@"%s", __func__);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"总共选择了%ld张账片", selectedImages.count] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", indexPath.row];
    
    return cell;
}

@end
