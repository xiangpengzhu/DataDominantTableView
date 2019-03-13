//
//  DDCollectionViewAdapter.h
//  DataDominantTableView
//
//  Created by zhuxiangpeng on 2018/1/18.
//  Copyright © 2018年 xpz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DDCollectionViewSection;

@interface DDCollectionViewAdapter : NSObject<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong, nonnull) NSArray<DDCollectionViewSection *> *sections;
@property (nonatomic, strong, nullable) NSNumber *collectionViewWidth;
@property (nonatomic, strong, nullable) NSNumber *collectionViewHeight;

- (instancetype _Nonnull )initWithCollectionView: (UICollectionView *_Nonnull)collectionView;
@end
