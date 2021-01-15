//
//  Tab3ViewController.swift
//  BottomTabLayoutTest
//
//  Created by JaesungMoon on 2021/01/16.
//

import UIKit

class Tab3ViewController: UIViewController, MenuBarDelegate {
    func menuBarClicked(index: Int) {
        print("menuBarClicked index = \(index)")
        let indexPath = IndexPath(item: index, section: 0)
//        menuBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionViewScrollPosition())
        let offset = view.frame.width / 3.0 * CGFloat( index )
        menuBar.horizontalBarLeftAnchorConstraint?.constant = offset
    }
    
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var topView: UIView!
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.titleList = ["勉強タスク", "登録タスク", "予定"]
        mb.delegate = self
        return mb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tab3ViewController:viewDidLoad")
        view.backgroundColor = .yellow
        setupMenuBar()
        
    }
    
    private func setupMenuBar() {
        topView.addSubview(menuBar)
        topView.addConstraintWithFormat(format: "H:|[v0]|", views: menuBar)
        topView.addConstraintWithFormat(format: "V:|[v0]|", views: menuBar)
    }
}

