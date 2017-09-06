//
//  CustomTableViewAdapterViewController.swift
//  Example
//
//  Created by zhuxiangpeng on 2017/9/6.
//  Copyright © 2017年 xpz. All rights reserved.
//

import UIKit
import DataDominantTableView

class CustomTableViewAdapterViewController: UIViewController {
	
	fileprivate var tableView: UITableView!
	fileprivate var tableViewAdapter: CustomTableViewAdatper!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "子类化DDTableViewAdapter"
		
		buildTableView()
		
		tableView.register(UINib(nibName: "BigImageCell", bundle: nil), forCellReuseIdentifier: "BigImageCell")
		tableView.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
		
		tableViewAdapter = CustomTableViewAdatper(tableView: tableView)
		tableView.dataSource = tableViewAdapter
		tableView.delegate = tableViewAdapter
		
		setupCellModels()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		tableView.frame = self.view.bounds
	}
	
	private func buildTableView() {
		tableView = UITableView(frame: CGRect.zero, style: .grouped)
		view.addSubview(tableView)
	}
	
	private func setupCellModels() {
		var sections = [[DDTableViewCellModel]]()
		
		var section1 = [DDTableViewCellModel]()
		section1.append(contentsOf: [
			BigImageCellModel(image: UIImage(contentsOfFile: Bundle.main.path(forResource: "1", ofType: "jpg")!)),
			BigImageCellModel(image: UIImage(contentsOfFile: Bundle.main.path(forResource: "3", ofType: "jpg")!)),
			TextCellModel(text: "现在学习 JavaScript 和 Web 开发的人很多，他们都希望能凭此获得一份工作。然而，自学常常会使学习者对 JavaScript 语言本身的理解存在知识盲点。\n实际上，令人感到惊讶的是，他们只需要掌握很少的语言知识就能制作复杂的网页，然而这样通常不能很好掌握 JavaScript 的基础知识。\n使用基本的技能来实现功能和避免复杂的需求是相当容易的，通过依赖 Stack Overflow，而不理解复制来的代码以创建一个网站也是十分容易。"),
			])
		
		var section2 = [DDTableViewCellModel]()
		section2.append(contentsOf: [
			BigImageCellModel(image: UIImage(contentsOfFile: Bundle.main.path(forResource: "2", ofType: "jpg")!)),
			TextCellModel(text: "但问题是，许多技术公司在面试中提问时，目的是检验你对 JavaScript 是否真正理解。当求职者只是对 JavaScript 有浅显的认识，而不是深刻理解这门语言，面试官会很快清楚是什么情况。\n下面是一些 Web 开发面试中常见的概念。当然，我们假设你已经熟知诸如循环、函数和回调这些基本概念。"),
			])
		
		sections.append(contentsOf: [
			section1,
			section2
			])
		
		tableViewAdapter.tableSections = sections
		tableView.reloadData()
	}
	
	deinit {
		
	}
}


/// 自定义实现，改变TableView Grouped样式下，默认的Section的header和footer的高度
fileprivate class CustomTableViewAdatper: DDTableViewAdapter {
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "hello"
	}
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 20.0
	}
	
	override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 5.0
	}
}
