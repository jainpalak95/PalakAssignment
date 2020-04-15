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
  var backView = UIView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(backView)
    backView.addSubview(img)
    backView.addSubview(lblTitle)
    backView.addSubview(lblDescription)
    setBackView()
    setImageConstraint()
    setTitleConstraint()
    setDescriptionConstraint()
    addCorner()
    
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func setBackView(){
    let marginGuide = contentView.layoutMarginsGuide
    backView.translatesAutoresizingMaskIntoConstraints = false
    backView.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 8).isActive = true
    backView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -8).isActive = true
    backView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 8).isActive = true
    backView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -8).isActive = true
  }
  func setImageConstraint(){
    img.translatesAutoresizingMaskIntoConstraints = false
    img.heightAnchor.constraint(equalToConstant: 100).isActive = true
    img.widthAnchor.constraint(equalToConstant: 100).isActive = true
    img.topAnchor.constraint(equalTo: backView.topAnchor, constant: 8).isActive = true
    img.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: 8).isActive = true
    self.img.image = UIImage(named: Constants.ImageName.placeholder)
    self.img.backgroundColor = UIColor.lightGray
    img.layer.cornerRadius = 50
    img.clipsToBounds = true
    
  }
  
  func setTitleConstraint(){
    lblTitle.translatesAutoresizingMaskIntoConstraints = false
    lblTitle.numberOfLines = 0
    lblTitle.font = UIFont(name: Constants.Font.avenirBold, size: 16)
    lblTitle.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 15).isActive = true
    lblTitle.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8).isActive = true
    lblTitle.topAnchor.constraint(equalTo: backView.topAnchor, constant: 8).isActive = true
    
  }
  
  func setDescriptionConstraint(){
    lblDescription.translatesAutoresizingMaskIntoConstraints = false
    lblDescription.numberOfLines = 0
    lblDescription.font = UIFont(name: Constants.Font.avenirBook, size: 12)
    lblDescription.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 15).isActive = true
    lblDescription.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 15).isActive = true
    lblDescription.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8).isActive = true
    lblDescription.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -8).isActive = true
    lblDescription.heightAnchor.constraint(greaterThanOrEqualToConstant: 65).isActive = true
    lblDescription.sizeToFit()
    
  }
  
  
  func addCorner(){
    
    backView.layer.cornerRadius = 15
    backView.clipsToBounds = true
    backView.layer.borderColor = UIColor.lightGray.cgColor
    backView.layer.borderWidth = 0.5
  }
  override func layoutSubviews() {
    
    contentView.backgroundColor = UIColor.clear
    backgroundColor = UIColor.clear
  }
  
}
