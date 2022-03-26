//
//  WelcomeStep2ViewController.swift
//  GrossMotorGame
//
//  Created by Rachel Cutlan on 2/9/22.
//

import UIKit

class WelcomeStep2ViewController: UIViewController {

    @IBOutlet weak var beginGameFieldLabel: UILabel!
    @IBOutlet weak var beginGameField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    //create model for user
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let backgroundImage = UIImageView(frame:UIScreen.main.bounds)
        //backgroundImage.image = UIImage(named: "Bunnybackground2")
        //backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        //self.view.insertSubview(backgroundImage, at: 0)
        //self.viewbackgroundColor = UIColor(patternImage: UIImage(named: "Bunnybackground2.png"))
        // Do any additional setup after loading the view.
//        self.beginGameFieldLabel.text = "Thank you user: \(user!.accessCode!). The following games //are available for your play."
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
