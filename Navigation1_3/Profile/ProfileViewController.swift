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
        profile.backgroundColor = .systemGray3

        return profile
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(profileHeaderView)
        setUpView()
        contraints()
    }

    func setUpView() {
        self.navigationItem.title = "Профиль"
        self.view.backgroundColor = .white
    }

    func contraints() {
        NSLayoutConstraint.activate([
            self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
    }
}
