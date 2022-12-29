//
//  CustomButton.swift
//  player
//
//  Created by Shamil Ashurilov on 26.12.2022.
//

import UIKit

enum CustomSongButton {
    case songOne
    case songTwo
    case defaultButton
        
    var artist: String {
        switch self {
        case .songOne :
            return  song1.artist
        case .songTwo :
            return song2.artist
        case .defaultButton :
            return ""
        }
    }
    
    var nameSong: String {
        switch self {
        case .songOne:
            return song1.name
        case .songTwo:
            return song2.name
        case .defaultButton :
            return ""
        }
    }
    
    var duration: String {
        switch self {
        case .songOne:
            return song1.duration
        case .songTwo:
            return song2.duration
        case .defaultButton :
            return ""
        }
    }
    
    var imageLogoButton: UIImage? {
        if let image1 = UIImage(named: "logoButton1"), let image2 = UIImage(named: "logoButton2") {
            switch self {
            case .songOne:
                return image1
            case .songTwo:
                return image2
            default: break
            }
        }
        return nil
    }
}

final class CustomButton: UIButton {
    var type: CustomSongButton = .defaultButton
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configure(type: CustomSongButton) {
        self.type = type
        backgroundColor = .systemGray2
        setTitle("\(type.artist) - \(type.nameSong)", for: .normal)
        
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel?.textColor = .cyan
        titleLabel?.numberOfLines = 0
        contentHorizontalAlignment = .left

        layer.cornerRadius = 15
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 60)

        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        setImage(type.imageLogoButton?.withRenderingMode(.alwaysOriginal), for: .normal)
        imageView?.contentMode = .scaleToFill
        imageView?.layer.cornerRadius = 10
        imageView?.layer.borderColor = UIColor.black.cgColor
        imageView?.layer.borderWidth = 2
        
        
        let label = UILabel()
        label.text = type.duration
        label.font = UIFont.systemFont(ofSize: 13)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    
        addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    

    @objc private func tap() {
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveEaseIn) {
            self.alpha = 0.7
        } completion: { _ in
            self.alpha = 1
        }
    }
    
}
