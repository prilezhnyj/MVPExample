//
//  MainViewController.swift
//  MVPExample
//
//  Created by Максим Боталов on 21.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let infoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstr()
        
        infoTableView.delegate = self
        infoTableView.dataSource = self
        infoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        
        
        presenter.getComments()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comment = presenter.comments?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = comment?.name
        return cell
    }
    
    
}

// MARK: - ViewProtocol
extension MainViewController: ViewProtocol {
    func sucsess() {
        infoTableView.reloadData()
    }
    
    func failure() {
        print("ERROR")
    }
    
}

extension MainViewController {
    private func setupConstr() {
        view.addSubview(infoTableView)
        NSLayoutConstraint.activate([
            infoTableView.topAnchor.constraint(equalTo: view.topAnchor),
            infoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}

