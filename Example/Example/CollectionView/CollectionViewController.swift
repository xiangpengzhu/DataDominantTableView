//
//  CollectionViewController.swift
//  Example
//
//  Created by zhuxiangpeng on 2018/1/18.
//  Copyright © 2018年 xpz. All rights reserved.
//

import UIKit
import DataDominantTableView



class CollectionViewController: UIViewController {

	private var collectionView: UICollectionView!
	private var adapter: DDCollectionViewAdapter!
	private var sections: [DDCollectionViewSection]!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "CollectionView"
		
		view.backgroundColor = UIColor.white
		sections = [DDCollectionViewSection]()
		
		let layout = UICollectionViewFlowLayout()
		collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.backgroundColor = UIColor.white
		view.addSubview(collectionView)
		
		collectionView.register(UINib(nibName: "TextCollectionCell", bundle: nil), forCellWithReuseIdentifier: "TextCollectionCell")
		collectionView.register(UINib(nibName: "ImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionCell")
		
		adapter = DDCollectionViewAdapter(collectionView: collectionView)
		collectionView.dataSource = adapter
		collectionView.delegate = adapter
		
		buildData()
    }
	
	private func buildData() {
		
		var section1Array = [TextCollectionCellModel]()
		for i in 0..<20 {
			let text = TextCollectionCellModel(title: "\(i)")
			section1Array.append(text)
		}
		let section1 = DDCollectionViewSection(inset: UIEdgeInsetsMake(10, 10, 10, 10), minimumLineSpacing: 10, minimumInteritemSpacing: 10, cellModels: section1Array)
		
		
		var section2Array = [ImageCollectionCellModel]()
		for _ in 0..<20 {
			let image = ImageCollectionCellModel()
			section2Array.append(image)
		}
		let section2 = DDCollectionViewSection(inset: UIEdgeInsetsMake(0, 0, 0, 0), minimumLineSpacing: 30, minimumInteritemSpacing: 30, cellModels: section2Array)
		
		adapter.sections = [
			section1, section2
		]
		collectionView.reloadData()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		collectionView.frame = view.bounds
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
