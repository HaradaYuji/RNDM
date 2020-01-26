//
//  Thought.swift
//  RNDM
//
//  Created by 原田悠嗣 on 2020/01/26.
//  Copyright © 2020 原田悠嗣. All rights reserved.
//

import Foundation

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
        self.numLikes = numComments
        self.numComments = numComments
        self.documentId = documentId
    }

}
