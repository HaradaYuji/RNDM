//
//  Thought.swift
//  RNDM
//
//  Created by 原田悠嗣 on 2020/01/26.
//  Copyright © 2020 原田悠嗣. All rights reserved.
//

import Foundation
import Firebase

class Thought {


    private(set) var username: String!
    private(set) var timestamp: Date!
    private(set) var thoughtText: String!
    private(set) var numLikes: Int!
    private(set) var numComments: Int!
    private(set) var documentId: String!

    init(username: String, timestamp: Date, thoughText: String, numLikes: Int, numComments: Int, documentId: String) {
        self.username = username
        self.timestamp = timestamp
        self.thoughtText = thoughText
        self.numLikes = numLikes
        self.numComments = numComments
        self.documentId = documentId
    }


    class func parseData(snapshot: QuerySnapshot?) -> [Thought] {

        var thoughts = [Thought]()

        guard let snap = snapshot else { return thoughts }
        for document in (snap.documents) {
            let data = document.data()
            let username = data[USERNAME] as? String ?? "Anonymous"
            let timestamp = data[TIMESTAMP] as? Date ?? Date()
            print("**\(timestamp)")
            let thoughtText = data[THOUGHT_TEXT] as? String ?? "Anonymous"
            let numLikes = data[NUM_LIKES] as? Int ?? 0
            print("**\(numLikes)")
            let numComments = data[NUM_COMMENTS] as? Int ?? 0
            let documentId = document.documentID


            let newThought = Thought(username: username, timestamp: timestamp, thoughText: thoughtText, numLikes: numLikes, numComments: numComments, documentId: documentId)
            thoughts.append(newThought)
        }
        return thoughts
    }
}
