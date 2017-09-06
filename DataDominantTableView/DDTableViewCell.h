//
//  DDTableViewCell.h
//  DataDominantTableView
//
//  Created by zhuxiangpeng on 2017/9/6.
//  Copyright © 2017年 xpz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDTableViewCellModel.h"


/**
 UITableView子类实现的协议
 */
@protocol DDTableViewCell <NSObject>

@required

/**
 显示数据方法

 @param cellModel 要显示的cellModel
 */
- (void)configureCellWithCellModel:(_Nonnull id<DDTableViewCellModel>)cellModel;
@end

