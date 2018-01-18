//
//  TextCollectionCell.swift
//  Example
//
//  Created by zhuxiangpeng on 2018/1/18.
//  Copyright © 2018年 xpz. All rights reserved.
//

import UIKit
import DataDominantTableView

class TextCollectionCellModel: NSObject, DDCollectionViewCellModel {
	var identifier: String {
		return "TextCollectionCell"
	}
	
	func cellSize() -> CGSize {
		return CGSize(width: 100, height: 100)
	}
	
	private(set) var title: String
	
	init(title: String) {
		self.title = title
		super.init()
	}
}

class TextCollectionCell: UICollectionViewCell, DDCollectionViewCell {

	@IBOutlet weak var titleL: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		contentView.backgroundColor = UIColor.gray
    }

	func configureCell(with cellModel: DDCollectionViewCellModel) {
		guard let cellModel = cellModel as? TextCollectionCellModel else {
			return
		}
		
		titleL.text = cellModel.title
	}
}
