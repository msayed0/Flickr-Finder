//
//  PhotoCellTableViewCell.swift
//  Flicker
//
//  Created by Mohamed Sayed on 05/10/16.
//  Copyright © 2016 Mohamed Sayed. All rights reserved.
//

import UIKit

class PhotoCellTableViewCell: UITableViewCell {
    @IBOutlet weak var photoThumbNail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func didScroll(tableView: UITableView, superView: UIView)
    {
        let rectInSuperView: CGRect = tableView.convert(self.frame, to: superView);
        let distanceFromCenter = superView.frame.height/2 - rectInSuperView.minY;
        let difference = self.photoThumbNail.frame.height - self.frame.height;
        let move = (distanceFromCenter / superView.frame.height) * difference;
        
        var imageRect = self.photoThumbNail.frame;
        imageRect.origin.y = -(difference / 2) + move;
        self.photoThumbNail.frame = imageRect;
    }
    
}
