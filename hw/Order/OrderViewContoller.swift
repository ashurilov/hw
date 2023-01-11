//
//  OrderViewController.swift
//  UISegmentControl
//
//  Created by Shamil Ashurilov on 11.01.2023.
//

import Foundation
import UIKit



final  class OrderViewController: UIViewController {
    
    static var countOrder: UInt = 0
    
    private lazy var sumOfOrderLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 19)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tipsLabel: UILabel = {
        let label = UILabel()
        label.text = "Хотите оставить чаевые?"
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tipsSegmented: UISegmentedControl = {
        let items = ["0%", "10%", "20%", "30%"]
        var segmented = UISegmentedControl(items: items)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.addTarget(self, action: #selector(tipsAction(sender:)), for: .valueChanged)
        return segmented
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите ваш адрес:"
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите адресс"
        textField.text = "г. Москва, "
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    private let rateAppLabel: UILabel = {
        let label = UILabel()
        label.text = "Оцените наше приложение:"
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rateAppSegmented: UISegmentedControl = {
        let items = ["1⭐", "2⭐", "3⭐", "4⭐", "5⭐"]
        let segmented = UISegmentedControl(items: items)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        return segmented
    }()
    
    lazy private  var finishBUtton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Готово", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(finishButtonAction(sender:)), for: .touchUpInside)
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AutorizationModel.theme
        sumOfOrderLabel.text = "Сумма вашего заказа: \n\(OrderViewController.countOrder)₽"
        createUI()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addressTextField.resignFirstResponder()
    }
    
    @objc func finishButtonAction(sender: UIButton) {
        let alert = UIAlertController(title: "Внимание!", message: "Вы уверены, что заказ составлен правильно?", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "Да", style: .default) { _ in
            let alertNew = UIAlertController(title: "Ваш заказ принят.", message: "Ожидайте звонка", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) {_ in
                self.navigationController?.popViewController(animated: true)
            }
            alertNew.addAction(actionOK)
            self.present(alertNew, animated: true)
        }
        let actionCancel = UIAlertAction(title: "Закрыть", style: .destructive)
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        present(alert, animated: true)
    }
    
    @objc func tipsAction(sender: UISegmentedControl) {
        var count = OrderViewController.countOrder
        
        switch sender.selectedSegmentIndex {
        case 0:
            sumOfOrderLabel.text = "Сумма вашего заказа: \n\(count)₽"
        case 1:
            sumOfOrderLabel.text = "Сумма вашего заказа: \n\(Int(Double(count) * 1.1))₽"
        case 2:
            sumOfOrderLabel.text = "Сумма вашего заказа: \n\(Int(Double(count) * 1.2))₽"
        case 3:
            sumOfOrderLabel.text = "Сумма вашего заказа: \n\(Int(Double(count) * 1.3))₽"
        default: break
        }
    }
    
    private func createUI() {
        [sumOfOrderLabel, tipsLabel, tipsSegmented, addressLabel, addressTextField, rateAppLabel, rateAppSegmented, finishBUtton].forEach({ view.addSubview($0) })
        createConstraints()
    }
    
    private func createConstraints() {
        NSLayoutConstraint.activate([
            sumOfOrderLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            sumOfOrderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tipsLabel.topAnchor.constraint(equalTo: sumOfOrderLabel.bottomAnchor, constant: 40),
            tipsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tipsSegmented.topAnchor.constraint(equalTo: tipsLabel.bottomAnchor, constant: 5),
            tipsSegmented.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            tipsSegmented.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            
            addressLabel.topAnchor.constraint(equalTo: tipsSegmented.bottomAnchor, constant: 40),
            addressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addressTextField.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 5),
            addressTextField.leftAnchor.constraint(equalTo: tipsSegmented.leftAnchor),
            addressTextField.rightAnchor.constraint(equalTo: tipsSegmented.rightAnchor),
            
            rateAppLabel.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 40),
            rateAppLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            rateAppSegmented.topAnchor.constraint(equalTo: rateAppLabel.bottomAnchor, constant: 5),
            rateAppSegmented.leftAnchor.constraint(equalTo: addressTextField.leftAnchor),
            rateAppSegmented.rightAnchor.constraint(equalTo: addressTextField.rightAnchor),
            
            finishBUtton.topAnchor.constraint(equalTo: rateAppSegmented.bottomAnchor, constant: 30),
            finishBUtton.leftAnchor.constraint(equalTo: rateAppSegmented.leftAnchor),
            finishBUtton.rightAnchor.constraint(equalTo: rateAppSegmented.rightAnchor),
            finishBUtton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}

extension OrderViewController: CountDelegate {
    func count(sum: UInt) {
        OrderViewController.countOrder = sum
    }
    
}
