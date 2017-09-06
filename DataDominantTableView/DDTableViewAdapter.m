//
//  DDTableViewAdapter.m
//  DataDominantTableView
//
//  Created by zhuxiangpeng on 2017/9/6.
//  Copyright © 2017年 xpz. All rights reserved.
//

#import "DDTableViewAdapter.h"
#import "DDTableViewCell.h"

#define ErrorCellIdentifier @"DDTableViewErrorCell"

@interface DDTableViewAdapter ()
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation DDTableViewAdapter

- (instancetype)initWithTableView: (UITableView *)tableView
{
	self = [super init];
	if (self) {
		self.tableSections = @[@[]];
		self.tableView = tableView;
		
		[tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ErrorCellIdentifier];
	}
	return self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return self.tableSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section < 0 || section > self.tableSections.count) {
		return 0;
	}
	
	NSArray *rows = self.tableSections[section];
	return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger section = indexPath.section;
	NSInteger row = indexPath.row;
	
	if (section < 0 || section > self.tableSections.count) {
		return [tableView dequeueReusableCellWithIdentifier:ErrorCellIdentifier forIndexPath:indexPath];
	}
	
	NSArray *rows = self.tableSections[section];
	
	if (row < 0 || row > rows.count) {
		return [tableView dequeueReusableCellWithIdentifier:ErrorCellIdentifier forIndexPath:indexPath];
	}

	id<DDTableViewCellModel> cellModel = rows[row];
	UITableViewCell<DDTableViewCell> *cell = [tableView dequeueReusableCellWithIdentifier:cellModel.identifier forIndexPath:indexPath];
	if (cell != nil) {
		[cell configureCellWithCellModel:cellModel];
		return cell;
	}
	
	return [tableView dequeueReusableCellWithIdentifier:ErrorCellIdentifier forIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger section = indexPath.section;
	NSInteger row = indexPath.row;
	
	if (section < 0 || section > self.tableSections.count) {
		return 0;
	}
	
	NSArray *rows = self.tableSections[section];
	
	if (row < 0 || row > rows.count) {
		return 0;
	}
	
	id<DDTableViewCellModel> cellModel = rows[row];
	if ([cellModel respondsToSelector:@selector(cellHeight)]) {
		return [cellModel cellHeight];
	}
	
	if ([cellModel respondsToSelector:@selector(cellHeightWithWidth:)]) {
		return [cellModel cellHeightWithWidth:tableView.bounds.size.width];
	}
	
	if ([cellModel respondsToSelector:@selector(cellHeightWithTableView:)]) {
		return [cellModel cellHeightWithTableView:tableView];
	}
	
	return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	NSInteger section = indexPath.section;
	NSInteger row = indexPath.row;
	
	if (section < 0 || section > self.tableSections.count) {
		return;
	}
	
	NSArray *rows = self.tableSections[section];
	
	if (row < 0 || row > rows.count) {
		return;
	}
	
	id<DDTableViewCellModel> cellModel = rows[row];
	if ([cellModel respondsToSelector:@selector(cellDidSelectAction)] && cellModel.cellDidSelectAction != nil) {
		cellModel.cellDidSelectAction();
	}
}

@end
