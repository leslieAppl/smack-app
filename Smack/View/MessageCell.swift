//
//  MessageCell.swift
//  Smack
//
//  Created by leslie on 9/2/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(message: Message) {
        messageBodyLbl.text = message.message
        userNameLbl.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
        
        // iSO 8601 dates: 2017-07-13T21:49:25.590Z
        guard var isoDate = message.timeStamp else { return }
        
//        Swift 3.0 - [Substring function]
//        let end = isoDate.index(isoDate.endIndex, offsetBy: -5)
//        'substring(to:)' is deprecated: Please use String slicing subscript with a 'partial range upto' operator.
//        let isoDate = isoDate.substring(to: end)
        
        // Swift 4.0+ [Subtring function]
        // tailing iSO 8601 dates: '2017-07-13T21:49:25.590Z' to '2017-07-13T21:49:25'
        isoDate = String(isoDate.prefix(19))
        
        let isoFormatter = ISO8601DateFormatter()
        let chatDate = isoFormatter.date(from: isoDate.appending("Z"))
        
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "MMM d, h:mm a"
        
        if let finalDate = chatDate {
            let finalDate = newFormatter.string(from: finalDate)
            timeStampLbl.text = finalDate
        }
    }
}
