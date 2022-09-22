//
//  FavouriteViewController.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 19/09/2022.
//

import Foundation
import UIKit

class FavouriteViewController: UIViewController {
    
    var listOfFavourites: [String] = []
    var products: [Product] = []
    var service = SearchService()
    
    lazy var favouriteProductTable: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        aTable.backgroundColor = .white
        aTable.delegate = self
        aTable.dataSource = self
        aTable.register(FavouriteTableViewCell.self, forCellReuseIdentifier: "FavouriteTableViewCell")
        aTable.rowHeight = UITableView.automaticDimension
        view.addSubview(aTable)
        return aTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favoritos"
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let defaults = UserDefaults.standard
        if let ids = defaults.array(forKey: "listOfFavourites") as? [String] {
            listOfFavourites = ids
        }
        
        let idString = listOfFavourites.joined(separator: ",")
        service.getProductDetail(id: idString) { data in
            self.products = data
            self.favouriteProductTable.reloadData()
        } onError: {
            let alert = UIAlertController(title: "Error", message: "Sin conexion a internet.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func setupView() {
        setupConstraints()
        view.backgroundColor = .mainColor
        self.navigationController?.navigationBar.barTintColor = .mainColor
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            favouriteProductTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favouriteProductTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favouriteProductTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favouriteProductTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}




    







