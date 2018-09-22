//
//  ChannelVC.swift
//  Smack
//
//  Created by 김영석 on 2018. 9. 6..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 60
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
  

}
