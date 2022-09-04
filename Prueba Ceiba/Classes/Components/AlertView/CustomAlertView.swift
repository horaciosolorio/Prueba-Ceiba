//
//  CustomAlertView.swift
//  Red Medica
//
//  Created by Tato on 13/06/21.
//

import UIKit

protocol CustomAlerViewDelegate: class {
    func viewAlertTaped(type: AlertType)
}

final class CustomAlertView: UIViewController {

    var type: AlertType
    var message: String
    var titleC: String
    weak var delegate: CustomAlerViewDelegate?

    @IBOutlet weak var contentView: RoundedView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var messageLabel: UILabel?

    init(type: AlertType, title: String, message: String) {
        self.type = type
        self.titleC = title
        self.message = message
        super.init(nibName: "CustomAlertView", bundle: Bundle.main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setData()
    }

    private func setupUI() {
        view.isOpaque = false
        contentView?.layer.shadowOffset = .zero
        contentView?.layer.shadowOpacity = 0.1
        contentView?.layer.shadowRadius = 10
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(taped))
        view.addGestureRecognizer(tapGesture)
    }

    private func setData() {
        if type == .error {
            titleLabel?.text = "Error"
            titleLabel?.textColor = .red
        } else {
            titleLabel?.text = titleC
            titleLabel?.textColor = .black
        }
        messageLabel?.text = message
    }

    func dismissMe() {
        dismiss(animated: true, completion: .none)
    }

    @objc func taped() {
        delegate?.viewAlertTaped(type: type)
    }

}

enum AlertType {
    case error
    case message
}
