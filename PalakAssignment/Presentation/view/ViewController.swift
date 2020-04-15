//
//  ListViewController.swift
//  PalakAssignment
//
//  Created by Palak jain on 07/04/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  //MARK: IBOutlets
  var tblview = UITableView()
  let presenter = ViewControllerPresenter(apiManager: APIManager())
  let refreshControl = UIRefreshControl()
  var activityIndicator = UIActivityIndicatorView()
  
  
  //MARK: App lifeCycle function
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setTableView()
    presenter.listView = self
    presenter.fetchDataFromAPI()
  }
  
  func setTableView(){
    
    tblview.backgroundColor = UIColor.clear
    tblview.dataSource = self
    view.backgroundColor = UIColor.white
    view.addSubview(tblview)
    tblview.refreshControl = refreshControl
    tblview.separatorColor = UIColor.clear
    tblview.register(ListviewCell.self, forCellReuseIdentifier: Constants.TblCellStr.cell)
    tblview.translatesAutoresizingMaskIntoConstraints = false
    tblview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tblview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tblview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tblview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tblview.tableFooterView = UIView()
    tblview.estimatedRowHeight = 200
    tblview.rowHeight = UITableView.automaticDimension
    refreshControl.addTarget(self, action: #selector(refreshAPIData(_:)), for: .valueChanged)
    
  }
  @objc private func refreshAPIData(_ sender: Any) {
    presenter.fetchDataFromAPI()
    
  }
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
   
    self.view.layoutIfNeeded()
    tblview.reloadData()

    
  }
  
}


