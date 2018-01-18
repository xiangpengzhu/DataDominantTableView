//
//  DDCollectionViewCell.h
//  DataDominantTableView
//
//  Created by zhuxiangpeng on 2018/1/18.
//  Copyright © 2018年 xpz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDCollectionViewCellModel.h"


/**
 CollectionView cell 协议
 */
@protocol DDCollectionViewCell <NSObject>

@required
- (void)configureCellWithCellModel:(_Nonnull id<DDCollectionViewCellModel>)cellModel;
@end

