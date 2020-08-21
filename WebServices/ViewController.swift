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
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getUserDetails(_ sender: Any) {
        
//        viewModel.getUserDetails(userId: Int(inputTextField.text!)!) { (userInfo) in
//            print(userInfo)
//        }
        
        viewModel.getUsersDetails(pageId: Int(inputTextField.text!)!) { (userInfo) in
            print(userInfo)
        }
    }
    
    

}

