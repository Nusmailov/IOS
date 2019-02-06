//
//  ViewController.swift
//  VKapp
//
//  Created by Nurzhigit Smailov on 2/2/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import SwiftyVK
import Alamofire


class PostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    private var informationsAlamo:PostVK!
    var size = 0
    var page = 20
    let totalPage = 200
    var items = [Item]()
    var attachments = [Attachment]()
    @IBOutlet weak var table: UITableView!
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    override func viewDidLoad() {
        table.dataSource = self
        table.delegate = self
        table.tableFooterView = UIView(frame: .zero)
        super.viewDidLoad()
        
        
        activityCycle()
        loadAlamofire()
        self.table.dataSource = self
        
//        refresh(self)
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
        Alamofire.request("https://api.vk.com/method/wall.get?v=5.92&owner_id=-1&count=\(self.page)&access_token=3562058f3562058f3562058f28350a7de4335623562058f693a49aa6f5092d34061ad45").responseJSON { response in
            if let data = response.data, let _ = String(data: data, encoding: .utf8) {
                do{
                    let jsonAlamo = try JSONDecoder().decode(PostVK.self, from: data)
                    self.informationsAlamo = jsonAlamo
                    self.table.reloadData()
                    self.items = self.informationsAlamo.response.items!
                    if self.page <= 10{
                        self.table.reloadData()
                    }
                    
                }catch let error{
                    print("Error\n", error)
                }
                
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == items.count - 1 {
            let index = items.count
            if items.count < self.totalPage{
//                while self.page < self.totalPage{
//                    items.append(self.index)
//                    self.index = index + 1
//                }
            }
            self.page = index + 20
        }
        self.perform(#selector(loadTable), with: nil, afterDelay: 0.5)
    }
    @objc func loadTable(){
        self.table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(items.count)
        if items.count != 0 {
            activityIndicator.stopAnimating()
        }
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let name = String(indexPath.row) + String(items[indexPath.row].ownerID)
        let text = items[indexPath.row].text
        let att: Attachment? = self.items[indexPath.row].attachments?[0]
        let cntComments = items[indexPath.row].comments?.count
        let cntViews  = items[indexPath.row].views?.count
        let cntLikes = items[indexPath.row].likes.count
        var img = UIImage(named: "iconfinder_Like_984762")
        if  att?.photo?.sizes[0].url != nil{
            if let url_image = URL(string: (att?.photo?.sizes[1].url)!){
                if let ui_data = try? Data(contentsOf: url_image){
                    img = UIImage(data: ui_data)!
                }
            }
        }
       
        if let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as? PostTableViewCell{
            cell.configureCell(groupName: name, mainText: text,
                               cntLikes: cntLikes, mainImage: img!,
                               cntComments: cntComments ?? 0, cntViews: cntViews ?? 0)
            tableView.rowHeight = 340
            return cell
        }
        
        // cell.imageView?.image = items[indexPath.row].attachments[0]
        return PostTableViewCell()
    }
}


extension UITableView {
    func reloadDataAfterDelay(delayTime: TimeInterval = 0.5) -> Void {
        self.perform(#selector(self.reloadData), with: nil, afterDelay: delayTime)
    }
}
