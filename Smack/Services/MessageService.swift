//
//  MessageService.swift
//  Smack
//
//  Created by 김영석 on 2018. 9. 26..
//  Copyright © 2018년 김영석. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                
//                let channel1 = Channel(channelTitle: "General", channelDescription: "Talk about anything!", id: "1")
//                let channel2 = Channel(channelTitle: "Two", channelDescription: "what!", id: "2")
//                let channel3 = Channel(channelTitle: "Three", channelDescription: "why!", id: "3")
//
//                self.channels.append(channel1)
//                self.channels.append(channel2)
//                self.channels.append(channel3)
                
                guard let data = response.data else { return }
                if let json = try! JSON(data: data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                        self.channels.append(channel)
                    }
                    
                    print(self.channels[0].channelTitle!)
                    completion(true)
                }
                
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        
    }
        
    }
    
}
/*
 func findAllChannels(completion: @escaping CompletionHandler) {
 Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON
 { (response) in
 if response.result.isSuccess {
 let channel1 = Channel(title: "General", channelDescription: "Talk about anything!", id: "1")
 let channel2 = Channel(title: "Sports", channelDescription: "Anything sports related in here!", id: "2")
 self.channels.append(channel1)
 self.channels.append(channel2)
 
 //                    guard let data = response.data else { return }
 //                    let json = try! JSON(data: data).array //Returns array of objects!
 //                    for item in json! {
 //                        let name =  item["name"].stringValue
 //                        let description = item["description"].stringValue
 //                        let id = item["_id"].stringValue
 //                        let channel = Channel(title: name, channelDescription: description, id: id)
 //                        self.channels.append(channel)
 //                    }
 completion(true)
 } else {
 completion(false)
 debugPrint(response.result.error as Any)
 }
 }
 
 */
