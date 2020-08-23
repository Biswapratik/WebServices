//
//  ViewController.swift
//  WebServices
//
//  Created by Biswapratik Maharana on 21/08/20.
//  Copyright © 2020 Biswapratik Maharana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModel()
    var user: User?
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getUserDetails(_ sender: Any) {
        
//        viewModel.getUserDetails(userId: Int(inputTextField.text!)!) { (userInfo) in
//            print(userInfo)
//            self.user = User(userDetails: userInfo["data"] as! [String : Any])
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        
        
        viewModel.getUsersDetails(pageId: Int(inputTextField.text!)!) { [weak self] (users) in
            self?.users = users
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as UITableViewCell? {
            let aUser = users[indexPath.row]
            cell.textLabel?.text = aUser.first_name
            cell.detailTextLabel?.text = aUser.last_name
            if let image = aUser.avatar, let url = URL(string: image) {
                cell.imageView?.image = UIImage(data: try! Data(contentsOf: url))
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
}
