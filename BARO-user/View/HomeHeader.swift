//
//  HomeHeader.swift
//  BARO-user
//
//  Created by Kang Mingu on 2020/09/23.
//

import UIKit

class HomeHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    let pageView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.setDimensions(width: 80, height: 28)
        view.layer.cornerRadius = 28 / 2
        return view
    }()
    
    let pageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "1 / 10"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        addSubview(pageView)
        addSubview(pageLabel)
        
        pageView.anchor(bottom: bottomAnchor, right: rightAnchor, paddingBottom: 20, paddingRight: 20)
        pageLabel.centerY(inView: pageView)
        pageLabel.centerX(inView: pageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers
        
}
