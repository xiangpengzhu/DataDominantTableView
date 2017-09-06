//
//  TextCell.swift
//  Example
//
//  Created by zhuxiangpeng on 2017/9/6.
//  Copyright © 2017年 xpz. All rights reserved.
//

import UIKit
import DataDominantTableView

fileprivate let cellEdge: CGFloat = 10

class TextCellModel: NSObject, DDTableViewCellModel {
	var identifier: String {
		return "TextCell"
	}
	
	func cellHeight(with tableView: UITableView) -> CGFloat {
		if offscreenCell == nil {
			offscreenCell = tableView.dequeueReusableCell(withIdentifier: identifier) as! TextCell
		}
		
		offscreenCell.configureCell(with: self)
		offscreenCell.bounds = CGRect(x: 0.0, y: 0.0, width: tableView.bounds.width, height: offscreenCell.bounds.height)
		offscreenCell.setNeedsLayout()
		offscreenCell.layoutIfNeeded()
		
		let height = offscreenCell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
		return height + 1
	}
	
	private var offscreenCell: TextCell!
	
	private(set) var text: String
	
	init(text: String) {
		self.text = text
		super.init()
	}
}
class TextCell: UITableViewCell, DDTableViewCell {

	@IBOutlet fileprivate weak var textL: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	override func layoutSubviews() {
		super.layoutSubviews()
		self.textL.preferredMaxLayoutWidth = self.textL.frame.width
	}
 
	func configureCell(with cellModel: DDTableViewCellModel) {
		guard let cellModel = cellModel as? TextCellModel else {
			return
		}
		
		textL.text = cellModel.text
		
		setNeedsUpdateConstraints()
		updateConstraintsIfNeeded()
	}
}
