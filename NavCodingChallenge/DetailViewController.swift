//
//  DetailViewController.swift
//  NavCodingChallenge
//
//  Created by Cameron Moss on 5/5/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -self.view.frame.width, 0, 0)
        synopsisLabel.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -self.view.frame.width, 0, 0)
        ratingLabel.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -self.view.frame.width, 0, 0)


        // Do any additional setup after loading the view.
        if let movie = movie {
            updateWith(movie)
            
            UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .CurveEaseOut, animations: {
                self.titleLabel.layer.transform = CATransform3DIdentity
                }, completion: nil)
            
            UIView.animateWithDuration(0.8, delay: 0.15, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .CurveEaseOut, animations: {
                self.synopsisLabel.layer.transform = CATransform3DIdentity
                }, completion: nil)
            
            UIView.animateWithDuration(0.8, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .CurveEaseOut, animations: {
                self.ratingLabel.layer.transform = CATransform3DIdentity
                }, completion: nil)

        }
    
    }

    
    func updateWith(movie: Movie) {
        titleLabel.text = movie.title
        synopsisLabel.text = "Synopsis: \n" + movie.overview
        ratingLabel.text = "Popularity: \(movie.popularity)"
    }

}
