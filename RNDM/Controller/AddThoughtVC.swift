//
//  AddThoughtVC.swift
//  RNDM
//
//  Created by 原田悠嗣 on 2020/01/25.
//  Copyright © 2020 原田悠嗣. All rights reserved.
//

import UIKit
import Firebase

class AddThoughtVC: UIViewController, UITextFieldDelegate, UITextViewDelegate {


    // Outlets
    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var thoughtText: UITextView!
    @IBOutlet weak var postBtn: UIButton!

    // Variables
    private var selectedCategory = "funny"


    override func viewDidLoad() {
        super.viewDidLoad()
        postBtn.layer.cornerRadius = 4
        thoughtText.layer.cornerRadius = 4
        thoughtText.text = "My random thought ..."
        thoughtText.textColor = .lightGray

        thoughtText.delegate = self
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
        Firestore.firestore().collection("thoughts").addDocument(data: [
            "category" : selectedCategory,
            "numComments" : 0,
            "numLikes" : 0,
            // - FIXME: ちゃんとアンラップしたい
            "thoughtText" : thoughtText.text!,
            "timestamp" : FieldValue.serverTimestamp(),
            // - FIXME: ちゃんとアンラップしたい
            "username" : userNameText.text!]) { (err) in
            if let err = err {
                debugPrint("Error adding document: \(err)")
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }





    }

}

