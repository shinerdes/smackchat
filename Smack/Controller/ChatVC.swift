//
//  ChatVC.swift
//  Smack
//
//  Created by 김영석 on 2018. 9. 6..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    
    // outlet
    @IBOutlet weak var menuBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        

        // Do any additional setup after loading the view.
    }

    
    
 
}
