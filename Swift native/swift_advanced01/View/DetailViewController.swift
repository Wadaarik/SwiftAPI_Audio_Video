//
//  DetailViewController.swift
//  swift_advanced01
//
//  Created by BOUDIER Nicolas on 20/06/2022.
//

import Foundation
import UIKit
import Kingfisher

class DetailViewController: UIViewController{
    
    
    @IBOutlet weak var recieveDatas: UILabel!
    @IBOutlet weak var receiveImage: UIImageView!
    
    var countFromView: Int?
    var nameImage: String?
    var profil: ContactModel.Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let profil = profil {
            let url = URL(string: profil.picture.large)
            
            recieveDatas.text = profil.name.first
            receiveImage.kf.setImage(with: url)
        }
        
        title = "Detail View Controller"
    }
}
