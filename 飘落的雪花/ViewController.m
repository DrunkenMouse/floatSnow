//
//  ViewController.m
//  飘落的雪花
//
//  Created by 王奥东 on 16/12/1.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//UIImage* flakeImage;
@end

@implementation ViewController {
    UIImage *_flakeImage;//雪花图片
    
    NSMutableArray <UIImageView *> * _flakeArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _flakeImage = [UIImage imageNamed:@"2.png"];
    _flakeArr = [NSMutableArray array];
    
    [NSTimer scheduledTimerWithTimeInterval:(0.05) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}
- (void)onTimer
{
    
    //最多只生成100个雪花，超出的话就从最开始移除。
    //如果不加以限制，会造成内存越用越多
    if (_flakeArr.count > 100) {
       
        for (int i = 0; i < _flakeArr.count - 100; i++) {
            //雪花从父类移除
            [[_flakeArr objectAtIndex:i]removeFromSuperview];
            //雪花从数组移除
            [_flakeArr removeObjectAtIndex:i];
        }
        
    }
  
    
    //创建图像视图对象
    
    UIImageView * flakView = [[UIImageView alloc] initWithImage:_flakeImage];
    [_flakeArr addObject:flakView];
    //开始于结束的X，随机成功0 - 320之间的数
    int startX = round(random()%320);
    int endX = round(random()%320);
    
    //随机生成扩大比例与速度值
    double scale = 1 / round(random() % 100) + 1.0;
    double speed = 1 / round(random() % 100) + 1.0;
    //初始位置
    flakView.frame = CGRectMake(startX, -100.0, 25.0 * scale, 25.0 * scale);
    flakView.alpha = 0.5;
    [self.view addSubview:flakView];
    //开始动画
    [UIView beginAnimations:nil context:(__bridge void *)(flakView)];
    //多少时间完成
    [UIView setAnimationDuration:5 * speed];
    //结束位置
    flakView.frame = CGRectMake(endX, 540.0, 25.0 * scale, 25.0 * scale);
    //结束动画
    [UIView commitAnimations];
    
    
    
}



@end
