//
//  ViewControllerExtension.swift
//  PalakAssignment
//
//  Created by Palak jain on 11/04/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import Foundation
import UIKit


extension ViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return presenter.rootClass.rows.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TblCellStr.cell, for: indexPath) as! ListviewCell
    if presenter.rootClass.rows.count > 0{
      let obj = presenter.rootClass.rows[indexPath.row]
      cell.selectionStyle = .none
      cell.lblTitle.text = obj.title
      cell.lblDescription.text = obj.descriptionField
      if obj.imageHref != nil{
        let url = URL(string: obj.imageHref)!
       APIManager().downloaded(from: url, contentMode: .scaleToFill, img: cell.img)
      }
    }
    return cell
  }
}
  
  



extension ViewController: ListView {
 
  func finishLoading() {
    self.title = presenter.rootClass.title
    self.refreshControl.endRefreshing()
    self.tblview.reloadData()
  }
  
  func setEmptyPeople() {
    tblview.isHidden = true
  }
  func stopIndicator(){
    DispatchQueue.main.async {
    self.refreshControl.endRefreshing()
    self.refreshControl.isHidden = true
    
    }
 
    
  }
  func internetAlert(){
    let alert = UIAlertController(title: Constants.Alert.internetAlertTitle, message: Constants.Alert.internetAlertDesc, preferredStyle: .alert)
    let okAction = UIAlertAction(title: Constants.Alert.ok, style: .default) {
           UIAlertAction in
    DispatchQueue.main.async {
    self.stopIndicator()
    }
    }
    alert.addAction(okAction)
    self.present(alert, animated: true)
    
  }
}

