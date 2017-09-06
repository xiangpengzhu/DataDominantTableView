//
//  BigImageCell.swift
//  Example
//
//  Created by zhuxiangpeng on 2017/9/6.
//  Copyright © 2017年 xpz. All rights reserved.
//

import UIKit
import DataDominantTableView

fileprivate let imageRatio: CGFloat = 9.0 / 16.0
fileprivate let cellEdge: CGFloat = 10.0

class BigImageCellModel: NSObject, DDTableViewCellModel {
	
	var identifier: String {
		return "BigImageCell"
	}
	
	func cellHeight(withWidth width: CGFloat) -> CGFloat {
		let imageWidth = width - cellEdge * 2
		let imageHeight = imageWidth * imageRatio
		return imageHeight + cellEdge * 2
	}
	
	private(set) var image: UIImage?
	
	init(image: UIImage?) {
		self.image = image
		super.init()
	}
}

class BigImageCell: UITableViewCell, DDTableViewCell {

	@IBOutlet weak fileprivate var imageV: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
		selectionStyle = .none
		
		contentView.layoutMargins = UIEdgeInsetsMake(cellEdge, cellEdge, cellEdge, cellEdge)
		imageV.contentMode = .scaleAspectFill
		imageV.clipsToBounds = true
    }

	func configureCell(with cellModel: DDTableViewCellModel) {
		guard let cellModel = cellModel as? BigImageCellModel else {
			return
		}
		
		imageV.image = cellModel.image
	}
}
