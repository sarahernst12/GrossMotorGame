//
//  WelcomeStep1ViewControlViewController.swift
//  GrossMotorGame
//
//  Created by Rachel Cutlan on 2/9/22.
//

import UIKit

class WelcomeStep1ViewControlViewController: UIViewController {

    @IBOutlet weak var accessCodeFieldLabel: UILabel!
    @IBOutlet weak var accessCodeField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var ForgotCodeButton: UIButton!
    //create usable user model
    var user: User? //use question mark for safety
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        
        
        
        //initialize user model here
        self.user = User()
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    
    //to catch the segue in action - use prepare function that's included in all subclasses of UIViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //need to assign value of name field to user object
        self.user?.accessCode = accessCodeField.text
        
        //grab reference to destination view controller
        //use destination and case it as welcomestep2
        //by default, it's a simple UIVIewController
        let step2VC = segue.destination as! WelcomeStep2ViewController
        
        //assign user object from this class to that class
        step2VC.user = self.user
        
    }
    
    //checking length of text entered by user for access code
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let accessCode = accessCodeField.text, accessCode.count >= 8 {
            return true
        }
        //add alert so user knows its an invalid access code
        //currently: invalid access code is when user puts in code < 8 characters
        let alertController = UIAlertController(title: "Wait a minute!", message: "Please enter a valid access code, or press 'Forgot your code' below", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK!", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        return false
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
