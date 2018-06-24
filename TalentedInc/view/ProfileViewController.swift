//
//  ProfileViewController.swift
//  TalentedInc
//
//  Created by Admin on 6/13/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileViewController: UITableViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet var interestsCollectionView: UICollectionView!
    
     @IBOutlet var profileTableView: UITableView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "interestCell", for: indexPath)
        
        return cell
    }
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
