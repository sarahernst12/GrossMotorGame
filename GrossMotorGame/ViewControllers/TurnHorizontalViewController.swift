//
//  TurnHorizontalViewController.swift
//  GrossMotorGame
//
//  Created by Rachel Cutlan on 3/28/22.
//

import UIKit
import AVFoundation

class TurnHorizontalViewController: UIViewController {
    
    var horizontal: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        func playSaveSound() {
            let path = Bundle.main.path(forResource: "Horizontal_Device.mp3", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do{
                horizontal = try AVAudioPlayer(contentsOf: url)
                horizontal?.play()
            }
            catch {
                print("couldn't load the file")
            }
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
