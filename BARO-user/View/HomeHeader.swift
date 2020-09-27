//
//  HomeHeader.swift
//  BARO-user
//
//  Created by Kang Mingu on 2020/09/23.
//

import UIKit

private let reusableCellIdentifier = "HomeHeaderCell"

class HomeHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = true
    
        return cv
    }()
    
    let pageView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.setDimensions(width: 42, height: 19)
        view.layer.cornerRadius = 19 / 2
        return view
    }()
    
    lazy var pageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        return label
    }()

    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(HomeHeaderCell.self, forCellWithReuseIdentifier: reusableCellIdentifier)
        
        addSubview(collectionView)
        addSubview(pageView)
        addSubview(pageLabel)
        
        collectionView.addConstraintsToFillView(self)
        pageView.anchor(bottom: bottomAnchor, right: rightAnchor, paddingBottom: 16, paddingRight: 16)
        pageLabel.centerY(inView: pageView)
        pageLabel.centerX(inView: pageView)
        
        pageLabel.text = "1/\(collectionView.numberOfItems(inSection: 0))"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers
        
}

// MARK: - reusableCellIdentifier

extension HomeHeader: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCellIdentifier, for: indexPath) as! HomeHeaderCell
        
        cell.backgroundColor = .yellow
        
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let page = Int(targetContentOffset.pointee.x / self.frame.width)
        self.pageLabel.text = "\(page+1)/\(collectionView.numberOfItems(inSection: 0))"
        
    }
    
}


// MARK: -

extension HomeHeader: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
