//
//  Weibo.m
//  新浪微博-地图版
//
//  Created by YueWen on 15/9/28.
//  Copyright (c) 2015年 YueWen. All rights reserved.
//

#import "Weibo.h"

@implementation Weibo


/*
 @property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
 
 @optional
 
 // Title and subtitle for use by selection UI.
 @property (nonatomic, readonly, copy) NSString *title;
 @property (nonatomic, readonly, copy) NSString *subtitle;

 */

-(CLLocationCoordinate2D)coordinate
{
    return self.weiboLocationCoordinate2D;
}


-(NSString *)title
{
    return self.userName;
}

-(NSString *)subtitle
{
    return self.weiboText;
}

@end
