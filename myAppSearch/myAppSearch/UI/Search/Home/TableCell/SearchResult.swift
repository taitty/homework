//
//  SearchResult.swift
//  myAppSearch
//
//  Created by 김희수 on 2023/03/21.
//

import UIKit
import Cosmos

class SearchResult: UITableViewCell {
    
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet var previewImage: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        rating.settings.updateOnTouch = false
        rating.settings.starSize = 15
        rating.settings.starMargin = 1
        rating.settings.filledColor = .gray
        rating.settings.emptyBorderColor = .gray
        rating.settings.filledBorderColor = .gray
        
        appIcon.layer.cornerRadius = 10
        previewImage.forEach {
            $0.layer.cornerRadius = 10
        }
    }
    
    func setupCell(data: SearchResultEntity) {
        if let imgUrl = URL(string: data.appIcon),
           let data = try? Data(contentsOf: imgUrl) {
            appIcon.image = UIImage(data: data)
        }
        
        appTitle.text = data.appTitle
        summary.text = data.summary
        
        let value = round(data.rating * 10) / 10
        rating.rating = value
        let vote = data.vote / 10000
        rating.text = String(vote)+"만"
        
        for i in 0..<previewImage.count {
            if let imgUrl = URL(string: data.previewImage[i]),
               let data = try? Data(contentsOf: imgUrl) {
                previewImage[i].image = UIImage(data: data)
            }
        }
    }
}
