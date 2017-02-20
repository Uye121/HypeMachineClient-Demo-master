//
//  PostTableViewCell.swift
//  HypeMachineMusic
//
//  Created by Ulric Ye on 2/20/17.
//  Copyright © 2017 Nick McDonald. All rights reserved.
//

import UIKit
import AFNetworking

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    // Observer
    var postData: Posting? {
        didSet {
            print("PostData has been set!")
            if let thumbnailURL = postData?.thumbnailLink {
                self.postImageView.setImageWith(thumbnailURL)
            }
            self.artistLabel.text = self.postData?.artistName
            self.titleLabel.text = self.postData?.titleName
            
            if let rank = self.postData?.rank {
                self.rankLabel.text = String(describing: rank)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
