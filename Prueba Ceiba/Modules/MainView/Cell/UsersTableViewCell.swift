//
//  UsersTableViewCell.swift
//  Prueba Ceiba
//
//  Created by Horacio Solorio on 03/09/22.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var id = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(user: User) {
        name.text = "\(user.name ?? "")"
        phone.text = "\(user.phone ?? "")"
        email.text = "\(user.email ?? "")"
        id = user.id ?? 0
    }
    
    
    @IBAction func openPosts(_ sender: Any) {
        
    }
    
}
