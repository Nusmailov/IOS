//
//  PostTableViewCell.swift
//  VKapp
//
//  Created by Nurzhigit Smailov on 2/4/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var cntLikes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var cntComment: UILabel!
    
    @IBOutlet weak var cntView: UILabel!
    
    func configureCell(groupName: String,  mainText:  String,
                       cntLikes: Int, mainImage: UIImage,
                       cntComments: Int, cntViews: Int){
        self.groupName.text = groupName
        self.mainText.text = mainText
        self.imgView?.image = mainImage
        
        self.cntLikes.text = String(cntLikes)
        self.cntComment.text = String(cntComments)
        self.cntView.text = String(cntViews)
    }
    
    func configureCell(groupName: String,  mainText:  String,cntLikes: Int){
        self.groupName.text = groupName
        self.mainText.text = mainText
        self.cntLikes.text = String(cntLikes)
    }

}
