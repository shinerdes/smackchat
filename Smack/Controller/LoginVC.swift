//
//  LoginVC.swift
//  Smack
//
//  Created by 김영석 on 2018. 9. 8..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
   
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
}
