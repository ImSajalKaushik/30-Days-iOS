//
//  ViewController.swift
//  AVPlayer
//
//  Created by Sajal Kaushik on 29/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var playerView: UIView!
    var looper: AVPlayerLooper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        playVideo()
    }
    
    func playVideo() {
        if let path = Bundle.main.path(forResource: "video", ofType: "mp4") {
            let videoURL  = URL(fileURLWithPath: path)
            let item = AVPlayerItem(url: videoURL)
            let player = AVQueuePlayer(items: [item])
            looper = AVPlayerLooper(player: player, templateItem: item)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = playerView.bounds
            playerLayer.videoGravity = .resizeAspect
            player.actionAtItemEnd = .none
            self.playerView.layer.addSublayer(playerLayer)
            player.play()
        }
    }


}

