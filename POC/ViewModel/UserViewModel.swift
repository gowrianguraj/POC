//
//  UserViewModel.swift
//  POC
//
//  Created by Gowrimanohari Anguraj on 23/06/20.
//  Copyright © 2020 Gowrimanohari Anguraj. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class UserViewModel {
    weak var vc: ViewController?
    var arrUsers = [Response]()
    
    func getAllUsreDataAF(){
        AF.request("https://www.reddit.com/r/all/top/.json?t=all&limit=10").response { response in
            if let data = response.data {
                do{
                    let userResponse = try JSONDecoder().decode([Response].self, from: data)
                    self.arrUsers.append(contentsOf: userResponse)
                    DispatchQueue.main.async{
                        self.vc?.tblView.reloadData()
                    }
                }catch let err{
                    print(err.localizedDescription)
                }
            }
        }
    }
    
}

