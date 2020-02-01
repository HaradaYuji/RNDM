//
//  CreateUserVC.swift
//  RNDM
//
//  Created by 原田悠嗣 on 2020/02/01.
//  Copyright © 2020 原田悠嗣. All rights reserved.
//

import UIKit

class CreateUserVC: UIViewController {

    // Outlets

    @IBOutlet weak var emailText: UITextField!

    @IBOutlet weak var passwordText: UITextField!

    @IBOutlet weak var usernameText: UITextField!

    @IBOutlet weak var createBtn: UIButton!

    @IBOutlet weak var cancelBtn: UIButton!



    override func viewDidLoad() {
        super.viewDidLoad()

        createBtn.layer.cornerRadius = 10
        cancelBtn.layer.cornerRadius = 10




    }
    

    @IBAction func createTapped(_ sender: Any) {
    }



    @IBAction func cancelTapped(_ sender: Any) {
    }


}
