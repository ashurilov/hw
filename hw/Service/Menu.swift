//
//  Menu.swift
//  UISegmentControl
//
//  Created by Shamil Ashurilov on 11.01.2023.
//

import Foundation
import UIKit

enum Menu {
    case poDomashnemy
    case chetireSira
    case cesar
    
    var name: String {
        switch self {
        case .poDomashnemy:
            return "По домашнему"
        case .chetireSira:
            return "4 сыра"
        case .cesar:
            return "Цезарь"
        }
    }
    
    var cost: Int {
        switch self {
        case .poDomashnemy:
            return 450
        case .chetireSira:
            return 430
        case .cesar:
            return 500
        }
    }
    
    var ingredients: String {
        switch self {
        case .poDomashnemy:
            return "Самая уютная пицца: колбаса, огурчики и сыр"
        case .chetireSira:
            return "Фантастически сырная четверка на томатном соусе"
        case .cesar:
            return "Для гурманов! Курочка, айсберг, черри, сыр"
        }
    }
    
    var logo: UIImage? {
        guard let poDomash = UIImage(named: "poDomash"),
              let chetireSira = UIImage(named: "4syra"),
              let cesar = UIImage(named: "cesar")
        else { return nil }
        
        switch self {
        case .poDomashnemy:
            return poDomash
        case .chetireSira:
            return chetireSira
        case .cesar:
            return cesar
        }
    }
}

let poDomashnemyPizza = Menu.poDomashnemy
let chetireSiraPizza = Menu.chetireSira
let cesarPizza = Menu.cesar
