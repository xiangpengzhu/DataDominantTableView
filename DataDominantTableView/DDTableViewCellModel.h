//
//  DDTableViewCellModel.h
//  DataDominantTableView
//
//  Created by zhuxiangpeng on 2017/9/6.
//  Copyright © 2017年 xpz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DDTableViewCellModel <NSObject>

@required
@property (nonatomic, strong, readonly) NSString *identifier;

@optional
- (CGFloat)cellHeight;
- (CGFloat)cellHeightWithWidth:(CGFloat)width;
- (CGFloat)cellHeightWithTableView:(CGFloat)tableView;

@property (nonatomic, copy) void (^cellDidSelectAction)();

@end

@interface DDTableViewCellModel : NSObject

@end
