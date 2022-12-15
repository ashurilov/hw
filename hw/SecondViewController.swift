//
//  SecondViewController.swift
//  hw
//
//  Created by Shamil Ashurilov on 14.12.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    let labelName: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let enterNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите ваше имя"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    let numberOfGuestsLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество гостей:"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let numberOfGuestsTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите колличество гостей"
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let tableNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер стола:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .red
        return label
    }()
    
    let tableNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите номер стола"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    let tableReservLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "Бронировали стол?"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let tableReservSwitch = UISwitch()
    
    let prepayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "Предоплата?"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let prepaySwitch = UISwitch()
    
    let vipRoomLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "VIP комната?"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let vipRoomSwitch = UISwitch()
    
    let checkOutAlert: UIAlertController = UIAlertController(title: "Внимание", message: "Выставить счет?", preferredStyle: .alert)

     let invoiceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выставить счет", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemPink
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemPink.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view settings
        view.backgroundColor = .white
        title = "Swift cafe"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Arial-BoldMT", size: 28)!]
        
        // methods
        createUI()
        addConstraints()
        
        // invoice check
        invoiceButton.addTarget(self, action: #selector(invoiceButtonFunc), for: .touchUpInside)
        
        // add action on Alert
        let actionOne = UIAlertAction(title: "Закрыть", style: .destructive)
        let actionTwo = UIAlertAction(title: "Да", style: .default) { _ in
            let thirdVC = ThirdViewController()
            self.navigationController?.pushViewController(thirdVC, animated: true)
        }
        checkOutAlert.addAction(actionOne)
        checkOutAlert.addAction(actionTwo)
        
        // delegate
        enterNameTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        enterNameTextField.resignFirstResponder()
        numberOfGuestsTextField.resignFirstResponder()
        tableNumberTextField.resignFirstResponder()
    }
    
    // MARK: Selectors:
    @objc func invoiceButtonFunc() {
        present(checkOutAlert, animated: true)
    }
    
    // MARK: Methods:
    func createUI() {
        view.addSubview(labelName)
        view.addSubview(enterNameTextField)
        view.addSubview(numberOfGuestsLabel)
        view.addSubview(numberOfGuestsTextField)
        view.addSubview(tableNumberLabel)
        view.addSubview(tableNumberTextField)
        view.addSubview(tableReservLabel)
        view.addSubview(tableReservSwitch)
        view.addSubview(prepayLabel)
        view.addSubview(prepaySwitch)
        view.addSubview(vipRoomLabel)
        view.addSubview(vipRoomSwitch)
        view.addSubview(invoiceButton)
    }
    
    func addConstraints() {
        labelName.translatesAutoresizingMaskIntoConstraints = false
        enterNameTextField.translatesAutoresizingMaskIntoConstraints = false
        numberOfGuestsLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfGuestsTextField.translatesAutoresizingMaskIntoConstraints = false
        tableNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        tableNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        tableReservLabel.translatesAutoresizingMaskIntoConstraints = false
        tableReservSwitch.translatesAutoresizingMaskIntoConstraints = false
        prepayLabel.translatesAutoresizingMaskIntoConstraints = false
        prepaySwitch.translatesAutoresizingMaskIntoConstraints = false
        vipRoomLabel.translatesAutoresizingMaskIntoConstraints = false
        vipRoomSwitch.translatesAutoresizingMaskIntoConstraints = false
        invoiceButton.translatesAutoresizingMaskIntoConstraints = false
        
        labelName.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        labelName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45).isActive = true
        
        enterNameTextField.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 5).isActive = true
        enterNameTextField.leftAnchor.constraint(equalTo: labelName.leftAnchor).isActive = true
        enterNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        
        numberOfGuestsLabel.topAnchor.constraint(equalTo: enterNameTextField.bottomAnchor, constant: 25).isActive = true
        numberOfGuestsLabel.leftAnchor.constraint(equalTo: labelName.leftAnchor).isActive = true
        
        numberOfGuestsTextField.topAnchor.constraint(equalTo: numberOfGuestsLabel.bottomAnchor, constant: 5).isActive = true
        numberOfGuestsTextField.rightAnchor.constraint(equalTo: enterNameTextField.rightAnchor).isActive = true
        numberOfGuestsTextField.leftAnchor.constraint(equalTo: enterNameTextField.leftAnchor).isActive = true
        
        tableNumberLabel.topAnchor.constraint(equalTo: numberOfGuestsTextField.bottomAnchor, constant: 25).isActive = true
        tableNumberLabel.leftAnchor.constraint(equalTo: numberOfGuestsLabel.leftAnchor).isActive = true
        
        tableNumberTextField.topAnchor.constraint(equalTo: tableNumberLabel.bottomAnchor, constant: 5).isActive = true
        tableNumberTextField.leftAnchor.constraint(equalTo: numberOfGuestsTextField.leftAnchor).isActive = true
        tableNumberTextField.rightAnchor.constraint(equalTo: numberOfGuestsTextField.rightAnchor).isActive = true
        
        tableReservLabel.topAnchor.constraint(equalTo: tableNumberTextField.bottomAnchor, constant: 35).isActive = true
        tableReservLabel.leftAnchor.constraint(equalTo: tableNumberTextField.leftAnchor).isActive = true
        
        tableReservSwitch.topAnchor.constraint(equalTo: tableReservLabel.topAnchor, constant: -5).isActive = true
        tableReservSwitch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        
        prepayLabel.topAnchor.constraint(equalTo: tableReservLabel.bottomAnchor, constant: 25).isActive = true
        prepayLabel.leftAnchor.constraint(equalTo: tableReservLabel.leftAnchor).isActive = true
        
        prepaySwitch.topAnchor.constraint(equalTo: prepayLabel.topAnchor, constant: -5).isActive = true
        prepaySwitch.rightAnchor.constraint(equalTo: tableReservSwitch.rightAnchor).isActive = true
        
        vipRoomLabel.topAnchor.constraint(equalTo: prepayLabel.bottomAnchor, constant: 25).isActive = true
        vipRoomLabel.leftAnchor.constraint(equalTo: prepayLabel.leftAnchor).isActive = true
        
        vipRoomSwitch.topAnchor.constraint(equalTo: vipRoomLabel.topAnchor, constant: -5).isActive = true
        vipRoomSwitch.rightAnchor.constraint(equalTo: prepaySwitch.rightAnchor).isActive = true
        
        invoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        invoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        invoiceButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        invoiceButton.widthAnchor.constraint(equalToConstant: 230).isActive = true
    }
}

extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        enterNameTextField.resignFirstResponder()
    }
}
