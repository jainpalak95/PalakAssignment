//
//  ListviewCell.swift
//  PalakAssignment
//
//  Created by Palak jain on 07/04/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import Foundation
import UIKit

class ListviewCell: UITableViewCell{
  
  var img = UIImageView()
  var lblTitle = UILabel()
  var lblDescription =  UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(img)
    contentView.addSubview(lblTitle)
    contentView.addSubview(lblDescription)
    setImageConstraint()
    setTitleConstraint()
    setDescriptionConstraint()
   
  }
 
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func setImageConstraint(){
    
    let marginGuide = contentView.layoutMarginsGuide
    img.translatesAutoresizingMaskIntoConstraints = false
    img.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 15).isActive = true
    img.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor,constant: 15).isActive = true
    img.heightAnchor.constraint(equalToConstant: 100).isActive = true
    img.widthAnchor.constraint(equalToConstant: 100).isActive = true
    self.img.image = UIImage(named: "placeholder")
    self.img.backgroundColor = UIColor.lightGray
    
  }
  
  func setTitleConstraint(){
     let marginGuide = contentView.layoutMarginsGuide
    lblTitle.translatesAutoresizingMaskIntoConstraints = false
    lblTitle.numberOfLines = 0
    lblTitle.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
    lblTitle.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 15).isActive = true
    lblTitle.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -15).isActive = true
    lblTitle.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 10).isActive = true
    
  }
  
  func setDescriptionConstraint(){
     let marginGuide = contentView.layoutMarginsGuide
    lblDescription.translatesAutoresizingMaskIntoConstraints = false
    lblDescription.numberOfLines = 0
    lblDescription.font = UIFont(name: "Avenir-Book", size: 12)
    lblDescription.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 15).isActive = true
    lblDescription.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -15).isActive = true
       lblDescription.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 15).isActive = true
    lblDescription.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -15).isActive = true
    
  }
  
  override func layoutSubviews() {
   
    contentView.backgroundColor = UIColor.clear
    backgroundColor = UIColor.clear
  }
  
}
