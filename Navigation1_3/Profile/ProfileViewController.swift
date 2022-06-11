//
//  ProfileViewController.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 02.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let profile = ProfileHeaderView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.backgroundColor = .systemGray5
        return profile
    }()

    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.setTitle("Новая кнопка", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(profileHeaderView)
        self.view.addSubview(newButton)
        setUpView()
        contraints()
    }
    func setUpView() {
        //self.navigationItem.title = "Профиль"
        self.view.backgroundColor = .systemGroupedBackground
        self.navigationController?.navigationBar.isHidden = true
    }

    func contraints() {
        NSLayoutConstraint.activate([
            self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            self.newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

