//
//  CameraViewController.swift
//  GrossMotorGame
//
//  Created by Rachel Cutlan on 3/20/22.
// This is where we will show a camera preview to the subject to know if they are in frame
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //Capture Session
    // Photo Output (Don't need?)
    // video preview!!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeRight.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        
        //view.backgroundColor = .black
        
        //opening the camera on device
        //UIImagePickerController.isSourceTypeAvailable(.camera){
        //    var imagePicker = UIImagePickerController()
        //    imagePicker.delegate = self
        //    imagePicker.sourceType = .camera;
        //    imagePicker.allowsEditing = false
        //    self.presentingViewController(imagePicker, animated: true, completion: nil)
        //}
        
        //var controller = UIImagePickerController()
        //let videoFileName = "/video.mp4"

        // Do any additional setup after loading the view.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var shouldAutorotate: Bool {
        return true
    }



}
