//
//  Weibo.h
//  新浪微博-地图版
//
//  Created by YueWen on 15/9/28.
//  Copyright (c) 2015年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Weibo : NSObject<MKAnnotation>//首先履行一个协议

/**
 *  发送者的名字
 */
@property(nonatomic,copy)NSString * userName;

/**
 *  发送者的微博信息
 */
@property(nonatomic,copy)NSString * weiboText;

/**
 *  发送微博的位置
 */
@property(nonatomic,assign)CLLocationCoordinate2D weiboLocationCoordinate2D;

@end
