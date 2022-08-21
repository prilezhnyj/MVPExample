//
//  SecodViewController.swift
//  MVPExample
//
//  Created by Максим Боталов on 21.08.2022.
//

import UIKit

class SecodViewController: UIViewController {
    
    var presenter: SecondViewPresenterProtocol!
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstr()
        presenter.getComments()
    }
}

extension SecodViewController: SecondViewProtocol {
    func setComment(comment: CommentModel?) {
        let com = comment?.body
        textView.text = com
    }
}

extension SecodViewController {
    private func setupConstr() {
        view.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}
