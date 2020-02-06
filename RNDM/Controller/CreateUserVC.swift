//
//  CreateUserVC.swift
//  RNDM
//
//  Created by 原田悠嗣 on 2020/02/01.
//  Copyright © 2020 原田悠嗣. All rights reserved.
//

import UIKit
import Firebase

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

        guard let email = emailText.text,
            let password = passwordText.text,
            let username = usernameText.text else { return }


        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in

            if let error = error {
                debugPrint("Error creating user: \(error.localizedDescription)")
            }

            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = username
            changeRequest?.commitChanges(completion: { (error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                }
            })

            guard let userId = Auth.auth().currentUser?.uid else { return }
            Firestore.firestore().collection(USERS_REF).document(userId).setData([
                USERNAME: username,
                DATE_CREATED: FieldValue.serverTimestamp()
                ], completion: { (error) in
                    if let error = error {
                        debugPrint(error.localizedDescription)
                    } else {
                        self.dismiss(animated: true)
                    }
            })
        }
    }


    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
