//
//  WeiBoManager.h
//  新浪微博
//
//  Created by YueWen on 15/9/21.
//  Copyright (c) 2015年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^WBM)(NSArray * array);
typedef void(^WBS)(BOOL isSuccess);

@interface WeiBoManager : NSObject

/**
 *  记录微博的ID
 */
@property(nonatomic,strong)NSString * weiboID;

/**
 *  单例方法
 *
 *  @return 返回一个微博管理者的单例
 */
+(instancetype)shareWeiBoManager;

/**
 *  获取当前以及关注用户的最新微博
 *
 *  @param token 用户的token值
 *  @param count 获取数量
 *  @param b     获取的微博
 */
-(void)requestWeiBoWithToken:(NSString *)access_token Count:(NSInteger)count  BlockHandle:(WBM) b;

/**
 *  发送文本微博
 *
 *  @param access_token 用户的toke值
 *  @param status       发送的文本内容
 *  @param b            发送结果
 */
-(void)sendMessageWithToken:(NSString *)access_token status:(NSString *)status BlockHandle:(WBS) b;

/**
 *  发送图片微博
 *
 *  @param access_token 用户的token值
 *  @param states       发送的文本内容
 *  @param image        发送的图片内容
 *  @param b            发送结果
 */
-(void)sendMessageAndImageWithToken:(NSString *)access_token status:(NSString *)states Image:(UIImage *)image BlockHandle:(WBS)b;

/**
 *  获取微博的评论列表
 *
 *  @param access_token 用户的token值
 *  @param Id           微博的id
 *  @param count        获取数量
 *  @param b            获取的评论列表
 */
-(void)getCommentsWithToken:(NSString *)access_token WeiboId:(NSString *)Id Count:(NSInteger)count BlockHandle:(WBM)b;


-(void)createFavoriteCommentWithToken:(NSString *)access_token WeiboId:(NSString *)Id BlockHandle:(WBS)b;

/**
 *  获取某个位置的附近微博
 *
 *  @param access_token 用的token值
 *  @param latitude     纬度值
 *  @param longtitute   经度值
 *  @param count        获取数量
 *  @param b            获取的微博列表
 */
-(void)getWeiboNearByTimeLineWithToken:(NSString *)access_token Latitude:(NSString *)latitude Longtitute:(NSString *)longtitute Count:(NSInteger)count BlockHandle:(WBM)b;


/**
 *  获取某个位置的周边微博
 *
 *  @param access_token 用的token值
 *  @param myLocation   当前的位置
 *  @param count        获取数量
 *  @param b            获取的微博列表
 */
-(void)getWeiboNearByTimeLineWithToken:(NSString *)access_token WithLocation:(CLLocationCoordinate2D)myLocation Count:(NSInteger)count BlockHandle:(WBM)b;

@end
