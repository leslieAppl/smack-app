//
//  Channel.swift
//  Smack
//
//  Created by leslie on 8/30/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import Foundation

struct Channel {
    // // parse data with SwiftyJSON ( MessageService <--> Channel.swift )
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
    
    // parse data with Swift 4.0 embeded ( MessageService <--> Channel.swift )
    // have to have our model mirror as same as with the json response
//    public private(set) var _id: String!
//    public private(set) var name: String!
//    public private(set) var description: String!
//    public private(set) var __v: Int!
}
