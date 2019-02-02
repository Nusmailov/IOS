//
//  CommentsViewController.swift
//  JsonParsing
//
//  Created by Nurzhigit Smailov on 2/1/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import Dispatch

class CommentsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
   
    
    private var informations = [Comment]()
    private var informationsAlamo = [Comment]()
    @IBOutlet weak var table: UITableView!
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityCycle();
        loadAlamofire()
        activityIndicator.stopAnimating()
    }
    
    func loadAlamofire(){
        Alamofire.request("https://jsonplaceholder.typicode.com/comments").responseJSON { response in
            if let data = response.data, let _ = String(data: data, encoding: .utf8) {
                do{
                    let jsonAlamo = try JSONDecoder().decode([Comment].self, from: data)
                    self.informationsAlamo = jsonAlamo
                    self.table.reloadData()
                    //print("Data Size \(self.informationsAlamo.count)")
                }catch let error{
                    print("Error\n", error)
                }
            }
//            print(self.informationsAlamo[0])
        }
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informationsAlamo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath)
        //cell.textLabel?.text = self.informations[0].title
        cell.textLabel?.text = informationsAlamo[indexPath.row].email
        return cell
    }
    func activityCycle(){
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        
        // Position it at the center of the ViewController.
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        activityIndicator.startAnimating()
        
    }
}
