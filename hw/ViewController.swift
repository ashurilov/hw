//
//  ViewController.swift
//  hw
//
//  Created by Shamil Ashurilov on 06.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // Число, которое нужно будет угадывать
    let randomNumber = Int.random(in: 1...10)

    // создаем UILabel и задаем значение
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.darkGray
        label.numberOfLines = 0
        label.textColor = .white
        label.isHidden = true
        label.textAlignment = .center
        label.text = "Welcome, "
        return label
    }()
    
    // кнопка сложения
    let buttonAddition: UIButton = {
        let button = UIButton()
        button.setTitle("Addition", for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.green.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // кнопка "угадай число"
    let buttonLucky: UIButton = {
        let button = UIButton()
        button.setTitle("Lucky", for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.green.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        // UI
        loadUI()
        
        // constraints:
        loadConstraints()
        buttonAddition.addTarget(self, action: #selector(buttonAddition(param: )), for: .touchUpInside)
        buttonLucky.addTarget(self, action: #selector(buttonLucky(param:)) , for: .touchUpInside)
    
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // alert enter name
        enterNameAlert()
    }
    
    // добавление UI на экран
    func loadUI() {
        view.addSubview(statusLabel)
        view.addSubview(buttonAddition)
        view.addSubview(buttonLucky)
    }
    
    // Констрейнты
    func loadConstraints() {
    // label constraints :
        statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        statusLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
        buttonAddition.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 400).isActive = true
        buttonAddition.leftAnchor.constraint(equalTo: statusLabel.leftAnchor).isActive = true
        buttonAddition.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        buttonAddition.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        buttonLucky.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 20).isActive = true
        buttonLucky.topAnchor.constraint(equalTo: buttonAddition.topAnchor).isActive = true
        buttonLucky.rightAnchor.constraint(equalTo: statusLabel.rightAnchor).isActive = true
        buttonLucky.heightAnchor.constraint(equalToConstant: 60).isActive = true

    
    }
        
    // alert enter name
    func enterNameAlert() {
        // задаем алерт, который будет высвечивааться после запуска
        let alertEnterName : UIAlertController = {
            let alert = UIAlertController(title: "Welcome to the club, buddy",
                                          message: "Enter your name",
                                          preferredStyle: .alert)
            alert.addTextField()
            // Действия добавляем кнопку ОК на алерт
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                // добавляем функционал кнопки
                if let alert = alert.textFields?.first?.text {
                    // функционал, если текст будет пустой
                    if alert.isEmpty {
                        presentErro()
                    }
                }
                self.statusLabel.text! += alert.textFields?.first?.text ??  ""
                self.statusLabel.isHidden = false
            }
            // добавляем кнопку на алерт
            alert.addAction(action)
            return alert
        }()
        present(alertEnterName, animated: true)
        
        // алерт если введено пустое значение
        func presentErro() {
            let errorAlert: UIAlertController = {
                let alert = UIAlertController(title: "Error", message: "Enter correct name", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) {_ in
                    self.statusLabel.text! += alert.textFields?.first?.text ??  ""
                    if alert.textFields?.first?.text?.isEmpty != nil && alert.textFields?.first?.text?.isEmpty == true {
                        presentErro()
                    }
                }
                alert.addAction(action)
                alert.addTextField()
                return alert
            }()
            present(errorAlert, animated: true)
        }
        
    }
    
    // Selectrors :
    // button Addition selector
    @objc func buttonAddition(param: UIButton) {
        var sum: Double = 0
        let alertResult = UIAlertController(title: "Your result:", message: nil, preferredStyle: .actionSheet)
        let actionResult = UIAlertAction(title: "OK", style: .default)
        alertResult.addAction(actionResult)

        let alert = UIAlertController(title: "Let's play! 🎉", message: "Enter two numbers ", preferredStyle: .alert)
        alert.addTextField()
        alert.addTextField()
        let action = UIAlertAction(title: "Sum it", style: .default) {button in
            if let sum1 = Double((alert.textFields?.first?.text!)!) , let sum2 = Double((alert.textFields?.last?.text!)!) {
                print(sum1)
                print(sum2)
                sum += sum1
                sum += sum2
                alertResult.message = String(sum)
            } else {
                alertResult.message = "Enter correct numbers"
                alertResult.title = "Error"
            }
            self.present(alertResult, animated: true)
        }
        alert.addAction(action)

        
        // alert result
        present(alert, animated: true)
    }
    
    // button Lucky selector
    @objc func buttonLucky(param: UIButton) {
        // alert с выводом результата
        let resultAlert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let actionResult = UIAlertAction(title: "OK", style: .default)
        resultAlert.addAction(actionResult)
        
        // алерт первый
        let alertPlay = UIAlertController(title: "Let's play! 🎉", message: "Enter a number from 1 to 10", preferredStyle: .alert)
        alertPlay.addTextField()
        let action = UIAlertAction(title: "let's go", style: .default) { _ in
            if let num = Int((alertPlay.textFields?.first?.text!)!)  {
                if num > self.randomNumber && num < 11 {
                    resultAlert.title = "Error"
                    resultAlert.message = "Enter smaller number"
                    self.present(resultAlert, animated: true)
                } else if num < self.randomNumber {
                    resultAlert.title = "Error"
                    resultAlert.message = "Enter greater number"
                    self.present(resultAlert, animated: true)
                } else if num == self.randomNumber {
                    resultAlert.title = "Congratulations 🎉"
                    resultAlert.message = "You guessed the number"
                    self.present(resultAlert, animated: true)
                } else {
                    resultAlert.title = "Error"
                    resultAlert.message = "Enter correct number"
                    self.present(resultAlert, animated: true)
                }
                
                
            } else {
                resultAlert.title = "Error"
                resultAlert.message = "Enter correct number"
                self.present(resultAlert, animated: true)
            }
        }
        alertPlay.addAction(action)
        present(alertPlay, animated: true)
    }
}

