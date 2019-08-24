//
//  Constants.swift
//  Smack
//
//  Created by leslie on 8/16/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import Foundation

// Universal Variables used by the whole project
typealias CompletionHandler = (_ Succes: Bool) -> ()

// URL Constants
let BASE_URL = "https://lesliechatchat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"


// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND_TO_CHANNEL = "unwindToChannel"

// User Defaultes
let TOKEN_KEY = "token"
let LOOGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]


