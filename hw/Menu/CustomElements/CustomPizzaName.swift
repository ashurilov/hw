//
//  CustomPizzaName.swift
//  UISegmentControl
//
//  Created by Shamil Ashurilov on 11.01.2023.
//

import UIKit

final class CustomPizzaName: UILabel {
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
        text = type.name
        font = UIFont.boldSystemFont(ofSize: 20)
        
    }
}
