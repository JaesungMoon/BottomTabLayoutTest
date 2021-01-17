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
    
//    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.titleList = ["勉強タスク", "登録タスク", "予定"]
        mb.delegate = self
        return mb
    }()
    
    var scrollView: UIScrollView = {
        let sc = UIScrollView()
        sc.bounces = false
        sc.showsVerticalScrollIndicator = false
        sc.showsHorizontalScrollIndicator = false
        return sc
    }()
    
    var taskBookSubjectView: TaskBookSubjectView = {
        let v: TaskBookSubjectView = UIView.fromNib()
        return v
    }()
    var taskBookView: TaskBookView = {
        let v: TaskBookView = UIView.fromNib()
        return v
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tab3ViewController:viewDidLoad")
        view.backgroundColor = .yellow
        setupMenuBar()
        initContentViews()
    }
    
    private func setupMenuBar() {
        topView.addSubview(menuBar)
        topView.addConstraintWithFormat(format: "H:|[v0]|", views: menuBar)
        topView.addConstraintWithFormat(format: "V:|[v0]|", views: menuBar)
    }
    
    private func initContentViews() {
        contentView.addSubview(scrollView)
//        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraintWithFormat(format: "H:|[v0]|", views: scrollView)
        contentView.addConstraintWithFormat(format: "V:|[v0]|", views: scrollView)
        
        scrollView.addSubview(taskBookSubjectView)
        taskBookSubjectView.frame = CGRect(x: 0, y: 0, width: 0, height: scrollView.frame.height)
//        bookSubjectView.parentViewController = self
        
        scrollView.addSubview(taskBookView)
        taskBookView.frame = CGRect(x: view.frame.width, y: 0, width: 0, height: scrollView.frame.height)
        
        scrollView.contentSize = CGSize(width: view.frame.width * 2, height: scrollView.frame.height)
    }
    
}

