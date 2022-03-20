//
//  AvatarViewController.swift
//  GrossMotorGame
//
//  Created by Rachel Cutlan on 3/20/22.
//

import UIKit
import AVKit
import AVFoundation

class AvatarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Avatar_with_Instructions", ofType: "mp4")!))
        
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds   //will need to change this to correct dimensions
        layer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(layer)
        
        player.play()
    }
    


}
