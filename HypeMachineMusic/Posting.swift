//
//  Posting.swift
//  HypeMachineMusic
//
//  Created by Ulric Ye on 2/20/17.
//  Copyright © 2017 Nick McDonald. All rights reserved.
//

import UIKit

class Posting: NSObject {
    
    var artistName: String?
    var titleName: String?
    var lovedCount: Int?
    var postedCount: Int?
    var rank: Int?
    var time: Int?
    var postDescription: String?
    var itemID: String?
    var itunesLink: URL?
    var thumbnailLink: URL?
    
    init?(postingDictionary: NSDictionary) {
        
        // For small companies, ideal for short # of codes, not ideal for bigger companies
        /*self.artistName = postingDictionary["artist"] as? String ?? nil*/
        
        if let artistInDictionary = postingDictionary["artist"] as? String,
            let title = postingDictionary["title"] as? String,
            let loveCount = postingDictionary["loved_count"] as? Int,
            let postCount = postingDictionary["posted_count"] as? Int,
            let postRank = postingDictionary["rank"] as? Int,
            let postTime = postingDictionary["time"] as? Int,
            let description = postingDictionary["description"] as? String,
            let postID = postingDictionary["itemid"] as? String?,
            let itunesURLAsString = postingDictionary["itunes_link"] as? String,
            let itunesURL = URL(string: itunesURLAsString),
            let thumbnailURLAsString = postingDictionary["thumb_url_medium"] as? String,
            let thumbnailURL = URL(string: thumbnailURLAsString) {
            
            self.artistName = artistInDictionary
            self.titleName = title
            self.lovedCount = loveCount
            self.postedCount = postCount
            self.rank = postRank
            self.time = postTime
            self.postDescription = description
            self.itemID = postID
            self.itunesLink = itunesURL
            self.thumbnailLink = thumbnailURL
        } else {
            print("some sort of error")
            return nil
        }
        
    }
    
    class func postingsFromArray(postsFromAPI: [NSDictionary]) -> [Posting] {
        var postingArray = [Posting]()
        
        for postingDictionary in postsFromAPI {
            guard let post = Posting(postingDictionary: postDictionary) else {
                continue
            }
            postingArray.append(posting)
        }
        
        return postingArray
    }
    
}
