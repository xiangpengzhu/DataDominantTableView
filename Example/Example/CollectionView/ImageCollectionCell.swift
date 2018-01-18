//
//  ImageCollectionCell.swift
//  Example
//
//  Created by zhuxiangpeng on 2018/1/18.
//  Copyright © 2018年 xpz. All rights reserved.
//

import UIKit
import DataDominantTableView

class ImageCollectionCellModel: NSObject, DDCollectionViewCellModel {
	var identifier: String {
		return "ImageCollectionCell"
	}
	
	func cellSize() -> CGSize {
		return CGSize(width: 200, height: 150)
	}
}

class ImageCollectionCell: UICollectionViewCell, DDCollectionViewCell {
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	func configureCell(with cellModel: DDCollectionViewCellModel) {
		
	}
}
