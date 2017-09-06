//
//  MenuCell.swift
//  Example
//
//  Created by zhuxiangpeng on 2017/9/6.
//  Copyright © 2017年 xpz. All rights reserved.
//

import UIKit
import DataDominantTableView

class MenuCellModel: NSObject, DDTableViewCellModel {
	var identifier: String {
		return "MenuCell"
	}
	
	func cellHeight() -> CGFloat {
		return 45;
	}
	
	var cellDidSelectAction: (() -> Void)?
	private(set) var title: String
	
	init(title: String, cellDidSelectAction: (() -> Void)? = nil) {
		self.title = title
		self.cellDidSelectAction = cellDidSelectAction
		super.init()
	}
}

class MenuCell: UITableViewCell, DDTableViewCell {
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		selectionStyle = .gray
		accessoryType = .disclosureIndicator
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func configureCell(with cellModel: DDTableViewCellModel) {
		guard let cellModel = cellModel as? MenuCellModel else {
			return
		}
		
		self.textLabel?.text = cellModel.title
	}
}
