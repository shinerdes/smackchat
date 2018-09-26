//
//  ProfileVC.swift
//  Smack
//
//  Created by 김영석 on 2018. 9. 26..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

   
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeModelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    func setUpView() {
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }

    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
}
