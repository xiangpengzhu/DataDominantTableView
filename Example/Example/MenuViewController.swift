//
//  MenuViewController.swift
//  Example
//
//  Created by zhuxiangpeng on 2017/9/6.
//  Copyright © 2017年 xpz. All rights reserved.
//

import UIKit
import DataDominantTableView

class MenuViewController: UIViewController {

	@IBOutlet fileprivate weak var tableView: UITableView!
	fileprivate var tableViewAdapter: DDTableViewAdapter!

	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "DataDominantTableView"
		
		//首先注册cell
		tableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
		
		//创建DDTableViewAdapter，并且指定代理
		tableViewAdapter = DDTableViewAdapter(tableView: tableView)
		tableView.dataSource = tableViewAdapter;
		tableView.delegate = tableViewAdapter;
		
		//填充数据
		setupCellModels()
    }
	
	private func setupCellModels() {
		tableViewAdapter.tableSections = [[
			MenuCellModel(title: "直接使用DDTableViewAdapter", cellDidSelectAction: {
				[weak self] in self?.goToUseDDTableViewAdapterDirectly()
			}),
			MenuCellModel(title: "子类化DDTableViewAdapter", cellDidSelectAction: {
				[weak self] in self?.goToUseCustomTableViewAdapterDirectly()
			}),
			]]
		tableView.reloadData()
	}

	private func goToUseDDTableViewAdapterDirectly() {
		let viewController = DDTableViewAdapterViewController()
		self.navigationController?.pushViewController(viewController, animated: true)
	}
	
	private func goToUseCustomTableViewAdapterDirectly() {
		let viewController = CustomTableViewAdapterViewController()
		self.navigationController?.pushViewController(viewController, animated: true)
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
