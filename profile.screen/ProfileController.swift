//
//  ViewController.swift
//  profile.screen
//
//  Created by Kurbash on 03.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let headercontaioner = UIStackView()
    let searchBar = UISearchBar()
    let nameLabel = UILabel()
    let favButton = UIButton()
    let historyButton = UIButton()
    let buttonContainer = UIStackView()
    let barColor = UINavigationBar()
    let additionalbutton1 = UIButton()
    let additionalbutton2 = UIButton()
    let additionalbutton3 = UIButton()
    let additionalbutton4 = UIButton()
    let additionalStackButton = UIStackView()
    let productsScroll = UIScrollView()
    let contetScrollStackView = UIStackView()
    let footerView = UIView()
    let line1 = UIView()
    let line2 = UIView()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        if let windowScene = view.window?.windowScene {
                    let statusBarHeight = windowScene.statusBarManager?.statusBarFrame.height ?? 0
                    let statusBarBackgroundView = UIView()
                    statusBarBackgroundView.backgroundColor = UIColor.systemGray5
                    statusBarBackgroundView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: statusBarHeight)
                    view.addSubview(statusBarBackgroundView)
                }
        
        
        setupView()
        setupConstraints()
        productCell()
        setupFooterView()
    }
    
    
    private func setupView(){
        // header with name, searchbar and two buttons
        headercontaioner.axis = .vertical
        headercontaioner.spacing = 32
        headercontaioner.distribution = .fillEqually
        headercontaioner.layer.cornerRadius = 8
        headercontaioner.translatesAutoresizingMaskIntoConstraints = false
        headercontaioner.addSubview(searchBar)
        headercontaioner.addSubview(nameLabel)
        headercontaioner.addSubview(buttonContainer)
        headercontaioner.backgroundColor = .systemGray5
        view.addSubview(headercontaioner)
    
        
        searchBar.placeholder = "Искать"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = .white
        
        nameLabel.text = "Фамилия Имя"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setupButton(favButton, title: "Избранное", subTitle: "40", imageName: "heart.fill")
        setupButton(historyButton, title: "Покупки", subTitle: "Заказать снова", imageName: "cart.fill")
        setupStackButton(additionalbutton1, title: "Настройки", imageName: "chevron.forward")
        setupStackButton(additionalbutton2, title: "Язык", imageName: "chevron.forward")
        setupStackButton(additionalbutton3, title: "О приложении", imageName: "chevron.forward")
        setupStackButton(additionalbutton4, title: "Помощь", imageName: "chevron.forward")
        
        
        
        buttonContainer.axis = .horizontal
        buttonContainer.distribution = .fillEqually
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.spacing = 16
        buttonContainer.addArrangedSubview(favButton)
        buttonContainer.addArrangedSubview(historyButton)
        
        barColor.barTintColor = .systemGray5
        
        additionalStackButton.axis = .vertical
        additionalStackButton.spacing = 2
        additionalStackButton.layer.cornerRadius = 32
        additionalStackButton.distribution = .fillEqually
        additionalStackButton.translatesAutoresizingMaskIntoConstraints = false
        additionalStackButton.addArrangedSubview(additionalbutton1)
        additionalStackButton.addArrangedSubview(additionalbutton2)
        additionalStackButton.addArrangedSubview(additionalbutton3)
        additionalStackButton.addArrangedSubview(additionalbutton4)
        view.addSubview(additionalStackButton)
        
        productsScroll.translatesAutoresizingMaskIntoConstraints = false
        productsScroll.showsHorizontalScrollIndicator = false
        
        contetScrollStackView.axis = .horizontal
        contetScrollStackView.spacing = 8
        contetScrollStackView.translatesAutoresizingMaskIntoConstraints = false
        productsScroll.addSubview(contetScrollStackView)
        view.addSubview(productsScroll)
        
        footerView.layer.cornerRadius = 16
        footerView.backgroundColor = .systemGray5
        footerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footerView)
        
        line1.backgroundColor = .systemGray4
        view.addSubview(line1)
        line2.backgroundColor = .systemGray4
        view.addSubview(line2)
        
        
        
        
    }
    
    func productCell(){
        for product in productsArray {
            let productView = UIView()
            productView.widthAnchor.constraint(equalToConstant: 150).isActive = true
            productView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            productView.layer.borderColor = UIColor.lightGray.cgColor
            productView.layer.borderWidth = 1.0
            productView.layer.cornerRadius = 8.0
            productView.clipsToBounds = true
            
            let imageView = UIImageView(image: product.image)
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.tintColor = .black
            productView.addSubview(imageView)
            
            let label = UILabel()
            label.text = product.title
            label.textColor = .black
            label.numberOfLines = 2
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 14)
            label.translatesAutoresizingMaskIntoConstraints = false
            productView.addSubview(label)
            
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: productView.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: productView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: productView.trailingAnchor),
                imageView.heightAnchor.constraint(equalTo: productView.heightAnchor, multiplier: 0.7),
                
                label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                label.leadingAnchor.constraint(equalTo: productView.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: productView.trailingAnchor),
                label.bottomAnchor.constraint(equalTo: productView.bottomAnchor)
            ])
            
            
            contetScrollStackView.addArrangedSubview(productView)
        }
        
    }
    
    private func setupFooterView(){
        let footerStackView = UIStackView()
        footerStackView.axis = .horizontal
        footerStackView.alignment = .fill
        footerStackView.distribution = .fillEqually
        footerStackView.spacing = 20
        footerStackView.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(footerStackView)
        
        let buttonTitle = ["Главная", "Каталог", "Корзина", "Мой профиль"]
        let buttonImages = ["house.circle.fill", "bag.fill.badge.plus","basket.fill", "person.fill"]
        
        for (index, title) in buttonTitle.enumerated() {
                let button = UIButton(type: .system)
                setupStackButtonFooter(button, title: title, imageName: buttonImages[index])
                footerStackView.addArrangedSubview(button)
            }
        
        NSLayoutConstraint.activate([
                footerStackView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 18),
                footerStackView.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -18),
                footerStackView.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 8),
                footerStackView.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -8)
            ])
    }
    
    
    private func setupStackButtonFooter(_ button: UIButton, title: String, imageName: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        
        NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 80),
                button.widthAnchor.constraint(equalToConstant: 80)
            ])

        
        let containerView = UIStackView()
        containerView.axis = .vertical
        containerView.alignment = .center
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.spacing = 8

        
        if let image = UIImage(systemName: imageName) {
            let imageView = UIImageView(image: image)
            imageView.tintColor = .black
            imageView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addArrangedSubview(imageView)
            
            
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 30),
                imageView.heightAnchor.constraint(equalToConstant: 30)
            ])
        }

        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 10)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addArrangedSubview(titleLabel)

        
        button.addSubview(containerView)

        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
    }
    
    
    
    private func setupStackButton(_ button: UIButton, title: String, imageName: String){
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 12
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        let containerView = UIStackView()
        containerView.axis = .horizontal
        containerView.alignment = .center
        containerView.distribution = .equalSpacing
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        containerView.addArrangedSubview(titleLabel)
        
        if let image = UIImage(systemName: imageName) {
            let imageView = UIImageView(image: image)
            imageView.tintColor = .black
            imageView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addArrangedSubview(imageView)
        }
        
        
        
        button.addSubview(containerView)
        
        NSLayoutConstraint.activate([
                containerView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 16),
                containerView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -16),
                containerView.topAnchor.constraint(equalTo: button.topAnchor, constant: 8),
                containerView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -8)
            ])
        
    }
    
    private func setupButton(_ button: UIButton, title: String, subTitle: String, imageName: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        
        
        button.heightAnchor.constraint(equalToConstant: 110).isActive = true
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true

        
        let containerView = UIStackView()
        containerView.axis = .vertical
        containerView.alignment = .leading
        containerView.spacing = 5
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        if let image = UIImage(systemName: imageName) {
            let imageView = UIImageView(image: image)
            imageView.tintColor = .black
            imageView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addArrangedSubview(imageView)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addArrangedSubview(titleLabel)
        
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = subTitle
        subTitleLabel.textColor = .gray
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addArrangedSubview(subTitleLabel)
        
        button.addSubview(containerView)
        
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -10),
            containerView.topAnchor.constraint(equalTo: button.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -10)
        ])
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headercontaioner.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            headercontaioner.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1),
            headercontaioner.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 1),
            headercontaioner.heightAnchor.constraint(equalToConstant: 260),
            
            searchBar.topAnchor.constraint(equalTo: headercontaioner.topAnchor, constant: 42),
            searchBar.leadingAnchor.constraint(equalTo: headercontaioner.leadingAnchor, constant: 8),
            searchBar.trailingAnchor.constraint(equalTo: headercontaioner.trailingAnchor, constant: -8),
            
            nameLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: headercontaioner.leadingAnchor, constant: 15),
            buttonContainer.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            buttonContainer.leadingAnchor.constraint(equalTo: headercontaioner.leadingAnchor, constant: 12),
            buttonContainer.trailingAnchor.constraint(equalTo: headercontaioner.trailingAnchor, constant: -12),
            buttonContainer.heightAnchor.constraint(equalToConstant: 85),
            
            
            additionalStackButton.topAnchor.constraint(equalTo: headercontaioner.bottomAnchor, constant: 1),
            additionalStackButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            additionalStackButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            additionalStackButton.heightAnchor.constraint(equalToConstant: 205),
            
            productsScroll.topAnchor.constraint(equalTo: additionalStackButton.bottomAnchor, constant: 6),
            productsScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productsScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            productsScroll.heightAnchor.constraint(equalToConstant: 240),
                
            contetScrollStackView.topAnchor.constraint(equalTo: productsScroll.topAnchor),
            contetScrollStackView.leadingAnchor.constraint(equalTo: productsScroll.leadingAnchor),
            contetScrollStackView.trailingAnchor.constraint(equalTo: productsScroll.trailingAnchor),
            contetScrollStackView.bottomAnchor.constraint(equalTo: productsScroll.bottomAnchor),
            contetScrollStackView.heightAnchor.constraint(equalTo: productsScroll.heightAnchor),
            
            
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            footerView.heightAnchor.constraint(equalToConstant: 90),
            
            
            
            
        ])}
                                    

}

