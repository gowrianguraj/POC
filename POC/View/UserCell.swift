//
//  UserCell.swift
//  POC
//
//  Created by Gowrimanohari Anguraj on 23/06/20.
//  Copyright © 2020 Gowrimanohari Anguraj. All rights reserved.
//

import UIKit
class UserCell: UITableViewCell{
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblNum_Comments: UILabel!
    @IBOutlet weak var imgThumbnail : UIImageView!
    var modelUser: Response?{
        didSet{
            userConfiguration()
        }
    }
    
    func userConfiguration(){
         
          
        lblTitle.text = modelUser?.title
        lblAuthor.text = modelUser?.author
        
       }
}
