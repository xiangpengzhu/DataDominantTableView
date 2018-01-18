//
//  DDCollectionViewSection.h
//  DataDominantTableView
//
//  Created by zhuxiangpeng on 2018/1/18.
//  Copyright © 2018年 xpz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DDCollectionViewCellModel.h"


/**
 保存section的layout属性
 */
@interface DDCollectionViewSection : NSObject
@property (nonatomic, assign) UIEdgeInsets inset;
@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@property (nonatomic, strong, nonnull) NSArray<id<DDCollectionViewCellModel>> *cellModels;

- (instancetype _Nonnull)initWithInset: (UIEdgeInsets)inset minimumLineSpacing: (CGFloat)minimumLineSpacing minimumInteritemSpacing: (CGFloat)minimumInteritemSpacing;

@end
