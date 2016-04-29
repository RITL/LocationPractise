//
//  WeiBoManager.m
//  新浪微博
//
//  Created by YueWen on 15/9/21.
//  Copyright (c) 2015年 YueWen. All rights reserved.
//

#import "WeiBoManager.h"
#import "AFNetworking.h"
#import "urls.h"
#import "Token.h"
#import "Weibo.h"



@interface WeiBoManager ()

@property(nonatomic,strong)AFHTTPRequestOperationManager * operationManager;

@end

@implementation WeiBoManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //初始化请求操作管理
        self.operationManager = [[AFHTTPRequestOperationManager alloc]init];
        
        //手动处理数据
        self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    
    return self;
}


+(instancetype)shareWeiBoManager
{
    static WeiBoManager * weiboManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        weiboManager = [[WeiBoManager alloc]init];
        
    });
    
    return weiboManager;
}

/**
 *  根据不同的字典转成不同的信息模型
 *
 *  @param dict 含参字典
 *
 *  @return 需要的信息模型
 */
//-(BaseMessage *)getMessage:(NSDictionary *)dict
//{
//    //如果没有博文图片
//    if (dict[@"thumbnail_pic"] == nil)
//    {
//        WZMessage * wzMessage = [[WZMessage alloc]init];
//        [wzMessage setInfo:dict];
//        return wzMessage;
//    }
//    
//    //如果有博文图片
//    else
//    {
//        TPMessage * tpMessage = [[TPMessage alloc]init];
//        [tpMessage setInfo:dict];
//        return tpMessage;
//    }
//    
//    return nil;
//}




/**
 *  获取当前登录用户以及其所有关注用户的最新微博
 *
 *  @param access_token 登录用户的token值
 *  @param count        获取微博的数量
 *  @param b            返回数据数组的代码块
 */
//-(void)requestWeiBoWithToken:(NSString *)access_token Count:(NSInteger)count BlockHandle:(WBM)b
//{
//    //创建参数字典
//    NSDictionary * parametersDict = @{@"access_token":token,@"count":[NSString stringWithFormat:@"%ld",count]};
//    
//    //开始请求
//    [self.operationManager GET:friends_timeline parameters:parametersDict success:^void(AFHTTPRequestOperation * operation, NSData * data)
//    {
//        NSError * error;
//        
//        //通过Json解析
//        NSDictionary * resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//        
//        //通过数组来接收@“statuses”数据
//        NSArray * statusesArray = resultDict[@"statuses"];
//        
//        //定义一个可变数组用来存储我们需要的数据
//        NSMutableArray * resultArray = [NSMutableArray arrayWithCapacity:statusesArray.count];
//        
//        //遍历
//        for (NSDictionary * tempDict in statusesArray)
//        {
//            BaseMessage * message = [self getMessage:tempDict];
//            
//            //存储到数据
//            [resultArray addObject:message];
//        }
//        
//        b([NSArray arrayWithArray:resultArray]);
//        
//        
//    } failure:^void(AFHTTPRequestOperation * operation, NSError * error)
//    {
//        
//        b(nil);
//        
//    }];
//}





/**
 *  发送文本微博
 *
 *  @param access_token 用户的toke值
 *  @param status       发送的文本内容
 *  @param b            发送结果
 */
//-(void)sendMessageWithToken:(NSString *)access_token status:(NSString *)status BlockHandle:(WBS)b
//{
//    //创建含参字典
//    NSDictionary * parametersDict = @{@"access_token":token,@"status":status};
//    
//    //开始请求
//    [self.operationManager POST:statuses_updata parameters:parametersDict success:^void(AFHTTPRequestOperation * operation, NSData * data )
//    {
//        //返回结果
//        b(YES);
//        
//    } failure:^void(AFHTTPRequestOperation * operation, NSError * error)
//    {
//        b(NO);
//    }];
//}







/**
 *  发送图片微博
 *
 *  @param access_token 用户的token值
 *  @param states       发送的文本内容
 *  @param image        发送的图片内容
 *  @param b            发送结果
 */
