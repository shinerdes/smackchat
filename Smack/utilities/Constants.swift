//
//  Constants.swift
//  Smack
//
//  Created by 김영석 on 2018. 9. 8..
//  Copyright © 2018년 김영석. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// url Constants

let BASE_URL = "https://rdeschatjb.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

// user defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//Headers

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
