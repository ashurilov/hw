//
//  AutorizationViewController.swift
//  UISegmentControl
//
//  Created by Shamil Ashurilov on 10.01.2023.
//

import UIKit

final class AutorizationViewController: UIViewController {
    var loginModel: AutorizationModel = AutorizationModel()
    
    // UI
    let autorizationLabel: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин:"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль:"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    let themeLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите тему:"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите логин"
        textField.clearButtonMode = .whileEditing
        textField.becomeFirstResponder()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.clearButtonMode = .whileEditing
        textField.becomeFirstResponder()
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let autorizationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Авторизация", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.backgroundColor = .lightGray
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return button
    }()
    
    let themeSegmentedControl: UISegmentedControl = {
        let items = ["Белая", "Жёлтая", "Оранжевая"]
        let segment = UISegmentedControl(items: items)
        return segment
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AutorizationModel.theme
        createUI()
        autorizationButton.addTarget(self, action: #selector(checkCorrectLogin), for: .touchUpInside)
        themeSegmentedControl.addTarget(self, action: #selector(themeSegmentedChange(sender:)), for: .valueChanged)
    }
    
    
    @objc func themeSegmentedChange(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: AutorizationModel.theme = .white
        case 1: AutorizationModel.theme = .systemYellow
        case 2: AutorizationModel.theme = .systemOrange
        default: break
        }
        view.backgroundColor = AutorizationModel.theme
    }
    
    @objc func checkCorrectLogin() {
        resultLabel.isHidden = false
        if let loginText = loginTextField.text, let passwordText = passwordTextField.text {
            if [loginText, passwordText] == [loginModel.login, loginModel.password] {
                checkResult(text: "Авторизация прошла успешно", color: .systemGreen)
                let menuView = MenuViewController()
                navigationController?.pushViewController(menuView, animated: true)
            } else {
                checkResult(text: "Некорректные данные", color: .systemRed)
            }
        }
        
        func checkResult(text: String, color: UIColor) {
            resultLabel.text = text
            resultLabel.textColor = color
        }
    }
    
    func createUI() {
        [autorizationLabel, loginLabel, loginTextField, passwordLabel, passwordTextField, resultLabel, autorizationButton,themeLabel, themeSegmentedControl].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            autorizationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            autorizationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: autorizationLabel.bottomAnchor, constant: 80),
            loginLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5),
            loginTextField.leftAnchor.constraint(equalTo: loginLabel.leftAnchor),
            loginTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30),
            passwordLabel.leftAnchor.constraint(equalTo: loginTextField.leftAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leftAnchor.constraint(equalTo: loginTextField.leftAnchor),
            passwordTextField.rightAnchor.constraint(equalTo: loginTextField.rightAnchor),
            
            resultLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            autorizationButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 30),
            autorizationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            themeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            themeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            themeSegmentedControl.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 10),
            themeSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// add UI

