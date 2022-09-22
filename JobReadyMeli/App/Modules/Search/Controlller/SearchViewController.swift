//
//  ViewController.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 13/09/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    var listOfProducts: [Product] = []
    var service = SearchService()
    
    private lazy var searchBar: UISearchBar = {
        let aSearch = UISearchBar()
        aSearch.backgroundColor = .mainColor
        aSearch.searchTextField.backgroundColor = .white
        aSearch.placeholder = "Buscar en Mercado Libre"
        aSearch.delegate = self
        return aSearch
    }()
    
    private lazy var cartButton: UIButton = {
        let aButton = UIButton(frame: CGRect(x: 0, y: 0, width: 28, height: 32))
        aButton.setImage(UIImage(systemName: "cart"), for: .normal)
        view.addSubview(aButton)
        aButton.tintColor = .textColorPrimary
        return aButton
    }()
    
    private lazy var backButton: UIButton = {
        let aButton = UIButton(frame: CGRect(x: 0, y: 0, width: 28, height: 32))
        aButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        view.addSubview(aButton)
        aButton.tintColor = .textColorPrimary
        return aButton
    }()
    
    private lazy var productTable: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        aTable.backgroundColor = .white
        aTable.delegate = self
        aTable.dataSource = self
        aTable.rowHeight = UITableView.automaticDimension
        view.addSubview(aTable)
        aTable.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        return aTable
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .mainColor
        self.navigationItem.titleView = searchBar
        self.navigationController?.navigationBar.standardAppearance.backgroundColor = UIColor.mainColor
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartButton)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            productTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        self.service.getCategory(query: searchText) { predictive in
            guard let categoryId = predictive.first?.categoryId else {return}
            self.service.getTopTwenty(id: categoryId) { items in
                self.service.getProductDetail(id: items) { products in
                    self.listOfProducts = products
                    self.productTable.reloadData()
                }
            }
        }
    }
}
                         


