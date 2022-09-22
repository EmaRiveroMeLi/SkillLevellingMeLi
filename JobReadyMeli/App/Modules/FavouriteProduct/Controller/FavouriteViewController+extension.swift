//
//  FavouriteViewController+extension.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 22/09/2022.
//

import Foundation
import UIKit

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
