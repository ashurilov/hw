//
//  CustomLabels.swift
//  player
//
//  Created by Shamil Ashurilov on 27.12.2022.
//

import UIKit

enum CustomLabelsEnum {
    case playingFromAlbumLabel
    case currentAlbum
    case songNameLabel
    case songArtistLabel
    case currentTimeLabel
    case totalTimeLabel
    
    var title : String? {
        switch self {
        case .playingFromAlbumLabel:
            return "Playing from album:"
        case .currentTimeLabel:
            return "-:--"
        case .totalTimeLabel:
            return Player.currentSong?.duration
        default :
            return ""
        }
    }
    
    var font: UIFont {
        switch self {
        case .playingFromAlbumLabel:
            return UIFont.systemFont(ofSize: 16)
        case .currentAlbum, .songNameLabel:
            return UIFont.boldSystemFont(ofSize: 18)
        case .songArtistLabel:
            return UIFont.systemFont(ofSize: 16)
        case .currentTimeLabel, .totalTimeLabel :
            return UIFont.systemFont(ofSize: 12)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .playingFromAlbumLabel, .songArtistLabel:
            return .gray
        default: return .black
        }
    }
    
    
}

final class CustomLabels: UILabel {
    var type: CustomLabelsEnum!
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(type: CustomLabelsEnum) {
        self.type = type
        numberOfLines = 1
        translatesAutoresizingMaskIntoConstraints = false
        font = type.font
        textColor = type.textColor
        
        if type == .playingFromAlbumLabel || type == .currentTimeLabel || type == .totalTimeLabel { text = type.title }
    }
    
}
