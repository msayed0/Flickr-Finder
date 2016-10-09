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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
