//
//  MenuViewController.swift
//  UISegmentControl
//
//  Created by Shamil Ashurilov on 11.01.2023.
//

import Foundation
import UIKit

protocol CountDelegate: AnyObject {
    func count(sum: UInt)
}

final class MenuViewController: UIViewController {
    
    weak var delegate: CountDelegate?
    private let orderVC = OrderViewController()
    
    private var count: UInt = 0
    
    private var poDomashCount: UInt = 0
    private var chetireSiraCount: UInt = 0
    private var cesarCount: UInt = 0
    
    private let poDomashPizzaImage = CustomImage(type: .poDomashnemy)
    private let poDomashPizzaNameLabel = CustomPizzaName(type: .poDomashnemy)
    private let poDomashDescriptionLabel = CustomPizzaDescription(type: .poDomashnemy)
    private let poDomashPizzaPrice = CustomPizzaPrice(type: .poDomashnemy)
    private let poDomashPizzaCountSegment = CustomCountPizzaSegment(type: .poDomashnemy)
    private var poDomashPizzaCount = CustomPizzaCount(type: .poDomashnemy)
    
    private let chetireSiraPizzaImage = CustomImage(type: .chetireSira)
    private let chetireSiraPizzaNameLabel = CustomPizzaName(type: .chetireSira)
    private let chetireSiraDescriptionLabel = CustomPizzaDescription(type: .chetireSira)
    private let chetireSiraPizzaPrice = CustomPizzaPrice(type: .chetireSira)
    private let chetireSiraPizzaCountSegment = CustomCountPizzaSegment(type: .chetireSira)
    private let chetireSiraPizzaCount = CustomPizzaCount(type: .chetireSira)
    
    private let cesarPizzaImage = CustomImage(type: .cesar)
    private let cesarPizzaNameLabel = CustomPizzaName(type: .cesar)
    private let cesarDescriptionLabel = CustomPizzaDescription(type: .cesar)
    private let cesaraPizzaPrice = CustomPizzaPrice(type: .cesar)
    private let cesarPizzaCountSegment = CustomCountPizzaSegment(type: .cesar)
    private let cesarPizzaCount = CustomPizzaCount(type: .cesar)
    
