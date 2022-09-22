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

extension FavouriteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as! FavouriteTableViewCell
        let model = products[indexPath.row].body
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        159
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let productDeleted = products[indexPath.row].body.id
            listOfFavourites = listOfFavourites.filter{ $0 != productDeleted }
            self.products.remove(at: indexPath.row)
            self.favouriteProductTable.deleteRows(at: [indexPath], with: .automatic)
            UserDefaults.standard.set(listOfFavourites, forKey: "listOfFavourites")
        }
    }
}

extension FavouriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



    







