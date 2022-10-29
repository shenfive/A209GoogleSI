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
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            
            if let error = error {
                // ...
                print(error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
            }
            
        }
        
    }
}




