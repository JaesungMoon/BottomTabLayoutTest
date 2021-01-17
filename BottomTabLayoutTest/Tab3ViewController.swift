//
//  Tab3ViewController.swift
//  BottomTabLayoutTest
//
//  Created by JaesungMoon on 2021/01/16.
//

import UIKit

class Tab3ViewController: UIViewController {
    
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
        sc.isPagingEnabled = true
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
    var taskPlanView: TaskPlanView = {
        let v: TaskPlanView = UIView.fromNib()
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
        scrollView.delegate = self
//        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraintWithFormat(format: "H:|[v0]|", views: scrollView)
        contentView.addConstraintWithFormat(format: "V:|[v0]|", views: scrollView)
        
        scrollView.addSubview(taskBookSubjectView)
        taskBookSubjectView.frame = CGRect(x: 0, y: 0, width: 0, height: scrollView.frame.height)
//        bookSubjectView.parentViewController = self
        
        scrollView.addSubview(taskBookView)
        taskBookView.frame = CGRect(x: view.frame.width, y: 0, width: 0, height: scrollView.frame.height)
        
        scrollView.addSubview(taskPlanView)
        taskPlanView.frame = CGRect(x: view.frame.width * 2, y: 0, width: 0, height: scrollView.frame.height)
        
        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: scrollView.frame.height)
        
    }
    
    func switchContainerView(index: Int) {
        print("menuBarClicked index = \(index)")
//        let indexPath = IndexPath(item: index, section: 0)
////        menuBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionViewScrollPosition())
//        let offset = view.frame.width / 3.0 * CGFloat( index )
//        menuBar.horizontalBarLeftAnchorConstraint?.constant = offset
        
        
        let indexPath = IndexPath(item: index, section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition())
        let offset = view.frame.width/3.0 * CGFloat(index)
        menuBar.horizontalBarLeftAnchorConstraint?.constant = offset
        scrollView.contentOffset.x = view.frame.width * CGFloat(index)
//        currentContainerIndex = index
//        navigationItem.title = NavigationTitle.navigationTitle(index: index, isEdit: isEdit)

        
    }
}

extension Tab3ViewController: MenuBarDelegate {
    func menuBarClicked(index: Int) {
        switchContainerView(index: index)
    }
    
}

extension Tab3ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 3
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition())
    }
    
}