    private let sumLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваша сумма заказа:"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var sumNumLabel: UILabel = {
        let label = UILabel()
        label.text = "\(count)₽"
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var nextButton: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Продолжить", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(.black, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.addTarget(self, action: #selector(nextButtonTarget(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AutorizationModel.theme
        createUI()
        delegate = orderVC
        [poDomashPizzaCountSegment, chetireSiraPizzaCountSegment, cesarPizzaCountSegment].forEach({
            $0.addTarget(self, action: #selector(segmentValueChange(sender: )), for: .valueChanged) })}
    
    @objc func nextButtonTarget(sender: UIButton) {
        delegate?.count(sum: count)
        let orderVC = OrderViewController()
        navigationController?.pushViewController(orderVC, animated: true)
        print("hi")
    }
    
    @objc func segmentValueChange(sender: UISegmentedControl) {
        switch sender {
        case poDomashPizzaCountSegment:
            switch sender.selectedSegmentIndex {
            case 0:
                if poDomashCount > 0 {
                    poDomashCount -= 1
                    count -= 450
                    poDomashPizzaCount.text = "\(poDomashCount) шт."
                    sumNumLabel.text = "\(count)₽"
                }
            case 1:
                poDomashCount += 1
                count += 450
                poDomashPizzaCount.text = "\(poDomashCount) шт."
                sumNumLabel.text = "\(count)₽"
            default: break
            }
            
        case chetireSiraPizzaCountSegment:
            switch sender.selectedSegmentIndex {
            case 0:
                if chetireSiraCount > 0 {
                    chetireSiraCount -= 1
                    count -= 430
                    chetireSiraPizzaCount.text = "\(chetireSiraCount) шт."
                    sumNumLabel.text = "\(count) ₽"
                }
            case 1:
                chetireSiraCount += 1
                count += 430
                chetireSiraPizzaCount.text = "\(chetireSiraCount) шт."
                sumNumLabel.text = "\(count) ₽"
            default: break
            }
            
        case cesarPizzaCountSegment:
            switch sender.selectedSegmentIndex {
            case 0:
                if cesarCount > 0 {
                    cesarCount -= 1
                    count -= 500
                    cesarPizzaCount.text = "\(cesarCount) шт"
                    sumNumLabel.text = "\(count)₽"
                }
            case 1:
                cesarCount += 1
                count += 500
                cesarPizzaCount.text = "\(cesarCount) шт"
                sumNumLabel.text = "\(count)₽"
            default: break
            }
            
            
        default: break
        }
    }
    
    private func createUI() {
        configurePizza()
        [poDomashPizzaImage, poDomashPizzaNameLabel, poDomashDescriptionLabel, poDomashPizzaPrice, poDomashPizzaCountSegment, poDomashPizzaCount,
         chetireSiraPizzaImage, chetireSiraPizzaNameLabel, chetireSiraDescriptionLabel, chetireSiraPizzaPrice , chetireSiraPizzaCountSegment, chetireSiraPizzaCount,
         cesarPizzaImage, cesarPizzaNameLabel, cesarDescriptionLabel, cesaraPizzaPrice, cesarPizzaCountSegment, cesarPizzaCount,
         sumLabel, sumNumLabel, nextButton
        ].forEach({ view.addSubview($0) })
        NSLayoutConstraint.activate([
            poDomashPizzaImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            poDomashPizzaImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            poDomashPizzaImage.widthAnchor.constraint(equalToConstant: 120),
            poDomashPizzaImage.heightAnchor.constraint(equalToConstant: 120),
            
            poDomashPizzaNameLabel.topAnchor.constraint(equalTo: poDomashPizzaImage.topAnchor, constant: 5),
            poDomashPizzaNameLabel.leftAnchor.constraint(equalTo: poDomashPizzaImage.rightAnchor, constant: 5),
            
            poDomashDescriptionLabel.topAnchor.constraint(equalTo: poDomashPizzaNameLabel.bottomAnchor, constant: 5),
            poDomashDescriptionLabel.leftAnchor.constraint(equalTo: poDomashPizzaNameLabel.leftAnchor),
            poDomashDescriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            poDomashPizzaPrice.topAnchor.constraint(equalTo: poDomashDescriptionLabel.bottomAnchor, constant: 25),
            poDomashPizzaPrice.leftAnchor.constraint(equalTo: poDomashDescriptionLabel.leftAnchor),
            
            poDomashPizzaCountSegment.centerYAnchor.constraint(equalTo: poDomashPizzaPrice.centerYAnchor),
            poDomashPizzaCountSegment.rightAnchor.constraint(equalTo: poDomashPizzaCount.leftAnchor, constant: -10),
            
            poDomashPizzaCount.centerYAnchor.constraint(equalTo: poDomashPizzaPrice.centerYAnchor),
            poDomashPizzaCount.rightAnchor.constraint(equalTo: poDomashDescriptionLabel.rightAnchor),
            
            // chetireSiraPizza
            chetireSiraPizzaImage.topAnchor.constraint(equalTo: poDomashPizzaImage.bottomAnchor, constant: 35),
            chetireSiraPizzaImage.leftAnchor.constraint(equalTo: poDomashPizzaImage.leftAnchor),
            chetireSiraPizzaImage.widthAnchor.constraint(equalTo: poDomashPizzaImage.widthAnchor),
            chetireSiraPizzaImage.heightAnchor.constraint(equalTo: poDomashPizzaImage.heightAnchor),
            
            chetireSiraPizzaNameLabel.topAnchor.constraint(equalTo: chetireSiraPizzaImage.topAnchor, constant: 5),
            chetireSiraPizzaNameLabel.leftAnchor.constraint(equalTo: chetireSiraPizzaImage.rightAnchor, constant: 5),
            
            chetireSiraDescriptionLabel.topAnchor.constraint(equalTo: chetireSiraPizzaNameLabel.bottomAnchor, constant: 5),
            chetireSiraDescriptionLabel.leftAnchor.constraint(equalTo: chetireSiraPizzaNameLabel.leftAnchor),
            chetireSiraDescriptionLabel.rightAnchor.constraint(equalTo: poDomashDescriptionLabel.rightAnchor),
            
            chetireSiraPizzaPrice.topAnchor.constraint(equalTo: chetireSiraDescriptionLabel.bottomAnchor, constant: 25),
            chetireSiraPizzaPrice.leftAnchor.constraint(equalTo: chetireSiraDescriptionLabel.leftAnchor),
            
            chetireSiraPizzaCountSegment.centerYAnchor.constraint(equalTo: chetireSiraPizzaCount.centerYAnchor),
            chetireSiraPizzaCountSegment.rightAnchor.constraint(equalTo: chetireSiraPizzaCount.leftAnchor, constant: -10),
            
            chetireSiraPizzaCount.centerYAnchor.constraint(equalTo: chetireSiraPizzaPrice.centerYAnchor),
            chetireSiraPizzaCount.rightAnchor.constraint(equalTo: poDomashPizzaCount.rightAnchor),
            
            // cesarPizza
            cesarPizzaImage.topAnchor.constraint(equalTo: chetireSiraPizzaImage.bottomAnchor, constant: 35),
            cesarPizzaImage.leftAnchor.constraint(equalTo: chetireSiraPizzaImage.leftAnchor),
            cesarPizzaImage.heightAnchor.constraint(equalTo: chetireSiraPizzaImage.heightAnchor),
            cesarPizzaImage.widthAnchor.constraint(equalTo: chetireSiraPizzaImage.widthAnchor),
            
            cesarPizzaNameLabel.topAnchor.constraint(equalTo: cesarPizzaImage.topAnchor, constant: 5),
            cesarPizzaNameLabel.leftAnchor.constraint(equalTo: cesarPizzaImage.rightAnchor, constant: 5),
            
            cesarDescriptionLabel.topAnchor.constraint(equalTo: cesarPizzaNameLabel.bottomAnchor, constant: 5),
            cesarDescriptionLabel.leftAnchor.constraint(equalTo: cesarPizzaNameLabel.leftAnchor),
            cesarDescriptionLabel.rightAnchor.constraint(equalTo: chetireSiraDescriptionLabel.rightAnchor),
            
            cesaraPizzaPrice.topAnchor.constraint(equalTo: cesarDescriptionLabel.bottomAnchor, constant: 25),
            cesaraPizzaPrice.leftAnchor.constraint(equalTo: cesarDescriptionLabel.leftAnchor),
            
            cesarPizzaCountSegment.centerYAnchor.constraint(equalTo: cesarPizzaCount.centerYAnchor),
            cesarPizzaCountSegment.rightAnchor.constraint(equalTo: cesarPizzaCount.leftAnchor, constant: -10),
            
            cesarPizzaCount.centerYAnchor.constraint(equalTo: cesaraPizzaPrice.centerYAnchor),
            cesarPizzaCount.rightAnchor.constraint(equalTo: chetireSiraPizzaCount.rightAnchor),
            
            // other:
            sumLabel.topAnchor.constraint(equalTo: cesarPizzaImage.bottomAnchor, constant: 80),
            sumLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            
            sumNumLabel.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 5),
            sumNumLabel.rightAnchor.constraint(equalTo: sumLabel.rightAnchor),
            
            nextButton.topAnchor.constraint(equalTo: sumNumLabel.bottomAnchor, constant: 10),
            nextButton.rightAnchor.constraint(equalTo: sumNumLabel.rightAnchor),
        ])
    }
    
    private func configurePizza() {
        poDomashPizzaImage.configure()
        poDomashPizzaNameLabel.configure()
        poDomashDescriptionLabel.configure()
        poDomashPizzaPrice.configure()
        poDomashPizzaCountSegment.configure()
        poDomashPizzaCount.configure()
        
        chetireSiraPizzaImage.configure()
        chetireSiraPizzaNameLabel.configure()
        chetireSiraDescriptionLabel.configure()
        chetireSiraPizzaPrice.configure()
        chetireSiraPizzaCountSegment.configure()
        chetireSiraPizzaCount.configure()
        
        cesarPizzaImage.configure()
        cesarPizzaNameLabel.configure()
        cesarDescriptionLabel.configure()
        cesaraPizzaPrice.configure()
        cesarPizzaCountSegment.configure()
        cesarPizzaCount.configure()
    }
}


