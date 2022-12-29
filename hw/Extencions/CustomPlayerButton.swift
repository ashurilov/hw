//
//  CustomPlayerButton.swift
//  player
//
//  Created by Shamil Ashurilov on 27.12.2022.
//

import UIKit

enum CustomPlayerButtonEnum {
    case hide
    case share
    case list
    case add
    case play
    case pause
    case random
    case repeatButton
    case backward
    case forward
    
    var image : UIImage {
        switch self {
        case .hide:
            return UIImage(named: "hide")!
        case .share:
            return UIImage(named: "share")!
        case .list:
            return UIImage(named: "list")!
        case .add:
            return UIImage(named: "add")!
        case .play:
            return UIImage(named: "play")!
        case .pause:
            return UIImage(named: "pause")!
        case .random:
            return UIImage(systemName: "shuffle")!
        case .repeatButton:
            return UIImage(systemName: "repeat")!
        case .backward:
            return UIImage(systemName: "backward.end")!
        case .forward:
            return UIImage(systemName: "forward.end")!

        }
        
    }
}

final class CustomPlayerButton: UIButton {
    
    var type = CustomPlayerButtonEnum.pause
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurate(type: CustomPlayerButtonEnum) {
        self.type = type
        translatesAutoresizingMaskIntoConstraints = false
        setImage(type.image.withRenderingMode(.alwaysOriginal), for: .normal)
        addTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func tap(sender: CustomPlayerButton) {
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveEaseIn) {
                self.alpha = 0.5
            } completion: { _ in
                self.alpha = 1
            }
    }
}
