//
//  TableViewCell.swift
//  InfiniteScroll
//
//  Created by Taylor Chavez on 4/9/20.
//  Copyright © 2020 Taylor Chavez. All rights reserved.
//

import UIKit

class InfinteCell: UITableViewCell {

    @IBOutlet weak var cellAlbumImage: UIImageView!
    var id:Int!
    func setImage(imgId:Int,img:UIImage){
        if(self.id == imgId){
            cellAlbumImage.image = img
        }
    }
}
