//
//  ProductViewController.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 15/09/2022.
//

import UIKit

class ProductViewController: UIViewController {
    
    var service = ProductDescriptionService()
    var viewMargin: CGFloat = 16
    var productId: String?
    var listOfIds: [String] = []
    
    private lazy var backButton: UIButton = {
        let aButton = UIButton(frame: CGRect(x: 0, y: 0, width: 28, height: 32))
        aButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        view.addSubview(aButton)
        aButton.addTarget(self, action: #selector(backNavigation), for: .touchDown)
        aButton.tintColor = .textColorPrimary
        return aButton
    }()
    
    private lazy var cartButton: UIButton = {
        let aButton = UIButton(frame: CGRect(x: 0, y: 0, width: 28, height: 32))
        aButton.setImage(UIImage(systemName: "cart"), for: .normal)
        view.addSubview(aButton)
        aButton.tintColor = .textColorPrimary
        return aButton
    }()
    
    private lazy var searchButton: UIButton = {
        let aButton = UIButton(frame: CGRect(x: 0, y: 0, width: 28, height: 32))
        aButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        aButton.addTarget(self, action: #selector(backNavigation), for: .touchDown)
        view.addSubview(aButton)
        aButton.tintColor = .textColorPrimary
        return aButton
    }()
    
    private lazy var heartButton: UIButton = {
        let aButton = UIButton(frame: CGRect(x: 0, y: 0, width: 28, height: 32))
        aButton.setImage(UIImage(systemName: "heart"), for: .normal)
        view.addSubview(aButton)
        aButton.addTarget(self, action: #selector(addFavourite), for: .touchDown)
        aButton.tintColor = .textColorPrimary
        return aButton
    }()
    
    private lazy var scrollProduct: UIScrollView = {
        let aScroll = UIScrollView()
        aScroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aScroll)
        aScroll.adjustedContentInsetDidChange()
        aScroll.backgroundColor = .white
        aScroll.addSubview(contentView)
        return aScroll
    }()
    
    private lazy var contentView: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.backgroundColor = .white
        view.addSubview(aView)
        return aView
    }()
    
    private lazy var shippingView: UIView = {
        let aView = UIView()
        aView.backgroundColor = .mainColor
        aView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aView)
        return aView
    }()
    
    private lazy var shippingLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.textColor = .textColorPrimary
        let string = "Enviar a Nombre de Usuario - Dirección  >"
        let attributedText = NSMutableAttributedString(string: string)
        attributedText.addAttribute(.underlineStyle, value: 1, range: NSRange(location: 0, length: 38))
        aLabel.attributedText = attributedText
        aLabel.font = UIFont(name: "ProximaNova-Regular", size: 14)
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var littleTitleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.numberOfLines = 0
        aLabel.font = UIFont(name: "ProximaNova-Regular", size: 12)
        aLabel.textColor = .textColorDescription
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var bigTitleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.numberOfLines = 0
        aLabel.font = UIFont(name: "ProximaNova-Regular", size: 16)
        aLabel.textColor = .textColorPrimary
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var identityLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.textColor = .textColorDescription
        let string = "Vendedor con identidad verificada"
        let attributedText = NSMutableAttributedString(string: string)
        attributedText.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: NSRange(location: 13, length: 20))
        attributedText.addAttribute(.underlineStyle, value: 1, range: NSRange(location: 13, length: 20))
        aLabel.attributedText = attributedText
        aLabel.font = UIFont(name: "ProximaNova-Regular", size: 11)
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var productImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.contentMode = .scaleAspectFill
        aImage.clipsToBounds = true
        view.addSubview(aImage)
        return aImage
    }()
    
    private lazy var priceLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont(name: "ProximaNova-Regular", size: 36)
        aLabel.textColor = .textColorPrimary
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var stackButtonPrimary: UIStackView = {
        let aStack = UIStackView()
        aStack.axis = .horizontal
        aStack.translatesAutoresizingMaskIntoConstraints = false
        aStack.alignment = .center
        aStack.distribution = .fillEqually
        aStack.spacing = 9
        aStack.addArrangedSubview(questionButton)
        aStack.addArrangedSubview(whatsappButton)
        view.addSubview(aStack)
        return aStack
    }()
    
    private lazy var questionButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.layer.cornerRadius = 4
        aButton.backgroundColor = .secondaryColor
        aButton.addTarget(self, action: #selector(navigationWeb), for: .touchDown)
        aButton.setTitle("Preguntar", for: .normal)
        view.addSubview(aButton)
        return aButton
    }()
    
    private lazy var whatsappButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.layer.cornerRadius = 4
        aButton.backgroundColor = .secondaryColor
        aButton.setTitle(" Whatsapp", for: .normal)
        aButton.setImage(UIImage(systemName: "paperclip"), for: .normal)
        aButton.addTarget(self, action: #selector(navigationWeb), for: .touchDown)
        aButton.tintColor = .white
        view.addSubview(aButton)
        return aButton
    }()
    
    private lazy var stackButtonSecondary: UIStackView = {
        let aStack = UIStackView()
        aStack.axis = .horizontal
        aStack.translatesAutoresizingMaskIntoConstraints = false
        aStack.alignment = .center
        aStack.distribution = .fillProportionally
        aStack.spacing = 9
        aStack.addArrangedSubview(favouriteButton)
        aStack.addArrangedSubview(shareButton)
        view.addSubview(aStack)
        return aStack
    }()
    
    private lazy var favouriteButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setTitle(" Agregar a favoritos", for: .normal)
        aButton.setImage(UIImage(systemName: "heart"), for: .normal)
        aButton.addTarget(self, action: #selector(addFavourite), for: .touchDown)
        aButton.setTitleColor(.secondaryColor, for: .normal)
        aButton.tintColor = .secondaryColor
        view.addSubview(aButton)
        return aButton
    }()
    
    private lazy var shareButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setTitle(" Compartir", for: .normal)
        aButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        aButton.setTitleColor(.secondaryColor, for: .normal)
        aButton.tintColor = .secondaryColor
        view.addSubview(aButton)
        return aButton
    }()
    
    private lazy var titleDescriptionLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont(name: "ProximaNova-Regular", size: 16)
        aLabel.textColor = .textColorTitle
        aLabel.text = "Descripción"
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var oportunityLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont(name: "ProximaNova-Regular", size: 14)
        aLabel.textColor = .textColorTitle
        aLabel.text = "GRAN OPORTUNIDAD"
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var textDescriptionLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont(name: "ProximaNova-Regular", size: 14)
        aLabel.numberOfLines = 0
        aLabel.textColor = .textColorTitle
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        return aLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .mainColor
        navigationController?.navigationBar.backgroundColor = .mainColor
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: heartButton), UIBarButtonItem(customView: cartButton), UIBarButtonItem(customView: searchButton)
        ]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollProduct.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollProduct.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollProduct.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollProduct.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollProduct.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollProduct.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollProduct.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollProduct.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollProduct.widthAnchor),
