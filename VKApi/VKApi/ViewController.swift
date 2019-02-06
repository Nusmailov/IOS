//
//  ViewController.swift
//  VKApi
//
//  Created by Nurzhigit Smailov on 2/5/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
   
    
    private var informationsAlamo = [PostVK]()
    let VKapi = "https://api.vk.com/method/wall.get?v=5.92&owner_id=-1&access_token=3562058f3562058f3562058f28350a7de4335623562058f693a49aa6f5092d34061ad45"
    @IBOutlet weak var table: UITableView!
    var size = 0
    var itemText = [String]()
    var json = JSON()
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
       // loadJson()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        //guard let text = self.json["response"]["items"][indexPath.row]["text"] as? String else { return }
        Alamofire.request(VKapi, method: .get).validate().responseJSON{
            response in
            switch response.result{
            case .success(let value):
                self.json = JSON(value)
                if let text = self.json["response"]["items"][indexPath.row]["text"].string{
                     cell.textLabel?.text = text
                }
                cell.imageView?.image = self.json["response"]["items"][indexPath.row]["attachments"][0]["photo"]["sizes"][0]
                print(self.json["response"]["items"])
            case .failure(let error):
                print(error)
            }
        }
       // cell.textLabel?.text = "view \(indexPath.row)"
        return cell
    }
    func loadJson(){
        Alamofire.request(VKapi, method: .get).validate().responseJSON{
            response in
            switch response.result{
            case .success(let value):
                    self.json = JSON(value)
                //     self.items = value["response"]["items"] as? [Item]
                //    for text in  self.json["response"]["items"]
                    
                  //  print(self.json["response"]["items"])
            case .failure(let error):
                    print(error)
                
            }
        }
    }
}

