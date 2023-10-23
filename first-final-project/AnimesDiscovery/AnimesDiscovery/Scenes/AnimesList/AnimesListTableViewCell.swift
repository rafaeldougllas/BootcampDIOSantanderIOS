//
//  AnimesListTableViewCell.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 22/10/23.
//

import UIKit

class AnimesListTableViewCell: UITableViewCell {

    @IBOutlet weak var animeIcon: UIImageView!
    @IBOutlet weak var animeTitle: UILabel!
    
    func setup(anime: AnimesShortDescription) {
        if let animeModel = anime.entry.first {
            animeTitle.text = animeModel.title
            
            animeIcon.loadImage(url: animeModel.images.jpg.imageUrl)
        }
        
    }
}
