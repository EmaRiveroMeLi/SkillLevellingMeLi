//
//  FavouriteTableViewCell.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 19/09/2022.


import UIKit

class FavouriteTableViewCell: UITableViewCell {
    
    
    private lazy var productImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.contentMode = .scaleAspectFit
        aImage.clipsToBounds = true
        aImage.layer.cornerRadius = 4
        contentView.addSubview(aImage)
        return aImage
    }()
        
    private lazy var titleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.textColor = .gray
        aLabel.numberOfLines = 0
        aLabel.font = UIFont(name: "ProximaNova-Regular", size: 13)
        aLabel.textColor = .textColorTitle
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var priceLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont(name: "ProximaNova-Regular", size: 20)
        aLabel.textColor = .textColorPrimary
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont(name: "ProximaNova-Regular", size: 13)
        aLabel.textColor = .textColorDescription
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var locationLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont(name: "ProximaNova-Regular", size: 13)
        aLabel.textColor = .textColorDescription
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aLabel)
        return aLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            productImage.widthAnchor.constraint(equalToConstant: 131),
            productImage.heightAnchor.constraint(equalToConstant: 131),
            
            titleLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            locationLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            locationLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    func configure(model: Body) {
        titleLabel.text = model.title
        priceLabel.text = String("$\(model.price)")
        descriptionLabel.text = useDescription()
        let url = model.secureThumbnail
        productImage.load(url: url)
        locationLabel.text = "\(model.sellerAddress.city.name), \(model.sellerAddress.country.name)"
        
        func useDescription()-> String {
            model.condition == "new" ? "Nuevo" : "Usado"
        }
    }
}


