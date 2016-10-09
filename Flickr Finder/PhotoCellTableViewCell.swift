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
        self.photoThumbNail.clipsToBounds = true
    }
    
    func didScroll(tableView: UITableView, superView: UIView)
    {
        let offsetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [PhotoCellTableViewCell] {
            let x = cell.photoThumbNail.frame.origin.x
            let w = cell.photoThumbNail.bounds.width
            let h = cell.photoThumbNail.bounds.height
            let y = ((offsetY - cell.frame.origin.y) / h) * 10
            cell.photoThumbNail.frame = CGRect.init(x: x, y: y, width: w, height: h)
        }
    }
    
}
