//
//  CommentModel.swift
//  MVPExample
//
//  Created by Максим Боталов on 21.08.2022.
//

import Foundation

struct CommentModel: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
