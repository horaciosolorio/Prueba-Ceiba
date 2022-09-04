//
//  LoaderViewController.swift
//  Red Medica
//
//  Created by Tato on 13/06/21.
//

import UIKit
import KRProgressHUD

class LoaderViewController: UIViewController, LoaderControlProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        let font = UIFont.systemFont(ofSize: 11)
        KRProgressHUD.set(font: font)
        KRProgressHUD.set(activityIndicatorViewColors: [.primary, .white])
    }
    
    func showLoading(with message: String) {
        self.view.isUserInteractionEnabled = false
        KRProgressHUD.show(withMessage: message)
    }
    
    func showLoading() {
        self.view.isUserInteractionEnabled = false
        KRProgressHUD.show(withMessage: "Cargando...")
    }
    
    func stopLoading() {
        self.view.isUserInteractionEnabled = true
        KRProgressHUD.dismiss()
    }
    
}


protocol LoaderControlProtocol {
    func showLoading(with message: String)
    func showLoading()
    func stopLoading()
}
