//
//  FeedViewController.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 02.06.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Лента"
        self.view.addSubview(button)

    }

    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        button.center = self.view.center
        button.setTitle("Перейти на пост", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    @objc func buttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = post.title
        navigationController?.pushViewController(postViewController, animated: true)
    }

}
