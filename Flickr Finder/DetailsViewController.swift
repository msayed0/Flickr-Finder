//
//  DetailsViewController.swift
//  Flicker
//
//  Created by Mohamed Sayed on 05/10/16.
//  Copyright © 2016 Mohamed Sayed. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoOwnerLabel: UILabel!
    @IBOutlet weak var photoLocationLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    var selectedPhoto : PhotoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedPhoto?.title
        detailsTextView.text = selectedPhoto?.desc
        photoOwnerLabel.text = selectedPhoto?.owner
        photoLocationLabel.text = selectedPhoto?.location
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        imageView.af_setImage(withURL: (selectedPhoto?.photoUrl)!, placeholderImage: UIImage.init(named: "PlaceHolder"))
    }
}
