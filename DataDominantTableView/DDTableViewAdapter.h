//
//  DDTableViewAdapter.h
//  DataDominantTableView
//
//  Created by zhuxiangpeng on 2017/9/6.
//  Copyright © 2017年 xpz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDTableViewCellModel.h"


/**
 默认的UITableViewDataSource和UITableViewDelegate的实现方法，如果要扩展功能，可以继承此类
 */
@interface DDTableViewAdapter : NSObject<UITableViewDataSource, UITableViewDelegate>


/**
 tableView显示cellModel的二维数组
 显示数据时，如下调用：
 adapter.tableSections = ...
 tableView.reloadData()
 */
@property (nonatomic, strong, nonnull) NSArray<NSArray<id<DDTableViewCellModel>> *> *tableSections;


/**
 构造函数

 @param tableView 当前TableView(注：DDTableViewAdapter弱引用tableView)
 @return 实例
 */
- (instancetype _Nonnull )initWithTableView: (UITableView *_Nonnull)tableView;
@end
