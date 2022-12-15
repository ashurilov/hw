//
//  ThirdViewController.swift
//  hw
//
//  Created by Shamil Ashurilov on 15.12.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let cesarNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Салат цезарь"
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    let cesarSumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "300р  >"
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let cesarRecipeLabel: UILabel = {
       let label = UILabel()
        label.text = "Помидор, салат айсберг, сухарики, курица"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let greekSaladNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Салат греческий"
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    let greekSalatSumLabel: UILabel = {
        let label = UILabel()
        label.text = "400р  >"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .lightGray
        return label
    }()
    
    let greekSalatRecipeLabel: UILabel = {
       let label = UILabel()
        label.text = "Помидор, салат айсберг, сухарики, курица"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    
    override func viewDidLoad() {
       super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationItem.title = "Чек"
        
        createUI()
        addConstraints()
    }

    func createUI() {
        view.addSubview(cesarNameLabel)
        view.addSubview(cesarSumLabel)
        view.addSubview(cesarRecipeLabel)
        view.addSubview(greekSaladNameLabel)
        view.addSubview(greekSalatSumLabel)
        view.addSubview(greekSalatRecipeLabel)
    }
    
    func addConstraints() {
        cesarNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cesarSumLabel.translatesAutoresizingMaskIntoConstraints = false
        cesarRecipeLabel.translatesAutoresizingMaskIntoConstraints = false
        greekSaladNameLabel.translatesAutoresizingMaskIntoConstraints = false
        greekSalatSumLabel.translatesAutoresizingMaskIntoConstraints = false
        greekSalatRecipeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        cesarNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        cesarNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45).isActive = true
        
        cesarSumLabel.topAnchor.constraint(equalTo: cesarNameLabel.topAnchor).isActive = true
        cesarSumLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        
        cesarRecipeLabel.topAnchor.constraint(equalTo: cesarNameLabel.bottomAnchor, constant: 5).isActive = true
        cesarRecipeLabel.leftAnchor.constraint(equalTo: cesarNameLabel.leftAnchor).isActive = true
        
        greekSaladNameLabel.topAnchor.constraint(equalTo: cesarRecipeLabel.bottomAnchor, constant: 35).isActive = true
        greekSaladNameLabel.leftAnchor.constraint(equalTo: cesarNameLabel.leftAnchor).isActive = true
        
        greekSalatSumLabel.topAnchor.constraint(equalTo: greekSaladNameLabel.topAnchor).isActive = true
        greekSalatSumLabel.rightAnchor.constraint(equalTo: cesarSumLabel.rightAnchor).isActive = true
        
        greekSalatRecipeLabel.topAnchor.constraint(equalTo: greekSaladNameLabel.bottomAnchor, constant: 5).isActive = true
        greekSalatRecipeLabel.leftAnchor.constraint(equalTo: cesarRecipeLabel.leftAnchor).isActive = true
    }

}