//-(void)sendMessageAndImageWithToken:(NSString *)access_token status:(NSString *)states Image:(UIImage *)image BlockHandle:(WBS)b
//{
//    //创建含参字典
//    NSDictionary * parametersDict = @{@"access_token":token,@"status":states};
//    
//    //开始请求
//    [self.operationManager POST:statuses_upload parameters:parametersDict constructingBodyWithBlock:^void(id<AFMultipartFormData> formData) {
//        
//        //将UIImage转成NSData
//        NSData * imageData = UIImageJPEGRepresentation(image, 1.0);
//        
//        //连接fromData数据
//        [formData appendPartWithFileData:imageData name:@"pic" fileName:@"image" mimeType:@"image/png/jpg"];
//        
//        
//    } success:^void(AFHTTPRequestOperation * operation, NSData * data) {
//        
//        b(YES);
//        
//    } failure:^void(AFHTTPRequestOperation * operation, NSError * error){
//        
//        b(NO);
//        
//    }];
//}


/**
 *  获取微博的评论列表
 *
 *  @param access_token 用户的token值
 *  @param Id           微博的id
 *  @param count        获取数量
 *  @param b            获取的评论列表
 */
//-(void)getCommentsWithToken:(NSString *)access_token WeiboId:(NSString *)Id Count:(NSInteger)count BlockHandle:(WBM)b
//{
//    //创建参数字典
//    NSDictionary * parametersDict = @{@"access_token":token,@"id":Id,@"count":[NSString stringWithFormat:@"%ld",count]};
//    
//    //执行操作
//    [self.operationManager GET:comments_show parameters:parametersDict success:^void(AFHTTPRequestOperation * operation, NSData * data) {
//        
//        NSError * error;
//        
//        //定义字典接收Json
//        NSDictionary * resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//        
//        //用数组接收
//        NSArray * comments = resultDict[@"comments"];
//        
//        //存取所需数据的数据
//        NSMutableArray * commentsArray = [NSMutableArray arrayWithCapacity:comments.count];
//        
//        //开始遍历
//        for (NSDictionary * dict in comments)
//        {
//            //创建模型
//            CommentsMessage * message = [[CommentsMessage alloc]init];
//            [message setInfo:dict];
//            
//            //数组添加对象
//            [commentsArray addObject:message];
//        }
//        
//        //传出
//        b([NSArray arrayWithArray:commentsArray]);
//        
//        
//    } failure:^void(AFHTTPRequestOperation * operation, NSError * error) {
//        b(nil);
//    }];
//    
//    
//}



/**
 *  将微博添加至收藏
 *
 *  @param access_token 用户的token值
 *  @param Id           微博的id
 *  @param b            发送结果
 */
//-(void)createFavoriteCommentWithToken:(NSString *)access_token WeiboId:(NSString *)Id BlockHandle:(WBS)b
//{
//    //创建参数字典
//    NSDictionary * parametersDict = @{@"access_token":token,@"id":Id};
//    
//    //开始请求
//    [self.operationManager POST:favorite_creat parameters:parametersDict success:^void(AFHTTPRequestOperation * operation, NSData * data) {
//        
//        b(YES);
//        
//    } failure:^void(AFHTTPRequestOperation * operation, NSError * error)
//    {
//        b(NO);
//    }];
//}

/**
 *  获取某个位置的周边微博
 *
 *  @param access_token 用的token值
 *  @param latitude     纬度值
 *  @param longtitute   经度值
 *  @param count        获取数量
 *  @param b            获取的微博列表
 */
