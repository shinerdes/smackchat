//
//  SocketService.swift
//  Smack
//
//  Created by 김영석 on 2018. 9. 29..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    //var socket : SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
    
    let manager = SocketManager(socketURL: URL(string: BASE_URL)!)
    //let manager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress])
    lazy var socket:SocketIOClient = manager.defaultSocket
    
    /*
     let manager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress])
     
     func establishConnection() {
     manager.defaultSocket.connect()
     }
     
     func closeConnection() {
     manager.defaultSocket.disconnect()
     }
     
     func addChanel(name: String, description: String, completion: @escaping CompletionHandler) {
     manager.defaultSocket.emit(SOCKET_EVT_NEW_CHANNEL, name, description)
     completion(true)
     }
     
     func getChannel(completion: @escaping CompletionHandler) {
     manager.defaultSocket.on(SOCKET_EVT_CHANNEL_CREATED) { (dataArray, ack) in
     guard let name = dataArray[0] as? String else { return }
     guard let description = dataArray[1] as? String else { return }
     guard let id = dataArray[2] as? String else { return }
     let newChannel = Channel(_id: id, name: name, description: description, __v: nil)
     MessageService.instance.channels.append(newChannel)
     completion(true)
     }
     }
 */
 
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
        
        
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler){
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
        
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesc = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }

}