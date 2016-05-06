//
//  MovieController.swift
//  NavCodingChallenge
//
//  Created by Cameron Moss on 5/5/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//

import Foundation

class MovieController {
    
    static let kBaseURLString = "https://api.themoviedb.org/3"
    static let kAPIKey = "5b1bb6650f6e1fd6e2351467318209c1"
    static let sharedController = MovieController()
    
    var movies: [Movie] = []
    
    static func getMoviesWithSearchTerm(searchTerm: String, completion: (movies: [Movie]) -> Void) {
        
        let escapedSearchTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())
        
        var movieSearchURLString = kBaseURLString + "/search/movie"
        
        //API Key
        movieSearchURLString = movieSearchURLString + "?" + "api_key=" + MovieController.kAPIKey
        
        //Query
        movieSearchURLString = movieSearchURLString + "&" + "query=" + escapedSearchTerm!
        
        if let url = NSURL(string: movieSearchURLString) {
            NetworkController.dataAtURL(url, completion: { (data) -> Void in
                
                if let data = data,
                    let jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: []),
                    let jsonDictionary = jsonAnyObject as? [String: AnyObject],
                    let resultsArray = jsonDictionary["results"] as? [[String: AnyObject]] {
                    
                    var movies = [Movie]()
                    for resultDictionary in resultsArray {
                        
                        if let movie = Movie(jsonDictionary: resultDictionary) {
                            movies.append(movie)
                        }
                    }
                    
                    completion(movies: movies)
                    
                } else {
                    completion(movies: [])
                }
            })
        } else {
            completion(movies: [])
        }
    }
}
