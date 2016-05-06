//
//  Movie.swift
//  NavCodingChallenge
//
//  Created by Cameron Moss on 5/5/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//

import Foundation
import UIKit

struct Movie {
    
    private let kID = "id"
    private let kTitle = "title"
    private let kOverview = "overview"
    private let kPopularity = "popularity"
    
    var id: Int
    var title: String = ""
    var overview: String = ""
    var popularity: Float = 0.0
    
    init?(jsonDictionary: [String: AnyObject]) {
        
        guard let id = jsonDictionary[kID] as? Int else { return nil }
        self.id = id
        self.title = jsonDictionary[kTitle] as? String ?? ""
        self.overview = jsonDictionary[kOverview] as? String ?? ""
        self.popularity = jsonDictionary[kPopularity] as? Float ?? 0.0
    }
    
    
}
