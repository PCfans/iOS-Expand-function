//
//  ViewController.m
//  UTF-8 To GBK
//
//  Created by PilotLab on 15/10/13.
//  Copyright (c) 2015年 PilotLab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"yangzhou" ofType:@"txt"];
    //gbk编码 如果txt文件为utf-8的则使用NSUTF8StringEncoding
    NSStringEncoding gbk = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    //定义字符串接收从txt文件读取的内容
    NSString *str = [[NSString alloc] initWithContentsOfFile:plistPath encoding:gbk error:nil];
    NSLog(@"%@",str);
    //将字符串转为nsdata类型
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    //将nsdata类型转为NSDictionary
    NSDictionary *pDic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    NSString *plistp = @"~/Desktop";
    //得到完整的文件名
    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"Newyangzhou.txt"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL res=[fileManager createFileAtPath:filename contents:nil attributes:nil];
    if (res) {
        NSLog(@"文件创建成功: %@" ,filename);
    }else
        NSLog(@"文件创建失败");
    //输入写入
    NSLog(@"%@",filename);
    [str writeToFile:filename atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
