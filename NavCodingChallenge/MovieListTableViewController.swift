//
//  MovieListTableViewController.swift
//  NavCodingChallenge
//
//  Created by Cameron Moss on 5/5/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {
    
    var searchResultMovies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
        navigationController?.navigationBar.barTintColor = UIColor.grayColor()
        navigationController?.navigationBar.barStyle = UIBarStyle.Black
        navigationController?.navigationBar.tintColor = UIColor.blackColor()
        

    }
    
    // MARK: - Search Bar Delegate Methods
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        let searchTerm = searchBar.text ?? ""
        
        MovieController.getMoviesWithSearchTerm(searchTerm) { (movies) -> Void in
            self.searchResultMovies = movies
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
            
        }
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return searchResultMovies.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath)
        cell.textLabel!.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -self.view.frame.width, 0, 0)
        let movie = searchResultMovies[indexPath.row]
        
        cell.textLabel?.text = movie.title
        cell.contentView.layer.cornerRadius = 15
        cell.layer.cornerRadius = 15
        cell.contentView.layer.borderColor = UIColor.blackColor().CGColor
        cell.contentView.layer.borderWidth = 2
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .CurveEaseOut, animations: {
            cell.textLabel!.layer.transform = CATransform3DIdentity
            }, completion: nil)
        
        return cell
    }
    
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = searchResultMovies.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.9
        return UIColor(red: 0.1, green: 0.9, blue: color, alpha: 1.0)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
                            forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailSegue" {
            let detailViewController = segue.destinationViewController as! DetailViewController
            if let cell = sender as? UITableViewCell, indexPath = tableView.indexPathForCell(cell) {
                let movie = searchResultMovies[indexPath.row]
                detailViewController.movie = movie
            }
        }
    }
    

}
