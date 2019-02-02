//
//  ViewController.swift
//  jsonplaceHolder
//
//  Created by Nurzhigit Smailov on 2/1/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        downloadJson()
    }
    
    var informations = [JsonPlaceHolderElement]()
    func downloadJson(){
        let jsonUrl = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: jsonUrl) else{return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            // let dataString = String(data: data, encoding: .utf8)
            
            do{
                let jsonPlaceHolders = try JSONDecoder().decode([JsonPlaceHolderElement].self, from: data)
                self.informations = jsonPlaceHolders
            }catch let error{
                print("Error\n",error)
            }
            }.resume()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return informations.count
    }
    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//
//    }

}

