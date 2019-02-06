//
//  ViewController.swift
//  VKapp
//
//  Created by Nurzhigit Smailov on 2/2/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import SwiftyVK


class PostViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func vkWillAuthorize() -> Set<VK.Scope> {
        //Called when SwiftyVK need authorization permissions.
        return //an set of application permissions
    }

}

