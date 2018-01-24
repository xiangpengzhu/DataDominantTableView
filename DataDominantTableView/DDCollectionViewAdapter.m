//
//  DDCollectionViewAdapter.m
//  DataDominantTableView
//
//  Created by zhuxiangpeng on 2018/1/18.
//  Copyright © 2018年 xpz. All rights reserved.
//

#import "DDCollectionViewAdapter.h"
#import "DDCollectionViewSection.h"
#import "DDCollectionViewCell.h"

#define ErrorCollectionViewCellIdentifier @"DDCollectionViewCell"


@interface DDCollectionViewAdapter()
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation DDCollectionViewAdapter

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
{
	self = [super init];
	if (self) {
		self.sections = @[];
		self.collectionView = collectionView;

		[collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ErrorCollectionViewCellIdentifier];
	}
	return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return self.sections.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	DDCollectionViewSection *sectionModel = self.sections[section];
	return sectionModel.cellModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger section = indexPath.section;
	NSInteger row = indexPath.row;
	
	if (section < 0 || section > self.sections.count) {
		return [collectionView dequeueReusableCellWithReuseIdentifier:ErrorCollectionViewCellIdentifier forIndexPath:indexPath];
	}
	
	DDCollectionViewSection *sectionModel = self.sections[section];
	
	if (row < 0 || row > sectionModel.cellModels.count) {
		return [collectionView dequeueReusableCellWithReuseIdentifier:ErrorCollectionViewCellIdentifier forIndexPath:indexPath];
	}
	
	id<DDCollectionViewCellModel> cellModel = sectionModel.cellModels[row];
	UICollectionViewCell<DDCollectionViewCell> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellModel.identifier forIndexPath:indexPath];
	if (cell != nil) {
		[cell configureCellWithCellModel:cellModel];
		return cell;
	}
	
	return [collectionView dequeueReusableCellWithReuseIdentifier:ErrorCollectionViewCellIdentifier forIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger section = indexPath.section;
	NSInteger row = indexPath.row;
	
	if (section < 0 || section > self.sections.count) {
		return;
	}
	
	DDCollectionViewSection *sectionModel = self.sections[section];
	
	if (row < 0 || row > sectionModel.cellModels.count) {
		return;
	}
	
	id<DDCollectionViewCellModel> cellModel = sectionModel.cellModels[row];
	if ([cellModel respondsToSelector:@selector(cellDidSelectAction)] && cellModel.cellDidSelectAction != nil) {
		cellModel.cellDidSelectAction();
	}
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger section = indexPath.section;
	NSInteger row = indexPath.row;
	
	if (section < 0 || section > self.sections.count) {
		return CGSizeZero;
	}
	
	DDCollectionViewSection *sectionModel = self.sections[section];
	
	if (row < 0 || row > sectionModel.cellModels.count) {
		return CGSizeZero;
	}
	
	id<DDCollectionViewCellModel> cellModel = sectionModel.cellModels[row];
	if ([cellModel respondsToSelector:@selector(cellSize)]) {
		return [cellModel cellSize];
	}
	
	if ([cellModel respondsToSelector:@selector(cellSizeWithWidth:)]) {
		CGFloat width = collectionView.bounds.size.width;
		if (self.collectionViewWidth != nil) {
			width = (CGFloat)(self.collectionViewWidth.floatValue);
		}
		return [cellModel cellSizeWithWidth:width];
	}
	
	return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
	if (section < 0 || section > self.sections.count) {
		return UIEdgeInsetsZero;
	}
	
	DDCollectionViewSection *sectionModel = self.sections[section];
	return sectionModel.inset;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
	if (section < 0 || section > self.sections.count) {
		return 0.0;
	}
	
	DDCollectionViewSection *sectionModel = self.sections[section];
	return sectionModel.minimumLineSpacing;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
	if (section < 0 || section > self.sections.count) {
		return 0.0;
	}
	
	DDCollectionViewSection *sectionModel = self.sections[section];
	return sectionModel.minimumInteritemSpacing;
}
@end
