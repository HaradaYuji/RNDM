//
//  AddThoughtVC.swift
//  RNDM
//
//  Created by 原田悠嗣 on 2020/01/25.
//  Copyright © 2020 原田悠嗣. All rights reserved.
//

import UIKit

class AddThoughtVC: UIViewController, UITextFieldDelegate, UITextViewDelegate {


    // Outlets
    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var throughtText: UITextView!
    @IBOutlet weak var postBtn: UIButton!



    override func viewDidLoad() {
        super.viewDidLoad()
        postBtn.layer.cornerRadius = 4
        throughtText.layer.cornerRadius = 4
        throughtText.text = "My random thought ..."
        throughtText.textColor = .lightGray

        throughtText.delegate = self
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {


    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = .darkGray
    }

    @IBAction func categoryChanged(_ sender: Any) {
    }


    @IBAction func postBtnTapped(_ sender: Any) {



    }

}

