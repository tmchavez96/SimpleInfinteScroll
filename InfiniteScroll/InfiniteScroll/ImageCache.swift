//
//  ImageCache.swift
//  InfiniteScroll
//
//  Created by Taylor Chavez on 4/9/20.
//  Copyright © 2020 Taylor Chavez. All rights reserved.
//

import UIKit


class ImageCache {
    var cache:[Int:UIImage] = [:]
    func getImageById(_ id: Int) -> UIImage?{
        return cache[id]
    }

    func addIdImagePair(id:Int,img:UIImage) {
        cache[id] = img
    }
}
