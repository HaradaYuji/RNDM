//
//  LoginVC.swift
//  RNDM
//
//  Created by 原田悠嗣 on 2020/01/29.
//  Copyright © 2020 原田悠嗣. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {


    @IBOutlet weak var emailText: UITextField!

    @IBOutlet weak var passwordText: UITextField!


    @IBOutlet weak var loginBtn: UIButton!

    @IBOutlet weak var createUserBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        loginBtn.layer.cornerRadius = 10
        createUserBtn.layer.cornerRadius = 10


    }

    @IBAction func loginBtnTapped(_ sender: Any) {
    }


    @IBAction func createUserTapped(_ sender: Any) {
    }

}
