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
        profileTable.estimatedRowHeight = 10
        profileTable.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "Profile")
        profileTable.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        profileTable.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
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

        NSLayoutConstraint.activate([
            // profileTableHederViewContraints
            profileTableHederView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileTableHederView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableHederView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableHederView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            case 1:
                return article.count
            default:
                return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                let cellPhoto = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) 
                return cellPhoto

            case 1:
                guard let cellArticle = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                    return cell
                }
                let article = self.article[indexPath.row]
                cellArticle.setUp(with: article)
                return cellArticle

            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
            case 0:
                guard  let profileHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Profile") as? ProfileHeaderView else { return nil }
                tableView.backgroundColor = .systemGroupedBackground
                return profileHeader

            default:
                return nil
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 0 else { return }
        let photoView = PhotosViewController()
        navigationController?.pushViewController(photoView, animated: true)
    }
}
