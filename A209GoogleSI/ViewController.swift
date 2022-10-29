//
//  ViewController.swift
//  A209GoogleSI
//
//  Created by 申潤五 on 2022/10/29.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {
    @IBOutlet weak var gSingInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gSingAction(_ sender: Any) {
        print("hello")
    }
    
    
}

