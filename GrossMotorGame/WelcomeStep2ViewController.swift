//
//  WelcomeStep2ViewController.swift
//  GrossMotorGame
//
//  Created by Rachel Cutlan on 2/9/22.
//

import UIKit

class WelcomeStep2ViewController: UIViewController {

    @IBOutlet weak var emailFieldLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    //create model for user
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.emailFieldLabel.text = "Hi \(user!.name!). What is your email?"
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
