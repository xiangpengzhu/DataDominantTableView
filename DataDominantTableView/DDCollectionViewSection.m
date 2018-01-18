//
//  DDCollectionViewSection.m
//  DataDominantTableView
//
//  Created by zhuxiangpeng on 2018/1/18.
//  Copyright © 2018年 xpz. All rights reserved.
//

#import "DDCollectionViewSection.h"

@interface DDCollectionViewSection()
@property (nonatomic, assign) UIEdgeInsets inset;
@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@property (nonatomic, strong, nonnull) NSArray<id<DDCollectionViewCellModel>> *cellModels;
@end

@implementation DDCollectionViewSection

- (instancetype)initWithInset:(UIEdgeInsets)inset minimumLineSpacing:(CGFloat)minimumLineSpacing minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing cellModels:(NSArray<id<DDCollectionViewCellModel>> *)cellModels
{
	self = [super init];
	if (self) {
		self.inset = inset;
		self.minimumLineSpacing = minimumLineSpacing;
		self.minimumInteritemSpacing = minimumInteritemSpacing;
		self.cellModels = cellModels;
	}
	return self;
}

@end
