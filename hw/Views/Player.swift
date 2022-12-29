//
//  Player.swift
//  player
//
//  Created by Shamil Ashurilov on 27.12.2022.
//

import UIKit
import AVFoundation

final class Player: UIViewController {
    
    static var currentSong: Song?
    
    private let hideVCButton = CustomPlayerButton()
    private let shareButton = CustomPlayerButton()
    private let addButton = CustomPlayerButton()
    private let listButton = CustomPlayerButton()
    private let randomButton = CustomPlayerButton()
    private let backwordButton = CustomPlayerButton()
    private let playAndPauseButton = CustomPlayerButton()
    private let forwardButton = CustomPlayerButton()
    private let repeatButton = CustomPlayerButton()
    
    private let currentTimeLabel = CustomLabels()
    private let totalTimeLabel = CustomLabels()
    private let songArtistLabel = CustomLabels()
    private let songNameLabel = CustomLabels()
    private let playingFromAlbumLabel = CustomLabels()
    private let currentAlbum = CustomLabels()

    private var currentAlbumLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.masksToBounds = true
        return imageView
    }()
    

    private var songDurationSlider: UISlider = {
        let slider = UISlider()
        slider.setThumbImage(UIImage(named: "thumb"), for: .normal)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .black
        slider.isContinuous = false
        return slider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
   }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentAlbum.text = Player.currentSong?.album
        currentAlbumLogo.image = Player.currentSong?.logo
        
        songNameLabel.text = Player.currentSong?.name
        songArtistLabel.text = Player.currentSong?.artist
        
        createButtons()
        songDurationSlider.addTarget(self, action: #selector(changeSliderValue(sender:)), for: .valueChanged)
        playAndPauseButton.addTarget(self, action: #selector(playAndPauseButtonAction(sender:)), for: .touchUpInside)
        hideVCButton.addTarget(self, action: #selector(hideVCButtonAction), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
        
        [forwardButton, backwordButton].forEach{ $0.addTarget(self, action: #selector(forwardButtonAction), for: .touchUpInside) }
                
        let timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            if Player.currentSong?.player?.isPlaying == true {
                self.updateProgress()
            }
        })
    }
    
    // MARK: Funcs
    private func updateProgress() {
        if let player = Player.currentSong?.player {
            songDurationSlider.value = Float(player.currentTime)
            updateTime()
        }
    }
    
    private func updateTime() {
        guard let player = Player.currentSong?.player else { return }
        currentTimeLabel.text = String(player.currentTime)
                    
        let minStr: Int = Int(player.currentTime) / 60
        let secStr: Int = Int(player.currentTime) % 60
        
        if secStr > 0 && secStr <= 9  {
            currentTimeLabel.text = String("\(minStr):0\(secStr)")
        } else {
            currentTimeLabel.text = String("\(minStr):\(secStr)")

        }
    }
    
    private func createButtons() {
        hideVCButton.configurate(type: .hide)
        shareButton.configurate(type: .share)
        addButton.configurate(type: .add)
        listButton.configurate(type: .list)
        randomButton.configurate(type: .random)
        backwordButton.configurate(type: .backward)
        playAndPauseButton.configurate(type: .play)
        forwardButton.configurate(type: .forward)
        repeatButton.configurate(type: .repeatButton)
        
        playingFromAlbumLabel.configure(type: .playingFromAlbumLabel)
        currentAlbum.configure(type: .currentAlbum)
        songNameLabel.configure(type: .songNameLabel)
        songArtistLabel.configure(type: .songArtistLabel)
        currentTimeLabel.configure(type: .currentTimeLabel)
        totalTimeLabel.configure(type: .totalTimeLabel)
        
        createConstraints()
        
        if let player = Player.currentSong?.player {
            songDurationSlider.maximumValue = Float(player.duration)
        }
        
    }
    
    private func createConstraints() {
        let albumNameStackView = UIStackView(arrangedSubviews: [playingFromAlbumLabel, currentAlbum])
        albumNameStackView.translatesAutoresizingMaskIntoConstraints = false
        albumNameStackView.axis = .vertical
        albumNameStackView.alignment = .center
        albumNameStackView.distribution = .fill
        
        let topStackView = UIStackView(arrangedSubviews: [hideVCButton, albumNameStackView, shareButton])
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.axis = .horizontal
        topStackView.alignment = .top
        topStackView.distribution = .equalSpacing
        topStackView.spacing = 10
        
        let songInfoTextStackView = UIStackView(arrangedSubviews: [songNameLabel, songArtistLabel])
        songInfoTextStackView.translatesAutoresizingMaskIntoConstraints = false
        songInfoTextStackView.axis = .vertical
        songInfoTextStackView.alignment = .center
        songInfoTextStackView.distribution = .fill
        
        let songInfoStackView = UIStackView(arrangedSubviews: [addButton, songInfoTextStackView, listButton])
        songInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        songInfoStackView.axis = .horizontal
        songInfoStackView.alignment = .top
        songInfoStackView.distribution = .equalSpacing
        songInfoStackView.spacing = 10
        
        let songButtonsStackView = UIStackView(arrangedSubviews: [randomButton, backwordButton, playAndPauseButton, forwardButton, repeatButton])
        songButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        songButtonsStackView.axis = .horizontal
        songButtonsStackView.alignment = .center
        songButtonsStackView.distribution = .equalSpacing
        songButtonsStackView.spacing = 10
        
        [topStackView, currentAlbumLogo, songInfoStackView, songDurationSlider,currentTimeLabel, totalTimeLabel , songButtonsStackView].forEach{ view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            topStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            topStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            currentAlbumLogo.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 50),
            currentAlbumLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAlbumLogo.heightAnchor.constraint(equalToConstant: 300),
            currentAlbumLogo.widthAnchor.constraint(equalToConstant: 300),
            
            songInfoStackView.topAnchor.constraint(equalTo: currentAlbumLogo.bottomAnchor, constant: 50),
            songInfoStackView.leftAnchor.constraint(equalTo: topStackView.leftAnchor),
            songInfoStackView.rightAnchor.constraint(equalTo: topStackView.rightAnchor),
            
            songDurationSlider.topAnchor.constraint(equalTo: songInfoStackView.bottomAnchor, constant: 40),
            songDurationSlider.leftAnchor.constraint(equalTo: songInfoStackView.leftAnchor),
            songDurationSlider.rightAnchor.constraint(equalTo: songInfoStackView.rightAnchor),
            
            currentTimeLabel.bottomAnchor.constraint(equalTo: songDurationSlider.topAnchor, constant: -5),
            currentTimeLabel.leftAnchor.constraint(equalTo: songDurationSlider.leftAnchor),
            
            totalTimeLabel.bottomAnchor.constraint(equalTo: songDurationSlider.topAnchor, constant: -5),
            totalTimeLabel.rightAnchor.constraint(equalTo: songDurationSlider.rightAnchor),
            
            songButtonsStackView.topAnchor.constraint(equalTo: songDurationSlider.bottomAnchor, constant: 20),
            songButtonsStackView.leftAnchor.constraint(equalTo: songDurationSlider.leftAnchor),
            songButtonsStackView.rightAnchor.constraint(equalTo: songDurationSlider.rightAnchor)
        ])
        
    }
    
    // MARK: Objc Funcs
    @objc func changeSliderValue(sender: UISlider) {
        if let player = Player.currentSong?.player {
            player.currentTime = TimeInterval(sender.value)
            updateTime()
        }
    }
    
    @objc func forwardButtonAction() {
        if Player.currentSong == song1 {
            Player.currentSong = song2
        } else if Player.currentSong == song2 {
            Player.currentSong = song1
        }
        
        if let player = Player.currentSong?.player {
            songDurationSlider.maximumValue = Float(player.duration)
        }
        if let player = Player.currentSong {
            currentAlbum.text = player.album
            songNameLabel.text = player.name
            songArtistLabel.text = player.artist
            totalTimeLabel.text = player.duration
            currentAlbumLogo.image = player.logo
        }
    }
    
    @objc func playAndPauseButtonAction(sender: CustomPlayerButton) {
        guard let player = Player.currentSong?.player else { return }
        
        if player.isPlaying {
            player.pause()
            sender.configurate(type: .play)
        } else {
            player.play()
            sender.configurate(type: .pause)
        }
    }
    
    @objc func hideVCButtonAction() {
        dismiss(animated: true)
    }
    
    @objc func shareButtonAction() {
        var url: URL!
        var songName: String
        if Player.currentSong?.tag == 1 {
            url = URL(string: "https://www.youtube.com/watch?v=Kbj2Zss-5GY")
        } else if Player.currentSong?.tag == 2 {
            url = URL(string: "https://www.youtube.com/watch?v=NwZiH0IaoAQ")
        }
        guard let albumLogo = Player.currentSong?.logo, let player = Player.currentSong else { return }
        songName = "\(player.artist) - \(player.name)"
        
        let items: [Any] = [url, albumLogo, songName]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

extension Player: SongDelegate {
    func songDelegate(song: Song) {
        Player.currentSong = song
        print("delegate")
    }
}
