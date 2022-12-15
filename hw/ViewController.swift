//
//  ViewController.swift
//  hw
//
//  Created by Shamil Ashurilov on 06.11.2022.
//

import UIKit

class ViewController: UIViewController {
    // create elements
    let ImageLogo = UIImageView(image: UIImage(named: "cafeLogo"))
    
    let labelLogo: UILabel = {
        let label = UILabel()
        label.text = "Swift Cafe"
        label.textAlignment = .center
        label.font = label.font.withSize(23)
        return label
    }()
    
    let labelSignIn: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Sign in"
        return label
    }()
    
    let labelEnterEmail: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .red
        label.text = "Email:"
        return label
    }()
    
    let textFieldEmail: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Please, enter your Email"
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let labelEnterPassword: UILabel = {
        let label = UILabel()
        label.text = "Password:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .red
        return label
    }()
    
    let textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Please, enter your password"
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let buttonSignIn: UIButton = {
        let button = UIButton()
        button.setTitle("Sigh in", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
        
        createUI()
        createConstraints()
        // таргет по нажатию
        buttonSignIn.addTarget(self, action: #selector(touchButtonSignIn(target:)), for: .touchUpInside)
        
    }
    
    // MARK: Selector for button
    @objc func touchButtonSignIn(target: UIButton) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    // при нажатии на какую то область клава скрывается
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
    }
    
    // MARK: Add UI:
    func createUI() {
        view.addSubview(ImageLogo)
        view.addSubview(labelLogo)
        view.addSubview(labelSignIn)
        view.addSubview(labelEnterEmail)
        view.addSubview(textFieldEmail)
        view.addSubview(labelEnterPassword)
        view.addSubview(textFieldPassword)
        view.addSubview(buttonSignIn)
    }
    
    // MARK: Create constraints:
    func createConstraints() {
        ImageLogo.translatesAutoresizingMaskIntoConstraints = false
        labelLogo.translatesAutoresizingMaskIntoConstraints = false
        labelSignIn.translatesAutoresizingMaskIntoConstraints = false
        labelEnterEmail.translatesAutoresizingMaskIntoConstraints = false
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        labelEnterPassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        buttonSignIn.translatesAutoresizingMaskIntoConstraints = false
        
        ImageLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        ImageLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        labelLogo.topAnchor.constraint(equalTo: ImageLogo.bottomAnchor, constant: 10).isActive = true
        labelLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        labelSignIn.topAnchor.constraint(equalTo: labelLogo.bottomAnchor, constant: 40).isActive = true
        labelSignIn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45).isActive = true
        
        labelEnterEmail.topAnchor.constraint(equalTo: labelSignIn.bottomAnchor, constant: 10).isActive = true
        labelEnterEmail.leftAnchor.constraint(equalTo: labelSignIn.leftAnchor).isActive = true
        
        textFieldEmail.topAnchor.constraint(equalTo: labelEnterEmail.bottomAnchor, constant: 5).isActive = true
        textFieldEmail.leftAnchor.constraint(equalTo: labelEnterEmail.leftAnchor).isActive = true
        textFieldEmail.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        
        labelEnterPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 30).isActive = true
        labelEnterPassword.leftAnchor.constraint(equalTo: textFieldEmail.leftAnchor).isActive = true
        
        textFieldPassword.topAnchor.constraint(equalTo: labelEnterPassword.bottomAnchor, constant: 5).isActive = true
        textFieldPassword.leftAnchor.constraint(equalTo: labelEnterPassword.leftAnchor).isActive = true
        textFieldPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        
        buttonSignIn.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 50).isActive = true
        buttonSignIn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonSignIn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buttonSignIn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
        return true
    }
}
