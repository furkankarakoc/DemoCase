//
//  TrackResponse.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import Foundation


struct Response : Decodable {
    var resultCount : Int?
    var results : [TrackInfo]?
}

struct TrackInfo : Decodable, Equatable {
    var artistId : Int?
    var artistName :String?
    var artistViewUrl : String?
    var artworkUrl100: String
    var releaseDate : String?
    var trackId : Int?
    var trackName : String?
    var trackPrice : Double?
    var collectionName : String?
}
