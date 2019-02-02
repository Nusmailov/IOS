//
//  ViewController.swift
//  JsonParsing
//
//  Created by Nurzhigit Smailov on 2/1/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import Dispatch

class PostsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var table: UITableView!
    private var informations = [Post]()
    private var informationsAlamo = [Post]()
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView = UIActivityIndicatorView(style: .gray)
        table.backgroundView = activityIndicatorView
        loadAlamofire()
        activityIndicator.stopAnimating()
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
    func loadAlamofire(){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
            if let json = response.result.value {
                //print("JSON: \(json)") // serialized json response
            }
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
                do{
                    let jsonAlamo = try JSONDecoder().decode([Post].self, from: data)
                    self.informationsAlamo = jsonAlamo
                    self.table.reloadData()
                    //print("Data Size \(self.informationsAlamo.count)")
                }catch let error{
                    print("Error\n", error)
                }
            }
           // print(self.informationsAlamo[0])
        }
    }
    
    func downloadJson(){
        let jsonUrl = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: jsonUrl) else{return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            // let dataString = String(data: data, encoding: .utf8)
            do{
                let jsonPlaceHolders = try JSONDecoder().decode([Post].self, from: data)
                self.informations = jsonPlaceHolders
                //print(self.informations[0])
                //print(self.informations)
                self.table.reloadData()
                
            }catch let error{
               print("Error\n",error)
            }
            }.resume()
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //return self.informations.countze
        return self.informationsAlamo.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "JsonCell", for: indexPath)
        //cell.textLabel?.text = self.informations[0].title
        cell.textLabel?.text = informationsAlamo[indexPath.row].title
        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (informationsAlamo == nil) {
            activityIndicatorView.startAnimating()
            table.separatorStyle = .none
            DispatchQueue.main.async {
                Thread.sleep(forTimeInterval: 3)
                OperationQueue.main.addOperation() {
                    
                    self.activityIndicatorView.stopAnimating()
                    self.table.separatorStyle = .singleLine
                    self.table.reloadData()
                }
            }
        }
    }
 

}

