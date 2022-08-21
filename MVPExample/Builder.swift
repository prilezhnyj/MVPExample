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
        let view = MainViewController()
        let ns = NetworkServices()
        let presenter = MainViewPresenter(view: view, networkServices: ns)
        view.presenter = presenter
        return view
    }
}
