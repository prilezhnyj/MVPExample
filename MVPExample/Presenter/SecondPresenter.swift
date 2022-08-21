//
//  SecondPresenter.swift
//  MVPExample
//
//  Created by Максим Боталов on 21.08.2022.
//

import Foundation

protocol SecondViewProtocol: AnyObject {
    func setComment(comment: CommentModel?)
}

protocol SecondViewPresenterProtocol {
    init(view: SecondViewProtocol, networkServices: NetworkServicesProtocol, comment: CommentModel?)
    func getComments()
}

class SecondViewPresenter: SecondViewPresenterProtocol {
    weak var view: SecondViewProtocol?
    let ns: NetworkServicesProtocol?
    var comment: CommentModel?
    required init(view: SecondViewProtocol, networkServices: NetworkServicesProtocol, comment: CommentModel?) {
        self.view = view
        self.ns = networkServices
        self.comment = comment
    }
    
    public func getComments() {
        view?.setComment(comment: comment)
    }
}
