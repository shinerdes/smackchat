//
//  Channel.swift
//  Smack
//
//  Created by 김영석 on 2018. 9. 26..
//  Copyright © 2018년 김영석. All rights reserved.
//

import Foundation

struct Channel : Decodable {
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
    
}
