//
//  ViewController.m
//  新浪微博-地图版
//
//  Created by YueWen on 15/9/28.
//  Copyright (c) 2015年 YueWen. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "WeiBoManager.h"
#import "Token.h"
#import "Weibo.h"

@interface ViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>

@property(nonatomic,strong)MKMapView * mapView;

@property(nonatomic,strong)WeiBoManager * weiboManager;

//定位管理器
@property(nonatomic,strong)CLLocationManager * locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //初始化地图视图
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    
    //初始化单例
    self.weiboManager = [WeiBoManager shareWeiBoManager];
    
    //初始化位置管理
    self.locationManager = [[CLLocationManager alloc]init];
    
    //设置导航栏的信息
    self.navigationItem.title = @"地图";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(freshMapWithCheck)];
    
    //设置代理
    self.mapView.delegate = self;
    self.locationManager.delegate = self;
 
    //判断当前定位的状态
    [self freshMapWithCheck];
    
    //添加视图
    [self.view addSubview:self.mapView];

}

/**
 *  刷新按钮的回调 以及用于判断当前状态是否能够请求位置
 */
-(void)freshMapWithCheck
{
    //如果定位管理器获得了用户的允许
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        //开始请求位置
        [self.locationManager startUpdatingLocation];
    }
    
    else
    {
        //开始请求授权
        [self.locationManager requestWhenInUseAuthorization];
    }

}


#pragma mark - MKMapViewDelegate
/**
 *  自定义标注视图
 *
 *  @param mapView    当前的mapView
 *  @param annotation 标注的信息
 *
 *  @return 自定义的标注视图
 */
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    //从缓冲区中查找使用重用标识符为@“mp”的标注view
    MKAnnotationView * annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"mp"];
    
    //如果缓冲区中不存在
    if (annotationView == nil)
    {
        //创建一个重用标识符为@“mp”的标注view
        annotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"mp"];
    }
    
    //可以点击显示
    annotationView.canShowCallout = YES;
    
    //创建一个UIImageView
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    imageView.image = [UIImage imageNamed:@"头像"];
    
    //设置头像
    annotationView.leftCalloutAccessoryView = imageView;
    
    //代替棒棒糖的图,图的大小建议找个合适的，不然看起来有点不匹配
    annotationView.image = [UIImage imageNamed:@"11"];
    
    return  annotationView;
}

#pragma mark - CLLocationManager Delegate
/**
 *  位置更新完毕之后进行的回调
 *
 *  @param manager   定位管理者
 *  @param locations 存储位置的数组，最后一个为最新的定位
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //获取最新定位
    CLLocation * location = locations.lastObject;
    
    NSLog(@"获取了最新定位！");
    
    //停止请求位置
    [self.locationManager stopUpdatingLocation];
    
    //初步定义地图显示的位置
    MKCoordinateRegion lastRegion;
    lastRegion.center = location.coordinate;
    lastRegion.span = MKCoordinateSpanMake(0.1, 0.1);
    //更新地图范围
    self.mapView.region = lastRegion;
    
    //开始请求微博
    [self.weiboManager getWeiboNearByTimeLineWithToken:token WithLocation:lastRegion.center Count:3 BlockHandle:^(NSArray *array) {
       
        //将请求的微博添加到地图上
        [self.mapView addAnnotations:array];
    }];
}

/**
 *  定位失败时候的回调方法
 *
 *  @param manager 定位管理器
 *  @param error   错误信息
 */
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"定位失败!");
}

/**
 *  定位管理器  授权状态发生变化时
 *
 *  @param manager 定位管理器
 *  @param status  当前授权的状态
 */
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {//判断当前状态
        case kCLAuthorizationStatusAuthorizedWhenInUse://在用时已经授权
            //请求位置
            [self.locationManager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusNotDetermined://授权待定
            //请求授权
            [self.locationManager requestWhenInUseAuthorization];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
