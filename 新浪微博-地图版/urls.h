//
//  Information.h
//  NetWorking007世界城市
//
//  Created by YueWen on 15/9/15.
//  Copyright (c) 2015年 YueWen. All rights reserved.
//

#ifndef NetWorking007_____Information_h
#define NetWorking007_____Information_h

/**
 *  获取国家列表
 *
 *  @param 更详细 //获取国家列表
 */
#define get_country @"https://api.weibo.com/2/common/get_country.json"

/**
 *  获取省份列表
 *
 *  @param 更详细 获取省份列表
 */
#define get_province @"https://api.weibo.com/2/common/get_province.json"

/**
 *  获取城市列表
 *
 *  @param 更详细 获取城市列表
 */
#define get_city @"https://api.weibo.com/2/common/get_city.json"

/**
 *  获取最新的公共微博
 *
 *  @param 更详细 获取最新的公共微博
 */
#define public_timeline @"https://api.weibo.com/2/statuses/public_timeline.json"

/**
 *  获取当前登录用户以及其所关注用户的最新微博
 *
 *  @param 更详细 获取当前登录用户以及其所关注用户的最新微博
 */
#define home_timeline @"https://api.weibo.com/2/statuses/home_timeline.json"

/**
 *  获取当前登录用户以及其关注用户的最新微博(更详细)
 *
 *  @param 更详细 获取当前登录用户以及其关注用户的最新微博(更详细)
 */
#define friends_timeline @"https://api.weibo.com/2/statuses/friends_timeline.json"

/**
 *  发表文字
 *
 *  @param 更详细 发表文字
 */
#define statuses_updata @"https://api.weibo.com/2/statuses/update.json"

/**
 *  发送文字和图片
 *
 *  @param 更详细 发送文字和图片
 */
#define statuses_upload @"https://upload.api.weibo.com/2/statuses/upload.json"

/**
 *  根据微博ID返回评论列表
 *
 *  @param 更详细 根据微博ID返回评论列表
 */
#define comments_show @"https://api.weibo.com/2/comments/show.json"

/**
 *  将当前微博添加至收藏
 *
 *  @param 更详细 将当前微博添加至收藏
 */
#define favorite_creat @"https://api.weibo.com/2/favorites/create.json"

/**
 *  获取某个位置周边的动态
 *
 *  @param 更详细 获取某个位置周边的动态
 */
#define nearby_timeLine @"https://api.weibo.com/2/place/nearby_timeline.json"

/**
 *  获取某个位置的动态
 *
 *  @param 获取某个位置的动态
 */
#define poi_timeLine @"https://api.weibo.com/2/place/poi_timeline.json"


#endif
