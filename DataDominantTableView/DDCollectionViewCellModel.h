//
//  DDCollectionViewCellModel.h
//  DataDominantTableView
//
//  Created by zhuxiangpeng on 2018/1/18.
//  Copyright © 2018年 xpz. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 CollectionView cell model 协议
 */
@protocol DDCollectionViewCellModel <NSObject>

@required
@property (nonatomic, strong, readonly, nonnull) NSString * identifier;

@optional
- (CGSize)cellSize;
- (CGSize)cellSizeWithWidth:(CGFloat)width;

@property (nonatomic, copy, nullable) void (^cellDidSelectAction)();

@end
