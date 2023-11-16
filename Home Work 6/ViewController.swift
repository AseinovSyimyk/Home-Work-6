//
//  ViewController.swift
//  Home Work 6
//
//  Created by User on 16/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let textDetail: UILabel = {
        let textDetail = UILabel()
        textDetail.translatesAutoresizingMaskIntoConstraints = false
        textDetail.text = "Detail"
        textDetail.font = .systemFont(ofSize: 20, weight: .bold)
        textDetail.textColor = .black
        return textDetail
    }()
    private let textPizza: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "            Pizza \n with mushrooms"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    private let imagePizza : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Pizza")
        return view
    }()
    private let minusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Минус", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Плюс", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let sumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private var sum: Int = 0 {
        didSet {
            sumLabel.text = "\(sum)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(minusButton)
        view.addSubview(plusButton)
        view.addSubview(sumLabel)
        
        configureLayout()
        configureActions()
        ConfigureLblDetail()
        configureLblPizza()
        configureImagePizza()
    }
    private func ConfigureLblDetail(){
        view.addSubview(textDetail)
        textDetail.translatesAutoresizingMaskIntoConstraints = false
        textDetail.topAnchor.constraint(equalTo: view.topAnchor, constant: 59).isActive = true
        textDetail.heightAnchor.constraint(equalToConstant: 31).isActive = true
        textDetail.widthAnchor.constraint(equalToConstant: 67).isActive = true
        textDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160).isActive = true
    }
    
    private func configureLblPizza() {
        view.addSubview(textPizza)
        
        
        NSLayoutConstraint.activate([
            
            textPizza.topAnchor.constraint(equalTo: textDetail.bottomAnchor, constant: 56),
            
            textPizza.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textPizza.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            textPizza.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            textPizza.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            textPizza.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -100)
        ])
    }
    private func configureImagePizza() {
        view.addSubview(imagePizza)
        imagePizza.translatesAutoresizingMaskIntoConstraints = false
        imagePizza.topAnchor.constraint(equalTo: textPizza.bottomAnchor, constant: 35).isActive = true
        imagePizza.heightAnchor.constraint(equalToConstant: 220).isActive = true
        imagePizza.widthAnchor.constraint(equalToConstant: 296).isActive = true
        imagePizza.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 67).isActive = true
        imagePizza.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -67).isActive = true
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            minusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            minusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -148),
            
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -148),
            
            sumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sumLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -148)
        ])
    }
    
    
    private func configureActions() {
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    @objc private func minusButtonTapped() {
        sum -= 1
    }
    
    @objc private func plusButtonTapped() {
        sum += 1
    }
}

