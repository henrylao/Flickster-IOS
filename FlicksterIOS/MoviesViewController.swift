//
//  MoviesViewController.swift
//  Flickster
//
//  Created by Henry Lao on 2/18/21.
//
import UIKit
import AlamofireImage

class MoviesViewController: UIViewController
                            , UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var moviesTableView: UITableView!
    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("Before request")
//
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
//
        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
            if let error = error {
              print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                print(dataDictionary)
                self.movies = dataDictionary["results"] as! [[String:Any]]
                self.moviesTableView.reloadData()
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()
        print("After request")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier:
                                            "MovieTableViewCell") as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
      
        let title = movie["title"]
        let overview = movie["overview"]

        cell.titleLabel.text = title as? String
        cell.overviewLabel.text = overview as? String
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.ivPoster.af.setImage(withURL: posterUrl!)
//        cell.textLabel?.text = title as! String
        return cell
    }

    func tableView (_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // Operates simularly to Android's passing of data via intents
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("")
        // Find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = moviesTableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        // Pass the selected movie to the details view controller
        let detailsViewController = segue.destination as! MovieDetailsViewController // access destination controller
        detailsViewController.movie = movie // assign controller member attr to movie to be passed
    }

}