//            contentView.heightAnchor.constraint(equalToConstant: 1500),
            
            shippingView.topAnchor.constraint(equalTo: contentView.topAnchor),
            shippingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shippingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            shippingView.heightAnchor.constraint(equalToConstant: 28),
            
            shippingLabel.leadingAnchor.constraint(equalTo: shippingView.leadingAnchor, constant: 16),
            shippingLabel.trailingAnchor.constraint(equalTo: shippingView.trailingAnchor, constant: -86),
            shippingLabel.bottomAnchor.constraint(equalTo: shippingView.bottomAnchor, constant: -11),
            
            littleTitleLabel.topAnchor.constraint(equalTo: shippingView.bottomAnchor, constant: 20),
            littleTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewMargin),
            littleTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewMargin),
            
            bigTitleLabel.topAnchor.constraint(equalTo: littleTitleLabel.bottomAnchor, constant: 6),
            bigTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewMargin),
            bigTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewMargin),
            
            identityLabel.topAnchor.constraint(equalTo: bigTitleLabel.bottomAnchor, constant: 4),
            identityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewMargin),
            identityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewMargin),
            
            productImage.topAnchor.constraint(equalTo: identityLabel.bottomAnchor, constant: 24),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewMargin),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewMargin),
            productImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productImage.heightAnchor.constraint(equalToConstant: 275),
            
            priceLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 24),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewMargin),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewMargin),
            
            stackButtonPrimary.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 25),
            stackButtonPrimary.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewMargin),
            stackButtonPrimary.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewMargin),
            
            questionButton.heightAnchor.constraint(equalToConstant: 48),
            
            whatsappButton.heightAnchor.constraint(equalToConstant: 48),
            
            stackButtonSecondary.topAnchor.constraint(equalTo: stackButtonPrimary.bottomAnchor, constant: 34),
            stackButtonSecondary.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewMargin),
            stackButtonSecondary.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewMargin),
            
            favouriteButton.heightAnchor.constraint(equalToConstant: 18),
            
            shareButton.heightAnchor.constraint(equalToConstant: 18),
            
            titleDescriptionLabel.topAnchor.constraint(equalTo: stackButtonSecondary.bottomAnchor, constant: 58),
            titleDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewMargin),
            titleDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -39),
            
            oportunityLabel.topAnchor.constraint(equalTo: titleDescriptionLabel.bottomAnchor, constant: 24),
            oportunityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewMargin),
            oportunityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -39),
            
            textDescriptionLabel.topAnchor.constraint(equalTo: oportunityLabel.bottomAnchor, constant: 24),
            textDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewMargin),
            textDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            textDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewMargin)
        ])
    }
   
    @objc func addFavourite() {
        heartButton.tintColor = .white
        if let ids = UserDefaults.standard.array(forKey: "listOfFavourites") as? [String] {
            listOfIds = ids
        }
        guard let productId = productId else {return}
        listOfIds.append(productId)
        UserDefaults.standard.set(listOfIds, forKey: "listOfFavourites")
    }
    
    @objc func backNavigation() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func navigationWeb() {
        guard let url = URL(string: Endpoint.navigationWeb) else {return}
        UIApplication.shared.open(url)
    }
    public func setupProduct(product: Product) {
        let detailProduct = product.body
        littleTitleLabel.text = detailProduct.title
        bigTitleLabel.text = detailProduct.title
        guard let url = detailProduct.pictures.first?.secureUrl else {return}
        productImage.load(url: url)
        priceLabel.text = "$\(detailProduct.price)"
        
        service.getProductDescription(id: detailProduct.id, onSuccess: { description in
            self.textDescriptionLabel.text = description.plainText
        })
        productId = detailProduct.id
        setupView()
    }
}
