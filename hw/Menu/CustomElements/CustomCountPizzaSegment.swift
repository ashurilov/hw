//
//  CustomCountPizzaSegment.swift
//  UISegmentControl
//
//  Created by Shamil Ashurilov on 11.01.2023.
//

import Foundation
import UIKit

final class CustomCountPizzaSegment: UISegmentedControl {
    var type: Menu
    let symbols = ["-", "+"]

    init(type: Menu) {
        self.type = type
        super.init(items: symbols)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        isMomentary = true
    }
}
