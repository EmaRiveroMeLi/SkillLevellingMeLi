//
//  ExtensionSearchViewController.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 18/09/2022.
//

import Foundation
import UIKit


extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        let model = listOfProducts[indexPath.row].body
        cell.configure(model: model)
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        let model = listOfProducts[indexPath.row]
        vc.setupProduct(product: model)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
