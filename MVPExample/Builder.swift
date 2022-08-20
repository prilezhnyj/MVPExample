//
//  Builder.swift
//  MVPExample
//
//  Created by Максим Боталов on 21.08.2022.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class BuilderModule: Builder {
    static func createMainModule() -> UIViewController {
        let user = UserModel(name: "Max", age: 24)
        let view = MainViewController()
        let presenter = MainViewPresenter(view: view, user: user)
        view.presenter = presenter
        return view
    }
}
