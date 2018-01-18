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
@property (nonatomic, assign, readonly) UIEdgeInsets inset;
@property (nonatomic, assign, readonly) CGFloat minimumLineSpacing;
@property (nonatomic, assign, readonly) CGFloat minimumInteritemSpacing;
@property (nonatomic, strong, nonnull, readonly) NSArray<id<DDCollectionViewCellModel>> *cellModels;

- (instancetype _Nonnull)initWithInset: (UIEdgeInsets)inset minimumLineSpacing: (CGFloat)minimumLineSpacing minimumInteritemSpacing: (CGFloat)minimumInteritemSpacing cellModels: (NSArray<id<DDCollectionViewCellModel>> *_Nonnull)cellModels;

@end
