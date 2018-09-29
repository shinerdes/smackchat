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
    var messages = [Message]()
    var selectedChannel : Channel?
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                

                guard let data = response.data else { return }
                if let json = try! JSON(data: data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                        self.channels.append(channel)
                    }
                    
                    NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                   

                    completion(true)
                }
                
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        
        }
        
    }
    
    func findAllMessageForChannel(channelId: String, completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                self.clearMessage()
                guard let data = response.data else { return }
                if let json = try! JSON(data: data).array {
                    
                    for item in json {
                        let messageBody = item["messageBody"].stringValue
                        let channelId = item["channelId"].stringValue
                        let id = item["_id"].stringValue
                        let userName = item["userName"].stringValue
                        let userAvatar = item["userAvatar"].stringValue
                        let userAvatarColor = item["userAvatarColor"].stringValue
                        let timeStamp = item["timeStamp"].stringValue
                        
                        let message = Message(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
                        
                        self.messages.append(message)
                        
                
                    }
                    
                }
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
        
        
    }
    
    func clearMessage() {
        messages.removeAll()
    }
    
    func clearChannels(){
        channels.removeAll()
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
