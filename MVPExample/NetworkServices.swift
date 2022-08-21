//
//  NetworkServices.swift
//  MVPExample
//
//  Created by Максим Боталов on 21.08.2022.
//

import Foundation

protocol NetworkServicesProtocol {
    func getComments(completion: @escaping (Result<[CommentModel]?, Error>) -> Void)
}

class NetworkServices: NetworkServicesProtocol {
    func getComments(completion: @escaping (Result<[CommentModel]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            
            do {
                let comments = try JSONDecoder().decode([CommentModel].self, from: data!)
                completion(.success(comments))
            } catch {
                completion(.failure(error.localizedDescription as! Error))
            }
        }.resume()
    }
}
