//
//  BirthdayViewController.swift
//  hw
//
//  Created by Shamil Ashurilov on 15.12.2022.
//

import UIKit

class BirthdayViewController: UIViewController {
    
    let defaultImageLogo = UIImage(named: "defaultProfileLogo")
    
    let jeremyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemBlue
        imageView.layer.cornerRadius = 34
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    
    let nameJeremyLabel: UILabel = {
        let label = UILabel()
        label.text = "Jeremy"
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    let daysJeremyLabel: UILabel = {
        let label = UILabel()
        label.text = "18 Дней"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .lightGray
        return label
    }()
    
    let dateJeremyLabel: UILabel = {
        let label = UILabel()
        label.text = "10 марта. В среду исполнится 25 лет."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let mariaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemMint
        imageView.layer.cornerRadius = 34
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameMariaLabel: UILabel = {
        let label = UILabel()
        label.text = "Maria Lui"
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    let daysMariaLabel: UILabel = {
        let label = UILabel()
        label.text = "28 дней"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .lightGray
        return label
    }()
    
    let dateMariaLabel: UILabel = {
        let label = UILabel()
        label.text = "30 марта. В четверг исполнится 20 лет."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let jonyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemPink
        imageView.layer.cornerRadius = 34
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameJonyLabel: UILabel = {
        let label = UILabel()
        label.text = "Jony Stark"
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    let daysJonyLabel: UILabel = {
        let label = UILabel()
        label.text = "53 дня"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let dateJonyLabel: UILabel = {
        let label = UILabel()
        label.text = "20 апреля. В субботу исполнится 25 лет."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Birthday"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewContact))
        
        let avatars = [jeremyImageView, mariaImageView, jonyImageView]
        avatars.forEach{ $0.image = defaultImageLogo }
        
        createUI()
        createConstraints()
    }
    
    func createUI() {
        view.addSubview(jeremyImageView)
        view.addSubview(nameJeremyLabel)
        view.addSubview(daysJeremyLabel)
        view.addSubview(dateJeremyLabel)
        view.addSubview(mariaImageView)
        view.addSubview(nameMariaLabel)
        view.addSubview(daysMariaLabel)
        view.addSubview(dateMariaLabel)
        view.addSubview(jonyImageView)
        view.addSubview(nameJonyLabel)
        view.addSubview(daysJonyLabel)
        view.addSubview(dateJonyLabel)
    }
    
    func createConstraints() {
        jeremyImageView.translatesAutoresizingMaskIntoConstraints = false
        nameJeremyLabel.translatesAutoresizingMaskIntoConstraints = false
        daysJeremyLabel.translatesAutoresizingMaskIntoConstraints = false
        dateJeremyLabel.translatesAutoresizingMaskIntoConstraints = false
        mariaImageView.translatesAutoresizingMaskIntoConstraints = false
        nameMariaLabel.translatesAutoresizingMaskIntoConstraints = false
        daysMariaLabel.translatesAutoresizingMaskIntoConstraints = false
        dateMariaLabel.translatesAutoresizingMaskIntoConstraints = false
        jonyImageView.translatesAutoresizingMaskIntoConstraints = false
        nameJonyLabel.translatesAutoresizingMaskIntoConstraints = false
        daysJonyLabel.translatesAutoresizingMaskIntoConstraints = false
        dateJonyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        jeremyImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        jeremyImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        jeremyImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        jeremyImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        nameJeremyLabel.topAnchor.constraint(equalTo: jeremyImageView.topAnchor, constant: 5).isActive = true
        nameJeremyLabel.leftAnchor.constraint(equalTo: jeremyImageView.rightAnchor, constant: 10).isActive = true
        
        daysJeremyLabel.topAnchor.constraint(equalTo: nameJeremyLabel.topAnchor).isActive = true
        daysJeremyLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        
        dateJeremyLabel.bottomAnchor.constraint(equalTo: jeremyImageView.bottomAnchor, constant: -5).isActive = true
        dateJeremyLabel.leftAnchor.constraint(equalTo: jeremyImageView.rightAnchor, constant: 10).isActive = true
        
        mariaImageView.topAnchor.constraint(equalTo: jeremyImageView.bottomAnchor, constant: 20).isActive = true
        mariaImageView.leftAnchor.constraint(equalTo: jeremyImageView.leftAnchor).isActive = true
        mariaImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        mariaImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        nameMariaLabel.topAnchor.constraint(equalTo: mariaImageView.topAnchor, constant: 5).isActive = true
        nameMariaLabel.leftAnchor.constraint(equalTo: jeremyImageView.rightAnchor, constant: 10).isActive = true
        
        daysMariaLabel.topAnchor.constraint(equalTo: nameMariaLabel.topAnchor).isActive = true
        daysMariaLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        
        dateMariaLabel.bottomAnchor.constraint(equalTo: mariaImageView.bottomAnchor, constant: -5).isActive = true
        dateMariaLabel.leftAnchor.constraint(equalTo: mariaImageView.rightAnchor, constant: 10).isActive = true
        
        jonyImageView.topAnchor.constraint(equalTo: mariaImageView.bottomAnchor, constant: 20).isActive = true
        jonyImageView.leftAnchor.constraint(equalTo: mariaImageView.leftAnchor).isActive = true
        jonyImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        jonyImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        nameJonyLabel.topAnchor.constraint(equalTo: jonyImageView.topAnchor, constant: 5).isActive = true
        nameJonyLabel.leftAnchor.constraint(equalTo: jonyImageView.rightAnchor, constant: 10).isActive = true
        
        daysJonyLabel.topAnchor.constraint(equalTo: nameJonyLabel.topAnchor).isActive = true
        daysJonyLabel.rightAnchor.constraint(equalTo: daysMariaLabel.rightAnchor).isActive = true
        
        dateJonyLabel.bottomAnchor.constraint(equalTo: jonyImageView.bottomAnchor, constant: -5).isActive = true
        dateJonyLabel.leftAnchor.constraint(equalTo: jonyImageView.rightAnchor, constant: 10).isActive = true
        
    }
    
    // selector
    @objc func addNewContact() {
        let addNewContactVC = AddNewContact()
        present(addNewContactVC, animated: true)
    }
    
}
