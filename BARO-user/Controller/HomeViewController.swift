//
//  HomeViewController.swift
//  BARO-user
//
//  Created by Kang Mingu on 2020/09/23.
//

import UIKit
import Kingfisher

private let headerIdentifier = "HeaderCell"
private let reusableCellIdentifier = "HomeCell"

class HomeViewController: UIViewController {
    
    // MARK: - Properteis
    
    var storeList = [StoreListModel]()
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    
    let topView = HomeCustomNavigationView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    
    // MARK: - Lifeycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        networkModel.post(method: .get, url: networkURL.storeListURL) { json in
            var storeModel = StoreListModel()
            for item in json["type"].array! {
                storeModel.type_code = item["type_code"].stringValue
                storeModel.type_name = item["type_name"].stringValue
                storeModel.type_image = item["type_image"].stringValue
                self.storeList.append(storeModel)
            }
            
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    // MARK: - Selectors
    
    
    // MARK: - Helpers

    func configureUI() {
        
        view.backgroundColor = .white
        topView.delegate = self
        
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerIdentifier)
        
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: reusableCellIdentifier)
        
        view.addSubview(topView)
        view.addSubview(collectionView)
        topView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 93)
        collectionView.anchor(top: topView.bottomAnchor, left: view.leftAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              right: view.rightAnchor)
    }

}


// MARK: - UICollectionViewDataSoucre/Delegate

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let store = storeList[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCellIdentifier, for: indexPath) as! HomeCell
        
        cell.textLabel.text = store.type_name
        cell.imageView.kf.setImage(with: URL(string: "http://15.165.22.64:8080/ImageType.do?image_name=" + store.type_image))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("TAPPED")
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 214)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 100) / 4, height: (view.frame.width - 100) / 4 + 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}


extension HomeViewController: HomeCustomNavigationViewDelegate {
    
    func handleSearchButton() {
        print("Search tapped form HomeViewController")
    }
    
    func handleAlertButton() {
        print("Alert tapped form HomeViewController")
    }
    
    func handleSelectButton() {
        print("Select tapped from HomeViewController")
    }
    
    
}
