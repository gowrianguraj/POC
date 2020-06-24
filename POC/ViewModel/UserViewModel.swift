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
    //MARK:- Properties
    weak var vc: ViewController?
    var arrUsers = [arrList]()
  
    
    //MARK:- API Call Using Alamofire
    func getAllUsreDataAF(){
        
    AF.request("https://api.letsbuildthatapp.com/jsondecodable/courses").response { response in
            if let data = response.data {
                do{
                    let userResponse = try JSONDecoder().decode([arrList].self, from: data)
                    self.arrUsers.append(contentsOf: userResponse)
                    //MARK:- Async Operation to load data in Main thread
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

