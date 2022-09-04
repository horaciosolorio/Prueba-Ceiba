//
//  AlertLoaderViewController.swift
//  Red Medica
//
//  Created by Tato on 13/06/21.
//

import UIKit

class AlertLoaderUIViewController: LoaderViewController, AlertProtocol, CustomAlerViewDelegate {
    
    var messageAlertView: CustomAlertView? = nil
    var errorAlertView:   CustomAlertView? = nil
    
    func showAlertError(error: String) {
        errorAlertView = CustomAlertView(type: .error, title: "", message: error)
        guard let errorAlertView = errorAlertView else { return }
        errorAlertView.delegate = self
        presentSelector(errorAlertView, animated: true, completion: .none)
    }
    
    func showAlertMessage(title: String, message: String) {
        messageAlertView = CustomAlertView(type: .message, title: title, message: message)
        guard let messageAlertView = messageAlertView else { return }
        messageAlertView.delegate = self
        presentSelector(messageAlertView, animated: true, completion: .none)
    }
    
    func dismissAlertMessage() {
        messageAlertView?.dismissMe()
    }
    
    func dismissErrorAlert() {
        errorAlertView?.dismissMe()
    }
    
    func viewAlertTaped(type: AlertType) {
        print("AlertLoaderUIViewController type\(type)")
        type == .message ? dismissAlertMessage() : dismissErrorAlert()
    }
}

protocol AlertProtocol {
    func showAlertError(error: String)
    func showAlertMessage(title: String, message: String)
}

