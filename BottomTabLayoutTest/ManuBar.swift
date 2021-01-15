//
//  ManuBar.swift
//  BottomTabLayoutTest
//
//  Created by JaesungMoon on 2021/01/16.
//

import UIKit

protocol MenuBarDelegate: class {
    func menuBarClicked(index: Int)
}

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let cellId = "MenuCell"
    var titleList = ["Menu1", "Menu2", "Menu3"]

    weak var delegate: MenuBarDelegate?
    var enable: Bool = true {
        didSet {
            collectionView.reloadData()
        }
    }
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintWithFormat(format: "V:|[v0]|", views: collectionView)
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
        
        setupHorizontalBackgroundBar()
        setupHorizontalBar()
    }
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    func setupHorizontalBar() {
        
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = ColorUtil.tabBarTintColor()
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)

        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.333).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    func setupHorizontalBackgroundBar() {
        let horizontalBackgroundBarView = UIView()
        horizontalBackgroundBarView.backgroundColor = ColorUtil.tabBarTintColor()
        horizontalBackgroundBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBackgroundBarView)
        
        horizontalBackgroundBarView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        horizontalBackgroundBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBackgroundBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        horizontalBackgroundBarView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.isUserInteractionEnabled = enable
        cell.label.text = titleList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/CGFloat(titleList.count), height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.menuBarClicked(index: indexPath.row)
    }
}


