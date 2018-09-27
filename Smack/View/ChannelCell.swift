//
//  ChannelCell.swift
//  Smack
//
//  Created by 김영석 on 2018. 9. 27..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var channelName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2) as! CGColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }

        // Configure the view for the selected state
    }
    
    func configureCell(channel : Channel) {
        let title = channel.channelTitle ?? ""
        channelName.text = "#\(title)"
     

    }

}