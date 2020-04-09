//
//  ViewController.swift
//  InfiniteScroll
//
//  Created by Taylor Chavez on 4/9/20.
//  Copyright © 2020 Taylor Chavez. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    var imgHelper = ImageHandler()
    var cache = ImageCache()
    var albumList:[Album] = []{
        didSet{
            infiniteTable.reloadData()
        }
    }
    @IBOutlet weak var infiniteTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupJSON()
    }

    func setupJSON(){
        if let path = Bundle.main.path(forResource: "albums", ofType: "json") {
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let albList = try JSONDecoder().decode([Album].self, from: data)
                self.albumList = albList
            }catch{
                print(error.localizedDescription)
            }
        }
    }

}

extension LoadingViewController: UITableViewDelegate{

}

extension LoadingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("read \(albumList.count) albums")
        return albumList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellAlbum = albumList[indexPath.row]
        let cell = infiniteTable.dequeueReusableCell(withIdentifier: "InfinteCell") as! InfinteCell
        cell.id = cellAlbum.id
        cell.backgroundColor = .blue
        if let jsonImg = cache.getImageById(cellAlbum.id){
            cell.setImage(imgId: cellAlbum.id, img: jsonImg)
        }else{
            imgHelper.getImage(cellAlbum.url) { [weak self] (resImg) in
                guard let newImg = resImg else{
                    print("hmm image url failed")
                    return()
                }
                self?.cache.addIdImagePair(id: cellAlbum.id, img: newImg)
                cell.setImage(imgId: cellAlbum.id, img: newImg)
            }
        }
        return cell
    }


}
