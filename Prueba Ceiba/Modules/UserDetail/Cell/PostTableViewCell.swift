//
//  PostTableViewCell.swift
//  Prueba Ceiba
//
//  Created by Horacio Solorio on 03/09/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var tilte: UITextView!
    @IBOutlet weak var body: UITextView!

    func setData(post: Post) {
        tilte.text = "\(post.title ?? "")"
        body.text = "\(post.body ?? "")"
    }
}
