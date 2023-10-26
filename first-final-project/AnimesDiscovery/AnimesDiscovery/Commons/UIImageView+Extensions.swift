//
//  UIImageView+Extensions.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 22/10/23.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    func loadImage(url: String, placeHolder: UIImage = UIImage(systemName: "photo")!) {
        self.image = placeHolder
        AF.request(url).responseImage { response in
            if case .success(let image) = response.result {
                self.image = image
            }
        }
    }
}
