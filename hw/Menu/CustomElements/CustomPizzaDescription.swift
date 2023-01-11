//
//  CustomPizzaDescription.swift
//  UISegmentControl
//
//  Created by Shamil Ashurilov on 11.01.2023.
//

import Foundation
import UIKit

final class CustomPizzaDescription: UILabel {
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
        text = type.ingredients
        font = UIFont.systemFont(ofSize: 15)
        textColor = .gray
        numberOfLines = 2
    }
}
