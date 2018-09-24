//
//  AvatarPickerVC.swift
//  Smack
//
//  Created by 김영석 on 2018. 9. 22..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    // Variables
    
    var avatarType = AvatarType.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell{
            
            cell.configureCell(index: indexPath.item, type: avatarType)
            
            return cell
        }
        return AvatarCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
        
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    

    
}
