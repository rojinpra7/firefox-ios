// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import UIKit
import Shared
import Common

protocol CredentialPasscodeRequirementViewControllerDelegate: AnyObject {
    func credentialPasscodeRequirementViewControllerDidDismiss()
}

class CredentialPasscodeRequirementViewController: UIViewController {
    private struct UX {
        static let titleFontSize: CGFloat = 32
        static let taglineFontSize: CGFloat = 20
        static let warningFontSize: CGFloat = 18
        static let cancelButtonFontSize: CGFloat = 17
        static let cancelButtonCornerRadius: CGFloat = 8
    }
    var delegate: CredentialPasscodeRequirementViewControllerDelegate?

    private lazy var logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo-glyph"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = .LoginsWelcomeViewTitle2
        label.font = UIFont.systemFont(ofSize: UX.titleFontSize, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var taglineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = .LoginsWelcomeViewTagline
        label.font = UIFont.systemFont(ofSize: UX.taglineFontSize)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var warningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: UX.warningFontSize)
        label.text = .LoginsPasscodeRequirementWarning
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var cancelButton: UIButton = .build { button in
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = UX.cancelButtonCornerRadius
        button.setTitle(.CancelString, for: .normal)
        button.titleLabel?.font = DefaultDynamicFontHelper.preferredBoldFont(withTextStyle: .body,
                                                                             size: UX.cancelButtonFontSize)
        button.addTarget(self, action: #selector(self.cancelButtonTapped), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.CredentialProvider.welcomeScreenBackgroundColor

        view.addSubviews(logoImageView, titleLabel, taglineLabel, warningLabel, cancelButton)

        NSLayoutConstraint.activate(
            [
                logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                logoImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, multiplier: 0.4),

                titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
                titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                titleLabel.leadingAnchor.constraint(
                    equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
                    constant: 35,
                    priority: .defaultHigh
                ),
                titleLabel.trailingAnchor.constraint(
                    equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -35,
                    priority: .defaultHigh
                ),
                titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 440),

                taglineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                taglineLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                taglineLabel.leadingAnchor.constraint(
                    equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
                    constant: 35,
                    priority: .defaultHigh
                ),
                taglineLabel.trailingAnchor.constraint(
                    equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -35,
                    priority: .defaultHigh
                ),
                taglineLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 440),

                warningLabel.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 20),
                warningLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                warningLabel.leadingAnchor.constraint(
                    equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
                    constant: 35,
                    priority: .defaultHigh
                ),
                warningLabel.trailingAnchor.constraint(
                    equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -35,
                    priority: .defaultHigh
                ),
                warningLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 440),

                cancelButton.bottomAnchor.constraint(
                    equalTo: self.view.layoutMarginsGuide.bottomAnchor,
                    constant: -20
                ),
                cancelButton.heightAnchor.constraint(equalToConstant: 44),
                cancelButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                cancelButton.leadingAnchor.constraint(
                    equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
                    constant: 35,
                    priority: .defaultHigh
                ),
                cancelButton.trailingAnchor.constraint(
                    equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -35,
                    priority: .defaultHigh
                ),
                cancelButton.widthAnchor.constraint(lessThanOrEqualToConstant: 360)
            ]
        )
    }

    @objc
    func cancelButtonTapped(_ sender: UIButton) {
        delegate?.credentialPasscodeRequirementViewControllerDidDismiss()
    }
}
