//
//  NetworkController.swift
//  NavCodingChallenge
//
//  Created by Cameron Moss on 5/5/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//

import Foundation


class NetworkController {
    
    static func dataAtURL(url: NSURL, completion: (data: NSData?) -> Void) {
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            if error != nil {
                //error exists
                print("Error in \(#function) - \(error!.localizedDescription)")
                completion(data: nil)
            } else {
                
                completion(data: data)
                
            }
        }
        
        dataTask.resume()
    }
    
}
