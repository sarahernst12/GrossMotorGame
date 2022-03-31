//
//  AvatarViewController.swift
//  GrossMotorGame
//
//  Created by Rachel Cutlan on 3/20/22.
//  This controller plays the video of the avatar
//

import UIKit
import AVKit
import AVFoundation

class AvatarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")

        // Do any additional setup after loading the view.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var shouldAutorotate: Bool {
        return true
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
