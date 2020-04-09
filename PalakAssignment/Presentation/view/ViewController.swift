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
  private let refreshControl = UIRefreshControl()
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
    view.addSubview(tblview)
    tblview.refreshControl = refreshControl
    tblview.separatorColor = UIColor.clear
    tblview.register(ListviewCell.self, forCellReuseIdentifier: "cell")
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
  
}


extension ViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return presenter.rootClass.rows.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListviewCell
    let obj = presenter.rootClass.rows[indexPath.row]
    cell.selectionStyle = .none
    cell.lblTitle.text = obj.title
    cell.lblDescription.text = obj.descriptionField
    if obj.imageHref != nil{
      let url = URL(string: obj.imageHref)!
      cell.img.downloaded(from: url)
    }
    return cell
  }
  
  
}
extension UIImageView {
  func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) { 
    contentMode = mode
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard
        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
        let data = data, error == nil,
        let image = UIImage(data: data)
        else { return }
      DispatchQueue.main.async() {
        self.image = image
      }
    }.resume()
  }
}

extension ViewController: ListView {
  func startLoading() {
    activityIndicator.startAnimating()
  }
  
  func finishLoading() {
    self.title = presenter.rootClass.title
    self.refreshControl.endRefreshing()
    self.tblview.reloadData()
    activityIndicator.stopAnimating()
  }
  
  func setEmptyPeople() {
    tblview.isHidden = true
  }
  func stopIndicator(){
    self.refreshControl.endRefreshing()
    activityIndicator.stopAnimating()
    
  }
}

