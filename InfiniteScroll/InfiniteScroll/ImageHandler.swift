//
//  ImageHandler.swift
//  InfiniteScroll
//
//  Created by Taylor Chavez on 4/9/20.
//  Copyright © 2020 Taylor Chavez. All rights reserved.
//

import UIKit

class ImageHandler{
    func getImage(_ imageUrl:String, completion: @escaping (UIImage?) -> Void){
        guard let url:URL = URL(string: imageUrl) else{
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url){ (data,_,err) in
            if let error = err {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            if let myData = data {
                let image = UIImage(data: myData)
                DispatchQueue.main.async{
                    completion(image)
                }
                return
            }

        }.resume()
    }
}
