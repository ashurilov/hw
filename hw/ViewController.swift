//
//  ViewController.swift
//  hw
//
//  Created by Shamil Ashurilov on 06.11.2022.
//

import UIKit

class ViewController: UIViewController {
    // MARK: UI Elements :
    let secretLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .darkGray
        label.text = ""
        label.textAlignment = .center
        label.textColor = .white
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        
        return label
    }()
    
    let button: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        loadUI()
        createConstraints()
    }

    // MARK: UI
    func loadUI() {
        view.addSubview(secretLabel)
        view.addSubview(button)
    }
    
    
    
    // MARK: Selectors:
    @objc func touchButton() {
        
        let resultAlert = UIAlertController(title: "I don't know you", message: "go back home", preferredStyle: .actionSheet)
        let actionResult = UIAlertAction(title: "OK:(", style: .default)
        resultAlert.addAction(actionResult)
        
        let alert = UIAlertController(title: "Pss...", message: "Enter secretword", preferredStyle: .alert)
        alert.addTextField()
        let action = UIAlertAction(title: "Let's try", style: .default) { _ in
            if let text = alert.textFields?.first?.text {
                if  text == "leohl" {
                    self.secretLabel.isHidden = false
                    self.secretLabel.text = "Hello, dude"
                } else {
                    self.present(resultAlert, animated: true)
                }
            }
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    // MARK: Constraints:
    func createConstraints() {
        secretLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        secretLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        secretLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        secretLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.topAnchor.constraint(equalTo: secretLabel.bottomAnchor, constant: 100).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}

