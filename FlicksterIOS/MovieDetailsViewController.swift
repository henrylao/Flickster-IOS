//
//  MovieDetailsViewController.swift
//  FlicksterIOS
//
//  Created by Henry Lao on 2/26/21.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var ivBackdrop: UIImageView!
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var tvOverview: UILabel!
    @IBOutlet weak var tvTitle: UILabel!
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(movie["title"] as Any) // DEBUG
        
        
        // Do any additional setup after loading the view.
        tvTitle.text = movie["title"] as? String
        tvTitle.sizeToFit() // grow label to support size of the current text
        
        tvOverview.text = movie["overview"] as? String
        tvOverview.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185" // how to better manage the url path extensions?
        
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string:  "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        ivPoster.af_setImage(withURL: posterUrl!)
        ivBackdrop.af_setImage(withURL: backdropUrl!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
