//
//  CustomImage.swift
//  UISegmentControl
//
//  Created by Shamil Ashurilov on 11.01.2023.
//

import Foundation
import UIKit

final class CustomImage: UIImageView {
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
        image = type.logo
        layer.cornerRadius = 10
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        contentMode = .scaleToFill
    }
}
