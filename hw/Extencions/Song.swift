//
//  Song.swift
//  player
//
//  Created by Shamil Ashurilov on 26.12.2022.
//

import UIKit
import AVFoundation

struct Song: Equatable {
    var artist: String
    var name: String
    var album: String
    var duration: String
    var logo: UIImage
    var logoButton: UIImage
    var tag: Int
    var player: AVAudioPlayer?
    
    init(artist: String, name: String, album: String, duration: String, logo: UIImage, logoButton: UIImage, tag: Int) {
        self.artist = artist
        self.name = name
        self.album = album
        self.duration = duration
        self.logo = logo
        self.logoButton = logoButton
        self.tag = tag
        self.player = nil
    }
}
var song1 = Song(artist: "A$AP Rocky", name: "Praise The Lord", album: "TE$TING", duration: "3:26", logo: UIImage(named: "logo1")!, logoButton: UIImage(named: "logoButton1")!, tag: 1)
var song2 = Song(artist: "NAV", name: "Young Wheezy ft. Gunna", album: "Emergency Tsunami", duration: "2:32", logo: UIImage(named: "logo2")!, logoButton: UIImage(named: "logoButton2")!, tag: 2)
