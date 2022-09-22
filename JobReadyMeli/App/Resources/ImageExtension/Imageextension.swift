//
//  Imageextension.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 15/09/2022.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: String) {
        guard let url = URL(string: url) else { return }
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}
