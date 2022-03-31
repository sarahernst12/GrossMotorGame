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
    
    private var spinner: UIActivityIndicatorView!

    //Capture Session
    // Photo Output (Don't need?)
    // video preview!!
    
    //accepts input data from captur devices like camera and microphone
    let captureSession = AVCaptureSession()
    var previewLayer:CALayer!
    var captureDevice:AVCaptureDevice!
    
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        
        func playSound() {
            let sound = Bundle.main.path(forResource: "Step_Away", ofType: "mp3")!
            let url = URL(fileURLWithPath: sound)
        
        //let sound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Step_Away", //ofType: "mp3")!))
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        }
        catch{
            print(error)
        }
        }
        
        //creating session to prepare camera for input
        prepareCamera()
        
        //preparing camera for video output
        prepareOutput()
        
//        //check video authorization status -- video access is required and audio access is required
//        switch AVCaptureDevice.authorizationStatus(for: .video) {
//        case .authorized:
//            //user has previously granted access to the camera
//            break
//
//        case .notDetermined:
//            //user hasn't been presented with option to grant video access
//            sessionQueue.suspend()
//            AVCaptureDevice.requestAccess(for: .video, completionHandler: { granted in if !granted {
//                self.setupResult = .notAuthorized
//                }
//                self.sessionQueue.resume()
//            })
//
//        default:
//            //user has denied access
//            setupResult = .notAuthorized
//        }
//
//        switch currentPosition {
//        case .unspecified, .front:
//            newVideoDevice = backVideoDeviceDiscoverySession.devices.first
//
//        case .back:
//            newVideoDevice = frontVideoDeviceDiscoverySession.devices.first
//
//        @unknown default:
//            print("Unknown capture position. Defaulting to front, dual-camera")
//            newVideoDevice = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .front)
//        }
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
    
    func prepareCamera(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        //check if we have devices available
        
        captureSession.beginConfiguration()
        
        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
        //begin session if there is an available device
        guard
            //asks user to allow usage of camera
            let captureDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!), captureSession.canAddInput(captureDeviceInput)
            else {return}
        
        captureSession.addInput(captureDeviceInput)
        
    }
    
    func prepareOutput(){
        let videoOutput = AVCaptureVideoDataOutput()
        guard captureSession.canAddOutput(videoOutput)
        else {return}
        
        captureSession.sessionPreset = .high
        captureSession.addOutput(videoOutput)
        captureSession.commitConfiguration()
    }
    
        
//        if let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession){
//            self.previewLayer = previewLayer
//            self.view.layer.addSublayer(self.previewLayer)
//            //adjust frame
//            self.previewLayer.frame = self.view.layer.frame
//            captureSession.startRunning() //tells receiver that we want data from camera
//
//            let dataOutput = AVCaptureVideoDataOutput()
//            dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString):NSNumber(value:kCVPixelFormatType_32BGRA)]
//
//            dataOutput.alwaysDiscardsLateVideoFrames = true
//            if captureSession.canAddOutput(dataOutput){
//                captureSession.addOutput(dataOutput)
//            }
//
//            captureSession.commitConfiguration()
//        }

    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var shouldAutorotate: Bool {
        return true
    }



}
