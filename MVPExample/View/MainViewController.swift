//
//  MainViewController.swift
//  MVPExample
//
//  Created by Максим Боталов on 21.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let infoLabel = UILabel()
    
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(infoLabel)
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        infoLabel.textAlignment = .center
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        presenter.showInfo()
    }
}

// MARK: - ViewProtocol
extension MainViewController: ViewProtocol {
    func setInfo(info: String) {
        infoLabel.text = info
    }
}

