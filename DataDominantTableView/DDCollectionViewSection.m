//
//  DDCollectionViewSection.m
//  DataDominantTableView
//
//  Created by zhuxiangpeng on 2018/1/18.
//  Copyright © 2018年 xpz. All rights reserved.
//

#import "DDCollectionViewSection.h"

@interface DDCollectionViewSection()
@end

@implementation DDCollectionViewSection

- (instancetype)initWithInset:(UIEdgeInsets)inset minimumLineSpacing:(CGFloat)minimumLineSpacing minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
{
	self = [super init];
	if (self) {
		self.inset = inset;
		self.minimumLineSpacing = minimumLineSpacing;
		self.minimumInteritemSpacing = minimumInteritemSpacing;
		self.cellModels = [[NSArray alloc] init];
	}
	return self;
}

@end
