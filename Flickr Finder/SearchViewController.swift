//
//  ViewController.swift
//  Flickr Finder
//
//  Created by Mohamed Sayed on 07/10/16.
//  Copyright © 2016 Mohamed Sayed. All rights reserved.
//

import UIKit
import AlamofireImage
import SVProgressHUD

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var infoLabel: UILabel!
    
    //Variables
    var resultPhotos = [PhotoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.createTheNavigationBarIcon()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: -Class Functions
    
    func createTheNavigationBarIcon() -> Void {
        let button = UIButton.init(type: .custom)
        button.isUserInteractionEnabled = false
        button.setImage(UIImage.init(named: "flickr-icon"), for: UIControlState.normal)
        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    func filterContentForSearchText(searchText: String) {
        
        SVProgressHUD.show()
        
        PhotoGettingWrapper.searchPhotosWithTextFromNetwork(searchText: searchText, withCompletion:{searchedPhotos in
            if (searchedPhotos.count <= 0 && NetworkModel.sharedInstance.isOffline()) {
                
                SVProgressHUD.showError(withStatus:"connectionOfflineMessage".localizedWithComment(comment: "Offline Connection Message"))
            }
            else {
                self.reloadTableViewWithPhotos(photos: searchedPhotos)
            }
        })
    }
    
    func reloadTableViewWithPhotos(photos: [PhotoModel]) {
        DispatchQueue.main.sync(execute: { () -> Void in
            self.resultPhotos = photos
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
        })
    }
    // MARK: -UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultPhotos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:PhotoCellTableViewCell = self.tableView.dequeueReusableCell(withIdentifier:"DefaultCell") as! PhotoCellTableViewCell
        
        let currentPhoto: PhotoModel = resultPhotos[indexPath.row]
        
        cell.titleLabel.text = currentPhoto.title
        
        cell.photoThumbNail!.clipsToBounds = true
        cell.photoThumbNail!.af_setImage(withURL: currentPhoto.photoUrl, placeholderImage: UIImage.init(named: "flickr-icon"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0;
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleCells = tableView.visibleCells
        
        for item in visibleCells
        {
            let cell = item as! PhotoCellTableViewCell
            cell.didScroll(tableView: tableView, superView: self.view)
        }
    }
    
    // MARK: -UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filterContentForSearchText(searchText: searchBar.text!)
        self.searchBar.endEditing(true)
        self.infoLabel.isHidden = true
        self.tableView.isHidden = false
    }
}



