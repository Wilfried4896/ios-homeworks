//
//  LogInViewController.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 11.06.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var scrollViewLogin: UIScrollView = {
        let scrollLogin = UIScrollView()
        scrollLogin.translatesAutoresizingMaskIntoConstraints = false
        return scrollLogin
    }()

    private lazy var logoVk: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()

    private lazy var stackViewLogin: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var emailLogin: UITextField = {
        let email = parametrTextField()
        email.tag = 0
        email.placeholder = "Email of phone"
        email.keyboardType = .emailAddress
        return email
    }()

    private lazy var passwordLogin: UITextField = {
        let password = parametrTextField()
        password.tag = 1
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        return password
    }()

    private lazy var logInButton: UIButton = {
        let logIn = UIButton()
        logIn.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
        logIn.setTitle("Log In", for: .normal)
        logIn.layer.cornerRadius = 10
        
        logIn.translatesAutoresizingMaskIntoConstraints = false
        logIn.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        return logIn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.view.addSubview(scrollViewLogin)
        self.scrollViewLogin.addSubview(logoVk)
        self.scrollViewLogin.addSubview(logInButton)
        self.scrollViewLogin.addSubview(stackViewLogin)
        self.stackViewLogin.addArrangedSubview(emailLogin)
        self.stackViewLogin.addArrangedSubview(passwordLogin)
        self.navigationController?.navigationBar.isHidden = true

        let scrollViewLoginConstraints = self.scrollViewLoginConstraints()
        let logoVkConstraints = self.logoVkConstraints()
        let stackViewLoginConstraints = self.stackViewLoginConstraints()
        let logInButtonConstraints = self.logInButtonConstraints()
        NSLayoutConstraint.activate(
            scrollViewLoginConstraints + logoVkConstraints + stackViewLoginConstraints + logInButtonConstraints
        )
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(self.didShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didHidekeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func parametrTextField() -> UITextField {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.systemGray6
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 16)
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }

    private func scrollViewLoginConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.scrollViewLogin.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingAnchor = self.scrollViewLogin.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingAnchor = self.scrollViewLogin.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomAnchor = self.scrollViewLogin.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        return [topAnchor, leadingAnchor, trailingAnchor, bottomAnchor]
    }

    private func logoVkConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.logoVk.topAnchor.constraint(equalTo: self.scrollViewLogin.topAnchor, constant: 120)
        let centerXAnchor = self.logoVk.centerXAnchor.constraint(equalTo: self.scrollViewLogin.centerXAnchor)
        let heightAnchor = self.logoVk.heightAnchor.constraint(equalToConstant: 100)
        let widthAnchor = self.logoVk.widthAnchor.constraint(equalToConstant: 100)
        return [topAnchor, centerXAnchor, heightAnchor, widthAnchor]
    }

    private func stackViewLoginConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.stackViewLogin.topAnchor.constraint(equalTo: self.logoVk.bottomAnchor, constant: 120)
        let leadingAnchor = self.stackViewLogin.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let trailingAnchor = self.stackViewLogin.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let heightAnchor = self.stackViewLogin.heightAnchor.constraint(equalToConstant: 100)
        return [topAnchor, leadingAnchor, trailingAnchor, heightAnchor]
    }

    private func logInButtonConstraints() -> [NSLayoutConstraint] {
        let heightAnchor = self.logInButton.heightAnchor.constraint(equalToConstant: 50)
        let leadingAnchor = self.logInButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let trailingAnchor = self.logInButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let topAnchor = self.logInButton.topAnchor.constraint(equalTo: self.stackViewLogin.bottomAnchor, constant: 16)
        return [heightAnchor, leadingAnchor, trailingAnchor, topAnchor]
    }

    @objc func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            let logInButtonPositionY = self.logInButton.frame.origin.y + self.logInButton.frame.height
            let keyboardOriginY = self.view.frame.height - self.view.safeAreaInsets.top - keyboardHeight

            let yOffet = keyboardOriginY < logInButtonPositionY ? logInButtonPositionY - keyboardOriginY + 25 : 5

            print("\(keyboardOriginY), \(logInButtonPositionY), \(yOffet)")
            self.scrollViewLogin.contentOffset = CGPoint(x: 0, y: yOffet)
        }
    }

    @objc func didHidekeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }

    @objc func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollViewLogin.contentOffset = CGPoint(x: 0, y: 0)
    }

    @objc func openProfile() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
