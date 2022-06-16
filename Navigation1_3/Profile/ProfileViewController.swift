//
//  ProfileViewController.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 02.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileTableHederView: UITableView = {
        let profileTable = UITableView(frame: .zero, style: .grouped)
        profileTable.rowHeight = UITableView.automaticDimension
        profileTable.estimatedRowHeight = 40
        profileTable.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "Profile")
        profileTable.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        profileTable.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        profileTable.translatesAutoresizingMaskIntoConstraints = false
        profileTable.delegate = self
        profileTable.dataSource = self
        profileTable.backgroundColor = .white
        return profileTable
    }()

    private let article: [Article] = Post.shared.data

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    func setUpView() {
        self.view.backgroundColor = .systemGroupedBackground
        self.view.addSubview(profileTableHederView)

        let profileTableHederViewContraints = profileTableHederViewContraints()
        NSLayoutConstraint.activate(
            profileTableHederViewContraints
        )
    }


    private func profileTableHederViewContraints() -> [NSLayoutConstraint] {
        let topAnchor = self.profileTableHederView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingAnchor = self.profileTableHederView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingAnchor = self.profileTableHederView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomAnchor = self.profileTableHederView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        return [topAnchor, leadingAnchor, trailingAnchor, bottomAnchor]
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let article = self.article[indexPath.row]
        cell.setUp(with: article)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard  let profileHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Profile") as? ProfileHeaderView else { return nil }
            return profileHeader
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        220
    }
}
