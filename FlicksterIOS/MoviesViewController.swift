//
//  MoviesViewController.swift
//  Flickster
//
//  Created by Henry Lao on 2/18/21.
//
import UIKit

class MoviesViewController: UIViewController
                            , UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count;
    }
    @IBOutlet weak var moviesTableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell =
//            tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
//        let movie = movies[indexPath.row]
//        let title = movie["title"] as! String
//        let overview = movie["overview"] as! String
//
//        cell.titleLabel.text = title
//        cell.overviewLabel.text = overview
//
//        let baseUrl = ""
//        let posterPath = movie["poster_path"] as! String
//        let posterUrl = URL(string: baseUrl + posterPath)
        let cell = UITableViewCell()
        let movie = movies[indexPath.row]
        let title = movie["title"]
        cell.textLabel?.text = title as! String
        return cell
    }

    func tableView (_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
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
                print(dataDictionary)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
