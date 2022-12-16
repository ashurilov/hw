//
//  ViewController.swift
//  hw
//
//  Created by Shamil Ashurilov on 06.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let birthdayReminderlabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday Reminder"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = .systemBlue
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()

    let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "example@email.com"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        return textField
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password:"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please, enter your password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let enterFaceIDlabel: UILabel = {
        let label = UILabel()
        label.text = "Вход по Face ID"
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    let enterFaceIDSwitch: UISwitch = {
        let switchUI = UISwitch()
        switchUI.isOn = true
        return switchUI
    }()
    
    let buttonLogin: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Войти", for: .normal)
        button.layer.cornerRadius = 10
        //shadow
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // methods
        createUI()
        createConstraints()
        
        // target for button
        buttonLogin.addTarget(nil, action: #selector(pressButtonLogin(button:)), for: .touchUpInside)
    }
    
    // button target
    @objc func pressButtonLogin(button: UIButton) {
        let secondVC = BirthdayViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    func createUI() {
        view.addSubview(birthdayReminderlabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(enterFaceIDlabel)
        view.addSubview(enterFaceIDSwitch)
        view.addSubview(buttonLogin)
    }
    
    func createConstraints() {
        birthdayReminderlabel.translatesAutoresizingMaskIntoConstraints = false
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        enterFaceIDlabel.translatesAutoresizingMaskIntoConstraints = false
        enterFaceIDSwitch.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        
        birthdayReminderlabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        birthdayReminderlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        birthdayReminderlabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        birthdayReminderlabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        signInLabel.topAnchor.constraint(equalTo: birthdayReminderlabel.bottomAnchor, constant: 50).isActive = true
        signInLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 13).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: signInLabel.leftAnchor).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: emailLabel.leftAnchor).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        
        passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15).isActive = true
        passwordLabel.leftAnchor.constraint(equalTo: emailTextField.leftAnchor).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: passwordLabel.leftAnchor).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: emailTextField.rightAnchor).isActive = true
        
        enterFaceIDlabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 70).isActive = true
        enterFaceIDlabel.rightAnchor.constraint(equalTo: enterFaceIDSwitch.leftAnchor, constant: -25).isActive = true
        
        enterFaceIDSwitch.topAnchor.constraint(equalTo: enterFaceIDlabel.topAnchor, constant: -5).isActive = true
        enterFaceIDSwitch.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor).isActive = true
        
        buttonLogin.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        buttonLogin.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor).isActive = true
        buttonLogin.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor).isActive = true
        buttonLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true
 
    }


}

