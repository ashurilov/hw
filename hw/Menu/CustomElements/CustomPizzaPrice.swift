//
//  CustomPizzaPrice.swift
//  UISegmentControl
//
//  Created by Shamil Ashurilov on 11.01.2023.
//

import Foundation
import UIKit

final class CustomPizzaPrice: UILabel {
    var type: Menu
    
    init(type: Menu) {
        self.type = type
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        let type = self.type
        text = "\(type.cost)₽"
        font = UIFont.boldSystemFont(ofSize: 16)
        textColor = .black
    }
}
