//
//  ViewController.swift
//  BARO-user
//
//  Created by Kang Mingu on 2020/09/23.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
    }
    
    
    // MARK: - Helper
    
    func configureViewControllers() {
        
        let home = HomeViewController()
        let nav1 = templateNavController(home, image: UIImage(named: "홈 off"))
        nav1.tabBarItem.image = UIImage(systemName: "person")
        
        let Bookmark = BookmarkViewController()
        let nav2 = templateNavController(Bookmark, image: UIImage(named: "찜 off"))
        nav2.tabBarItem.image = UIImage(systemName: "person")
        
        let status = OrderStatusViewController()
        let nav3 = templateNavController(status, image: UIImage(named: "주문현황 off"))
        nav3.tabBarItem.image = UIImage(systemName: "person")
        
        let history = OrderHistoryViewController()
        let nav4 = templateNavController(history, image: UIImage(named: "주문내역 off"))
        nav4.tabBarItem.image = UIImage(systemName: "person")
        
        let myPage = MyPageViewController()
        let nav5 = templateNavController(myPage, image: UIImage(named: "마이페이지 off"))
        nav5.tabBarItem.image = UIImage(systemName: "person")
        
        viewControllers = [nav1, nav2, nav3, nav4, nav5]
        
    }
    
    func templateNavController(_ rootViewController: UIViewController, image: UIImage?) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        
        return nav
    }


}

