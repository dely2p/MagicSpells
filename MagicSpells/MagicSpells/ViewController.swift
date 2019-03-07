//
//  ViewController.swift
//  MagicSpells
//
//  Created by dely on 2019. 2. 22..
//  Copyright © 2019년 dely. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    var arrayList = Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func createDataButton(_ sender: Any) {
        guard let name = self.nameLabel.text else {
            return
        }
        guard let password = self.passwordLabel.text else {
            return
        }
        print(name)
        print(password)
        Alamofire.request("http://myband.run.goorm.io/addUser/\(self.userNameLabel.text!)", method: .post, parameters: ["name" : name, "password" : password]).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
//        Alamofire.request("http://myband.run.goorm.io/addUser/dely", method: .post, parameters: dic).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                print("JSON: \(json)")
//            case .failure(let error):
//
//                print(error)
//            }
//        }
//        Alamofire.request("http://memolease.ipdisk.co.kr:1337/fortunes", method: .post, parameters: ["content" : self.userNameLabel.text!]).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                print("JSON: \(json)")
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        
//        print(self.nameLabel.text!)
//        print(self.passwordLabel.text!)
        userNameLabel.text = ""
        nameLabel.text = ""
        passwordLabel.text = ""
    }
    
    @IBAction func readDataButton(_ sender: Any) {
        Alamofire.request("http://myband.run.goorm.io/list", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func updateDataButton(_ sender: Any) {
        Alamofire.request("http://myband.run.goorm.io/updateUser/\(self.userNameLabel.text!)", method: .put, parameters: ["name" : self.nameLabel.text!, "password" : self.passwordLabel.text!]).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
        userNameLabel.text = ""
        nameLabel.text = ""
        passwordLabel.text = ""
    }
    
    @IBAction func deleteDataButton(_ sender: Any) {
        Alamofire.request("http://myband.run.goorm.io/deleteUser/\(self.userNameLabel.text!)", method: .delete).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
        userNameLabel.text = ""
        nameLabel.text = ""
        passwordLabel.text = ""
    }
    
    @IBAction func endEditing(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

