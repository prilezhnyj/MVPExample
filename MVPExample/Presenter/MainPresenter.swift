//
//  MainPresenter.swift
//  MVPExample
//
//  Created by Максим Боталов on 21.08.2022.
//

import Foundation

protocol ViewProtocol {
    func setInfo(info: String)
}

protocol MainViewPresenterProtocol {
    init(view: ViewProtocol, user: UserModel)
    func showInfo()
}

class MainViewPresenter: MainViewPresenterProtocol {
    let view: ViewProtocol
    let user: UserModel
    
    required init(view: ViewProtocol, user: UserModel) {
        self.view = view
        self.user = user
    }
    
    func showInfo() {
        let info = "My name is \(user.name), I am \(user.age) years old!"
        view.setInfo(info: info)
    }
}
