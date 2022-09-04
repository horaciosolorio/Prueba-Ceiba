//
//  UiViewControllerExtension.swift
//  Prueba Ceiba
//
//  Created by Horacio Solorio on 03/09/22.
//

import UIKit

extension UIViewController {

    func presentSelector(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        dismissKeyboard()
        viewController.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
        viewController.modalPresentationStyle = .overCurrentContext
        present(viewController,
                animated: true,
                completion: completion)
    }

    @objc func dismissKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIApplication.resignFirstResponder),
            to: .none,
            from: .none,
            for: .none
        )
    }
}
