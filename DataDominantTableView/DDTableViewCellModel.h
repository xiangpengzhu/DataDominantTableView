//
//  DDTableViewCellModel.h
//  DataDominantTableView
//
//  Created by zhuxiangpeng on 2017/9/6.
//  Copyright © 2017年 xpz. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 CellModel实现的协议
 */
@protocol DDTableViewCellModel <NSObject>

@required


/**
 cell的identifier,必须实现，同一个tableView里面的cell的identifier不能相同
 */
@property (nonatomic, strong, readonly, nonnull) NSString * identifier;

@optional

/**
 下面3个cellHeight方法，执行优先级为 cellHeight > cellHeightWithWidth > cellHeightWithTableView，如果优先执行的方法实现了，那么不执行其他的高度方法了
 */

/**
 cell高度（用于简单cell，直接返回一个浮点数）

 @return cell高度
 */
- (CGFloat)cellHeight;


/**
 cell高度（如果这个cell的高度和TableView的宽度有关系时，使用此方法；请参考Example的BigImageCell）

 @param width 当前TableView的宽度
 @return cell高度
 */
- (CGFloat)cellHeightWithWidth:(CGFloat)width;


/**
 cell高度（cell高度动态，根据内容多少觉得cell高度时使用此方法；详情请参考Example的TextCell）

 @param tableView 当前的tableView
 @return cell高度
 */
- (CGFloat)cellHeightWithTableView:(UITableView * _Nonnull)tableView;


/**
 当点击Cell时，执行的block
 */
@property (nonatomic, copy, nullable) void (^cellDidSelectAction)(void);

@end
