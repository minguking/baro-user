//
//  HomeCell.swift
//  BARO-user
//
//  Created by Kang Mingu on 2020/09/23.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .white
        iv.setDimensions(width: 48, height: 48)
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 48 / 2
        return iv
    }()
    
    let textLabel: UILabel = {
        let text = UILabel()
        text.textAlignment = .center
        return text
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .green
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 48)
        
        addSubview(textLabel)
        textLabel.anchor(top:imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        imageView.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers
}
