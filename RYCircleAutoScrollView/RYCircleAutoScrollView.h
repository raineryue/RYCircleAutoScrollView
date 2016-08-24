//
//  RYCircleAutoScrollView.h
//  20151203001-UIScrollView-ScrollImage
//
//  Created by Rainer on 16/8/24.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef double RYTimeInterval;

@class RYCircleAutoScrollView;

@interface RYImageModel : NSObject

/** 图片服务器地址 */
@property (nonatomic, copy) NSString *serverUrl;
/** 图片名称 */
@property (nonatomic, copy) NSString *imageName;
/** 图片描述 */
@property (nonatomic, copy) NSString *imageDesc;
/** 跳转地址 */
@property (nonatomic, copy) NSString *drectUrl;

@end

@protocol RYCircleAutoScrollViewDelegate <NSObject>

@optional
/**
 *  点击了当前滚动图片代理方法
 *
 *  @param circleAutoScrollView 滚动视图
 *  @param index                当前图片索引
 */
- (void)circleAutoScrollView:(RYCircleAutoScrollView *)circleAutoScrollView didClickedAtIndex:(NSInteger)index;

@end

@interface RYCircleAutoScrollView : UIView

/** 滚动视图代理属性 */
@property (nonatomic, weak) id<RYCircleAutoScrollViewDelegate> delegate;

/**
 *  创建一个轮播图片播放器视图
 *
 *  @param frame           轮播图片滚动视图Frame
 *  @param imageModelArray 轮播图片集合
 *  @param timeInterval    图片播放间隔时间
 *
 *  @return 轮播图片滚动视图
 */
- (instancetype)initWithFrame:(CGRect)frame ImageModelArry:(NSArray<RYImageModel *> *)imageModelArray scrollTimeInterval:(RYTimeInterval)timeInterval;

/**
 *  快速创建一个轮播图片播放器视图
 *
 *  @param frame           轮播图片滚动视图Frame
 *  @param imageModelArray 轮播图片集合
 *  @param timeInterval    图片播放间隔时间
 *
 *  @return 轮播图片滚动视图
 */
+ (instancetype)circleAutoScrollViewWithFrame:(CGRect)frame ImageModelArry:(NSArray<RYImageModel *> *)imageModelArray scrollTimeInterval:(RYTimeInterval)timeInterval;

@end


