//
//  FirstTableViewCell.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import UIKit
import SDWebImage

class FirstTableViewCell: UITableViewCell {
    
    static let identifier = "FirstTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "FirstTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        backView.cardView()
    }
    
    func loadData(data : TrackInfo) {
        artistLabel.text = data.artistName
        trackLabel.text = data.trackName
        let imageUrl = URL(string: data.artworkUrl100)
        cellImageView.sd_setImage(with: imageUrl, completed: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
