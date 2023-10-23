//
//  UIImageView+Extensions.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 22/10/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(url: String, placeHolder: UIImage = UIImage(systemName: "photo")!) {
        if let url = URL(string: url) {
            self.kf.setImage(with: url, placeholder: placeHolder, options: [.transition(.fade(1))], completionHandler: nil)
        }
    }
}
