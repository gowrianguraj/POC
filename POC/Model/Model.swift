//
//  Model.swift
//  POC
//
//  Created by Gowrimanohari Anguraj on 23/06/20.
//  Copyright © 2020 Gowrimanohari Anguraj. All rights reserved.
//

import Foundation
import Alamofire

//struct Children {
//    var data : Response
//}

struct Response : Codable {
    var author : String?
    var thumbnail : String?
    var title : String?
    var numcomments : String?
    
    enum CodingKeys : String,CodingKey {
        case author
        case thumbnail
        case title
        case numcomments = "num_comments"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        numcomments = try values.decodeIfPresent(String.self, forKey: .numcomments)
    }
    
}

