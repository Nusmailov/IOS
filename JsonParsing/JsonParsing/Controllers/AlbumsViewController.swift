//
//  AlbumsViewController.swift
//  JsonParsing
//
//  Created by Nurzhigit Smailov on 2/1/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import Dispatch

class AlbumsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    private var informations = [Album]()
    private var informationsAlamo = [Album]()
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // loadAlamofire()
        
    }
    
    func loadAlamofire(){
        Alamofire.request("https://jsonplaceholder.typicode.com/albums").responseJSON { response in
            if let data = response.data, let _ = String(data: data, encoding: .utf8) {
                do{
                    let jsonAlamo = try JSONDecoder().decode([Album].self, from: data)
                    self.informationsAlamo = jsonAlamo
                    self.table.reloadData()
                    print("Data Size \(self.informationsAlamo.count) Albums One")
                }catch let error{
                    print("Error\n", error)
                }
            }
            print(self.informationsAlamo[0].title)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath)
        //cell.textLabel? .text = self.informations[0].title
       
       // cell.textLabel?.text = informationsAlamo[indexPath.row].title
        return cell
    }
    
}
