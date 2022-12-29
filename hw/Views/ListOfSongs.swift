//
//  ViewController.swift
//  player
//
//  Created by Shamil Ashurilov on 26.12.2022.
//

import UIKit
import AVFoundation

protocol SongDelegate: AnyObject {
    func songDelegate(song:  Song)
}

final class ListOfSongs: UIViewController {
    
    private var delegate: SongDelegate?
    private var songOneButton = CustomButton()
    private var songTwoButton = CustomButton()
    private let playerVC = Player()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        [songOneButton,songTwoButton].forEach{ $0.addTarget(self, action: #selector(presentPlayerVC(sender:)), for: .touchUpInside) }
    }
    
    @objc func presentPlayerVC(sender: CustomButton) {
       delegate = playerVC
        
        if sender == songOneButton {
            delegate?.songDelegate(song: song1)
        } else if sender == songTwoButton {
            delegate?.songDelegate(song: song2)
        }
        
        present(playerVC, animated: true)
    }
    

    private func loadUI() {
        initPlayer(song: &song1)
        initPlayer(song: &song2)
        
        title = "Playlist"
        view.backgroundColor = .white
        
        songOneButton.configure(type: .songOne)
        songTwoButton.configure(type: .songTwo)
                
        createUI()
    }
    
    private func createUI() {
        [songOneButton, songTwoButton].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            songOneButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            songOneButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            songOneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            songOneButton.heightAnchor.constraint(equalToConstant: 100),
            
            songTwoButton.topAnchor.constraint(equalTo: songOneButton.bottomAnchor, constant: 15),
            songTwoButton.leftAnchor.constraint(equalTo: songOneButton.leftAnchor),
            songTwoButton.rightAnchor.constraint(equalTo: songOneButton.rightAnchor),
            songTwoButton.heightAnchor.constraint(equalTo: songOneButton.heightAnchor)
        ])
    }

    private  func initPlayer(song: inout Song) {
        do {
            if let audioPath1 = Bundle.main.path(forResource: "song1", ofType: "mp3"), let audioPath2 = Bundle.main.path(forResource: "song2", ofType: "mp3") {
                if song.tag == 1 {
                    try song.player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath1))
                } else if song.tag == 2 {
                    try song.player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath2))
                }
            }
        } catch {
            print("Error song player")
        }
    }
}

