//
//  HomeCustomNavigationView.swift
//  BARO-user
//
//  Created by Kang Mingu on 2020/09/23.
//

import UIKit

protocol HomeCustomNavigationViewDelegate: class {
    func handleSelectButton()
    func handleSearchButton()
    func handleAlertButton()
}

class HomeCustomNavigationView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: HomeCustomNavigationViewDelegate?
    
    let underline: UIView = {
        let view = UIView()
        view.setDimensions(width: view.frame.width, height: 1)
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    let logo: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "person.3.fill"))
        iv.clipsToBounds = true
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    lazy var selectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.setDimensions(width: 16, height: 8)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.clipsToBounds = true
        button.addTarget(self, action: #selector(handleSelectButton), for: .touchUpInside)
        return button
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "search"), for: .normal)
        button.setDimensions(width: 20, height: 20)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.clipsToBounds = true
        button.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
        return button
    }()
    
    lazy var alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "alert"), for: .normal)
        button.setDimensions(width: 20, height: 20)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.clipsToBounds = true
        button.addTarget(self, action: #selector(handleAlertButton), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stack = UIStackView(arrangedSubviews: [locationLabel, selectButton])
        stack.spacing = 7
        stack.alignment = .leading
        
        addSubview(underline)
        addSubview(logo)
        addSubview(stack)
        addSubview(searchButton)
        addSubview(alertButton)
        
        underline.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        logo.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, paddingLeft: 16)
        stack.anchor(top: logo.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 16)
        alertButton.anchor(right: rightAnchor, paddingRight: 18.8)
        alertButton.centerY(inView: stack)
        searchButton.anchor(right: alertButton.leftAnchor, paddingRight: 20.9)
        searchButton.centerY(inView: stack)
        
        locationLabel.text = "강남구 서초동"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Selectors
    
    @objc func handleSelectButton() {
        delegate?.handleSelectButton()
    }
    
    @objc func handleSearchButton() {
        delegate?.handleSearchButton()
    }
    
    @objc func handleAlertButton() {
        delegate?.handleAlertButton()
    }
    
    
    // MARK: - Helpers
    
    
}
