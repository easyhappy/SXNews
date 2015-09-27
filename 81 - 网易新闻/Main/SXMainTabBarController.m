//
//  SXMainTabBarController.m
//  81 - 网易新闻
//
//  Created by 董 尚先 on 15/4/9.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXMainTabBarController.h"
#import "SXBarButton.h"
#import "SXTabBar.h"

#import "SXMainViewController.h"
#import "SXNavController.h"


@interface SXMainTabBarController ()<SXTabBarDelegate>

@end

@implementation SXMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ------本想吧广告设置成广告显示完毕之后再加载rootViewController的，但是由于前期已经使用storyboard搭建了，写在AppDelete里会冲突，只好就随便整个view广告
    UIImageView *adImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"rose"]];
    adImg.frame = [UIScreen mainScreen].bounds;
    adImg.alpha = 0.99f;
    [self.view addSubview:adImg];
    
    [UIView animateWithDuration:3 animations:^{
        adImg.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            adImg.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [adImg removeFromSuperview];
        }];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"SXAdvertisementKey" object:nil];
    }];
    

    
    SXTabBar *tabBar = [[SXTabBar alloc]init];
    tabBar.frame = self.tabBar.bounds;
    tabBar.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    
    [self.tabBar addSubview:tabBar];
    
    tabBar.delegate = self;
    
    
    [tabBar addImageView];
    
    [tabBar addBarButtonWithNorName:@"tabbar_icon_news_normal" andDisName:@"tabbar_icon_news_highlight" andTitle:@"新闻"];
    [tabBar addBarButtonWithNorName:@"tabbar_icon_reader_normal" andDisName:@"tabbar_icon_reader_highlight" andTitle:@"阅读"];
    [tabBar addBarButtonWithNorName:@"tabbar_icon_media_normal" andDisName:@"tabbar_icon_media_highlight" andTitle:@"视听"];
    [tabBar addBarButtonWithNorName:@"tabbar_icon_found_normal" andDisName:@"tabbar_icon_found_highlight" andTitle:@"发现"];
    [tabBar addBarButtonWithNorName:@"tabbar_icon_me_normal" andDisName:@"tabbar_icon_me_highlight" andTitle:@"我"];
    
    self.selectedIndex = 0;
}

#pragma mark - ******************** SXTabBarDelegate代理方法
- (void)ChangSelIndexForm:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

@end
