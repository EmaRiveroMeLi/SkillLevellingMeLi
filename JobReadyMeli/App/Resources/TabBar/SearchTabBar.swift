//
//  SearchTabBar.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 18/09/2022.
//

import UIKit

class SearchTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        let vc1 = UINavigationController(rootViewController: SearchViewController())
        let vc2 = UINavigationController(rootViewController: FavouriteViewController())
        let vc3 = UINavigationController(rootViewController: MyShopsViewController())
        let vc4 = UINavigationController(rootViewController: NotificationsViewController())
        let vc5 = UINavigationController(rootViewController: MoreViewController())
        
        vc1.title = "Inicio"
        vc2.title = "Favoritos"
        vc3.title = "Mis Compras"
        vc4.title = "Notificaciones"
        vc5.title = "Más"
        
        self.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        
        guard let items = self.tabBar.items else {return}
        
        let images = ["house", "heart", "bag", "bell", "ellipsis"]
        
        for index in 0..<items.count {
            items[index].image = UIImage(systemName: images[index])
        }
    }
}


class NotificationsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = "Mis notificaciones"
      
    }
}

class MyShopsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        title = "Mis compras"
    }
}

class MoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        title = "Más"
    }
}

