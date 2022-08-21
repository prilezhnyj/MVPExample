//
//  MainPresenter.swift
//  MVPExample
//
//  Created by Максим Боталов on 21.08.2022.
//

import Foundation

protocol ViewProtocol: AnyObject {
    func sucsess()
    func failure()
}

protocol MainViewPresenterProtocol {
    init(view: ViewProtocol, networkServices: NetworkServicesProtocol)
    func getComments()
    var comments: [CommentModel]? { get set }
}

class MainViewPresenter: MainViewPresenterProtocol {
    var comments: [CommentModel]?
    
    weak var view: ViewProtocol?
    let networkServices: NetworkServicesProtocol!
    
    required init(view: ViewProtocol, networkServices: NetworkServicesProtocol) {
        self.view = view
        self.networkServices = networkServices
        getComments()
    }
    
    func getComments() {
        networkServices.getComments { [weak self ]result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    print(data!)
                    self.comments = data
                    self.view?.sucsess()
                case .failure(let error):
                    print(error.localizedDescription)
                    self.view?.failure()
                }
            }
        }
    }
}
