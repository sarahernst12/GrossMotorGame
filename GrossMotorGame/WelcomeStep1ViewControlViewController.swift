//
//  WelcomeStep1ViewControlViewController.swift
//  GrossMotorGame
//
//  Created by Rachel Cutlan on 2/9/22.
//

import UIKit

class WelcomeStep1ViewControlViewController: UIViewController {

    @IBOutlet weak var nameFieldLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    //create usable user model
    var user: User? //use question mark for safety
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize user model here
        self.user = User()
    }
    
    //to catch the segue in action - use prepare function that's included in all subclasses of UIViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //need to assign value of name field to user object
        self.user?.name = nameField.text
        
        //grab reference to destination view controller
        //use destination and case it as welcomestep2
        //by default, it's a simple UIVIewController
        let step2VC = segue.destination as! WelcomeStep2ViewController
        
        //assign user object from this class to that class
        step2VC.user = self.user
        
    }
    
    //checking length of text entered by user for name field
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let name = nameField.text, name.count >= 2 {
            return true
        }
        //add alert so user knows its an invalid name
        let alertController = UIAlertController(title: "Wait a minute!", message: "Please enter at least 2 characters for name", preferredStyle: .alert)
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
