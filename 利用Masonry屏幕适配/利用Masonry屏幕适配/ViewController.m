//
//  ViewController.m
//  利用Masonry屏幕适配
//
//  Created by PilotLab on 15/10/12.
//  Copyright (c) 2015年 PilotLab. All rights reserved.
//
#import "Masonry.h"
#import "ViewController.h"
#import "UIView+Masonry_PCfans.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//   居中显示一个view
    UIView *sv =[[UIView alloc]init];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
////1  让一个view略小于其superview
//    UIView *sv1= [[UIView alloc]init];
//    sv1.backgroundColor = [UIColor redColor];
////    [sv addSubview:sv1];
//    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//        /* 等价于
//         make.top.equalTo(sv).with.offset(10);
//         make.left.equalTo(sv).with.offset(10);
//         make.bottom.equalTo(sv).with.offset(-10);
//         make.right.equalTo(sv).with.offset(-10);
//         */
//        
//        /* 也等价于
//         make.top.left.bottom.and.right.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//         */
//    }];
//    
////2    让两个高度为150的view垂直居中且等宽灯间距排列，间距10（自动计算宽度）
//    int padding1 = 10;
//    UIView *sv2= [[UIView alloc]init];
//    sv2.backgroundColor = [UIColor yellowColor];
////    [sv addSubview:sv2];
//    UIView *sv3= [[UIView alloc]init];
//    sv3.backgroundColor = [UIColor yellowColor];
////    [sv addSubview:sv3];
//    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.left.equalTo(sv.mas_left).with.offset(padding1);
//        make.right.equalTo(sv3.mas_left).with.offset(-padding1);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv3);
//    }];
//    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(sv);
//        make.left.equalTo(sv2.mas_right).with.offset(padding1);
//        make.right.equalTo(sv.mas_right).with.offset(-padding1);
//        make.height.equalTo(sv2);
//        make.width.equalTo(sv2);
//    }];

////3    在UIScrollview顺序排列一些view并自动计算contentSize
//    UIScrollView *scrollview = [[UIScrollView alloc]init];
//    scrollview.backgroundColor = [UIColor whiteColor];
//    [sv addSubview:scrollview];
//    [scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(sv).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
//    }];
//    UIView *container = [[UIView alloc]init];
//    [scrollview addSubview:container];
//    [container mas_makeConstraints:^(MASConstraintMaker *make) {
//        //必加这句，保证可以滑动
//        //这里的关键就在于container这个view起到了一个中间层的作用 能够自动的计算uiscrollView的contentSize
//        make.edges.equalTo(scrollview);
//        make.width.equalTo(scrollview);
//    }];
//    int count = 10;
//    UIView *lastview = nil;
//    for (int i  =1 ; i <= count; ++i) {
//        UIView *subv = [UIView new];
//        [container addSubview:subv];
//        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1];
//        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.and.right.equalTo(container);
//            make.height.mas_equalTo(@(20*i));
//            
//            if (lastview) {
//                 make.top.mas_equalTo(lastview.mas_bottom);
//            }else{
//                make.top.mas_equalTo(container.mas_top);
//            }
//        }];
//        
//        lastview = subv;
//    }
//    [container mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(lastview.mas_bottom);
//    }];
//    
//4    横向或者纵向灯间隙排列一组view

    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    
    [sv addSubview:sv11];
    [sv addSubview:sv12];
    [sv addSubview:sv13];
    [sv addSubview:sv21];
    [sv addSubview:sv31];
    
    //给予不同的大小 测试效果
    
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);
        make.centerX.equalTo(@[sv21,sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    
    [sv distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [sv distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