-(void)getWeiboNearByTimeLineWithToken:(NSString *)access_token Latitude:(NSString *)latitude Longtitute:(NSString *)longtitute Count:(NSInteger)count BlockHandle:(WBM)b
{
    //创建参数字典
    NSDictionary * parameterDict = @{@"access_token":access_token,@"lat":latitude,@"long":longtitute,@"count":[NSString stringWithFormat:@"%ld",count]};
    
    //开始请求
    [self.operationManager GET:nearby_timeLine parameters:parameterDict success:^void(AFHTTPRequestOperation * operation, NSData * data) {
        
        NSError * error;
        
        //创建一个字典接收数据
        NSDictionary * resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        //接收数组
        NSArray * weiboArray = resultDict[@"statuses"];
        
        //创建一个可变数组，存储最后的结果
        NSMutableArray * resultArray = [NSMutableArray array];
        
        //开始遍历，并且添加数据
        for (NSDictionary * tempDict in weiboArray)
        {
            
            //创建一个微博模型
            Weibo * weibo = [[Weibo alloc]init];
            
            //开始赋值
            weibo.userName = tempDict[@"user"][@"name"];
            weibo.weiboText = tempDict[@"text"];
            
            //为坐标赋值
            NSString * lat = tempDict[@"geo"][@"coordinates"][0];
            NSString * longc = tempDict[@"geo"][@"coordinates"][1];
            CLLocationCoordinate2D temp = CLLocationCoordinate2DMake([lat doubleValue], [longc doubleValue]);
            weibo.weiboLocationCoordinate2D = temp;
            
//            NSLog(@"位置是:%g,%g",weibo.weiboLocationCoordinate2D.latitude,weibo.weiboLocationCoordinate2D.longitude);
            
            //添加到可变数组
            [resultArray addObject:weibo];
        }  
        
        //回调
        b([NSArray arrayWithArray:resultArray]);
        
    } failure:^void(AFHTTPRequestOperation * operation, NSError * error) {
        ;
    }];
}

/**
 *  获取某个位置的周边微博
 *
 *  @param access_token 用的token值
 *  @param myLocation   当前的位置
 *  @param count        获取数量
 *  @param b            获取的微博列表
 */
-(void)getWeiboNearByTimeLineWithToken:(NSString *)access_token WithLocation:(CLLocationCoordinate2D)myLocation Count:(NSInteger)count BlockHandle:(WBM)b
{
    //创建参数字典
    NSDictionary * parameterDict = @{@"access_token":access_token,@"lat":[NSString stringWithFormat:@"%lf",myLocation.latitude],@"long":[NSString stringWithFormat:@"%lf",myLocation.longitude],@"count":[NSString stringWithFormat:@"%ld",count]};
    
    //开始请求
    [self.operationManager GET:nearby_timeLine parameters:parameterDict success:^void(AFHTTPRequestOperation * operation, NSData * data) {
        
        NSError * error;
        
        //创建一个字典接收数据
        NSDictionary * resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        //接收数组
        NSArray * weiboArray = resultDict[@"statuses"];
        
        //创建一个可变数组，存储最后的结果
        NSMutableArray * resultArray = [NSMutableArray array];
        
        //开始遍历，并且添加数据
        for (NSDictionary * tempDict in weiboArray)
        {
            
            //创建一个微博模型
            Weibo * weibo = [[Weibo alloc]init];
            
            //开始赋值
            weibo.userName = tempDict[@"user"][@"name"];
            weibo.weiboText = tempDict[@"text"];
            
            //为坐标赋值
            NSString * lat = tempDict[@"geo"][@"coordinates"][0];
            NSString * longc = tempDict[@"geo"][@"coordinates"][1];
            CLLocationCoordinate2D temp = CLLocationCoordinate2DMake([lat doubleValue], [longc doubleValue]);
            weibo.weiboLocationCoordinate2D = temp;
            
            //NSLog(@"位置是:%g,%g",weibo.weiboLocationCoordinate2D.latitude,weibo.weiboLocationCoordinate2D.longitude);
            
            //添加到可变数组
            [resultArray addObject:weibo];
        }
        
        //回调
        b([NSArray arrayWithArray:resultArray]);
        
    } failure:^void(AFHTTPRequestOperation * operation, NSError * error) {
        ;
    }];
}


@end


