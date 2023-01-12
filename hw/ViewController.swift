//
//  ViewController.swift
//  hw
//
//  Created by Shamil Ashurilov on 06.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let chooseHeroLabel: UILabel = {
        let label = UILabel()
        label.text = "Выбери своего героя:"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let selectedHeroLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.shadowColor = .purple
        label.shadowOffset = CGSize(width: 1, height: 1)
        label.font = UIFont.boldSystemFont(ofSize: 23)
        return label
    }()
    
    lazy var selectHeroSegmented: UISegmentedControl = {
        let items = ["1", "2", "3"]
        let segmented = UISegmentedControl(items: items)
        segmented.addTarget(self, action: #selector(selectHeroTarget(target:)), for: .valueChanged)
        return segmented
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Скачать картинку героя", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.backgroundColor = .lightGray
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(doneButtonTarget(sender:)) ,for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createUI()
    }
    
    @objc func doneButtonTarget(sender: UIButton) {
        guard let image = heroImageView.image else { return }
        let items: [Any] = [image]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
    @objc func selectHeroTarget(target: UISegmentedControl) {
        switch target.selectedSegmentIndex {
        case 0:
            selectedHeroLabel.text = "Железный человек"
            heroImageView.image = UIImage(named: "ironman")
        case 1:
            selectedHeroLabel.text = "Азербайджанец"
            heroImageView.image = UIImage(named: "hulk")
        case 2:
            selectedHeroLabel.text =  "Человек паук"
            heroImageView.image = UIImage(named: "spiderman")
        default: print("error")
        }
    }

    func createUI() {
        [chooseHeroLabel, heroImageView, selectedHeroLabel, selectHeroSegmented, doneButton].forEach({ view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        createConstraints()
    }

    func createConstraints() {
        NSLayoutConstraint.activate([
            selectedHeroLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            selectedHeroLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            heroImageView.topAnchor.constraint(equalTo: selectedHeroLabel.bottomAnchor, constant: 20),
            heroImageView.widthAnchor.constraint(equalToConstant: 200),
            heroImageView.heightAnchor.constraint(equalToConstant: 200),
            heroImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            chooseHeroLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 40),
            chooseHeroLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            selectHeroSegmented.topAnchor.constraint(equalTo: chooseHeroLabel.bottomAnchor, constant: 10),
            selectHeroSegmented.widthAnchor.constraint(equalToConstant: 150),
            selectHeroSegmented.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            doneButton.topAnchor.constraint(equalTo: selectHeroSegmented.bottomAnchor, constant: 40),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.heightAnchor.constraint(equalToConstant: 40),
            doneButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

}

