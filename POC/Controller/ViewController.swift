//
//  ViewController.swift
//  POC
//
//  Created by Gowrimanohari Anguraj on 23/06/20.
//  Copyright © 2020 Gowrimanohari Anguraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Properties
    @IBOutlet weak var tblView: UITableView!
    var viewModelUser = UserViewModel()
    
    //MARK:- Refreshcontrol Computed Property
    var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tblView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        viewModelUser.vc = self
        viewModelUser.getAllUsreDataAF()
        tblView.refreshControl = refreshControl
        
        
        
    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        tblView.reloadData()
        sender.endRefreshing()
    }


}
//MARK:- TableView Datasource Implementation
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUser.arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        cell?.modelUser = viewModelUser.arrUsers[indexPath.row]
        return cell!
    }
    
    //MARK:- TableView Pagination
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let lastItem = viewModelUser.arrUsers.count - 1
        if indexPath.row == lastItem {
            loadMoreData()
        }
        
    }
    
    private func loadMoreData() {
        for i in 1...10 {
            
            //viewModelUser.arrUsers.append(viewModelUser.arrUsers.last! + 1)
        }
        
        tblView.reloadData()
    }
    
    
}
