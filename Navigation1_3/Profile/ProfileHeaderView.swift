//
//  ProfileHeaderView.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 06.06.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    private lazy var imageProfile: UIImageView = {
        let imageProfile = UIImageView()
        imageProfile.image = UIImage(named: "fleur")
        imageProfile.translatesAutoresizingMaskIntoConstraints = false

        return imageProfile
    }()

    private lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.text = "WIlfried Odi"
        name.textColor = .black
        name.font = .systemFont(ofSize: 18, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false

        return name
    }()

    private lazy var buttonShow: UIButton = {
        let show = UIButton()
        show.setTitle("Show status", for: .normal)
        show.backgroundColor = .systemBlue
        show.translatesAutoresizingMaskIntoConstraints = false
        show.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return show
    }()


    @objc func buttonPressed() {
        if statusText == "" {
            textLabel.text = "Waiting for something..."
        }
        else {
            textLabel.text = statusText
        }
    }

    private lazy var textFiel: UITextField = {
        let textFiel = UITextField()
        textFiel.font = .systemFont(ofSize: 15, weight: .regular)
        textFiel.textColor = .black
        textFiel.backgroundColor = .white
        textFiel.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textFiel.translatesAutoresizingMaskIntoConstraints = false

        return textFiel
    }()

    private var statusText = ""

    @objc func statusTextChanged(_textField: UITextField) {
        statusText = _textField.text!
    }

    private lazy var textLabel: UILabel = {
        let text = UILabel()
        text.text = "Waiting for something..."
        text.textColor = .gray
        text.font = .systemFont(ofSize: 14, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Configuration imageProfile
        self.imageProfile.layer.cornerRadius = self.imageProfile.frame.height / 2
        self.imageProfile.layer.masksToBounds = true
        self.imageProfile.layer.borderWidth = 3
        self.imageProfile.layer.borderColor = UIColor.white.cgColor

        // configuration Button
        self.buttonShow.layer.cornerRadius = 4
        self.buttonShow.layer.shadowRadius = 4
        self.buttonShow.layer.borderColor = UIColor.black.cgColor
        self.buttonShow.layer.shadowOpacity = 0.7
        self.buttonShow.layer.shadowOffset = CGSize(width: 4, height: 4)

        // Configution textView
        self.textFiel.layer.borderColor = UIColor.black.cgColor
        self.textFiel.layer.borderWidth = 1
        self.textFiel.layer.cornerRadius = 4
    }


    private func setUpView() {
        self.addSubview(self.imageProfile)
        self.addSubview(self.nameLabel)
        self.addSubview(self.buttonShow)
        self.addSubview(self.textLabel)
        self.addSubview(self.textFiel)


        NSLayoutConstraint.activate([
            self.imageProfile.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.imageProfile.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.imageProfile.heightAnchor.constraint(equalToConstant: 120),
            self.imageProfile.widthAnchor.constraint(equalToConstant: 120),

            self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.imageProfile.trailingAnchor, constant: 13),

            self.textLabel.bottomAnchor.constraint(equalTo: self.buttonShow.topAnchor, constant: -55),
            self.textLabel.leadingAnchor.constraint(equalTo: self.imageProfile.trailingAnchor, constant: 13),
            self.textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            self.textFiel.bottomAnchor.constraint(equalTo: self.buttonShow.topAnchor, constant: -10),
            self.textFiel.leadingAnchor.constraint(equalTo: self.imageProfile.trailingAnchor, constant: 13),
            self.textFiel.heightAnchor.constraint(equalToConstant: 40),
            self.textFiel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            self.buttonShow.topAnchor.constraint(equalTo: self.imageProfile.bottomAnchor, constant: 16),
            self.buttonShow.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.buttonShow.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.buttonShow.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
}
