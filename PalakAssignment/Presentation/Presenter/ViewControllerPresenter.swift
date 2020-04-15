//
//  ViewControllerPresenter.swift
//  PalakAssignment
//
//  Created by Palak jain on 09/04/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import UIKit


protocol ListView: NSObjectProtocol {
  func startLoading()
  func finishLoading()
  func stopIndicator()
  func setEmptyPeople()
  func internetAlert()
}


class ViewControllerPresenter {
  
  private let apiManager:APIManager
  weak var listView : ListView?
  var rootClass = RootModel(fromDictionary: NSDictionary() as! [String : Any])
  
  init(apiManager:APIManager) {
    self.apiManager = apiManager
  }
  
  func fetchDataFromAPI(){
    
    self.listView?.startLoading()
    
    if NetworkManager().isConnectedToNetwork() == true{
      APIManager().makeGetCall(WSUrl: API_BASE_URL +  Constants.EndURL.facts) { (response, error) in
        self.rootClass = RootModel(fromDictionary: response as! [String : Any])
        if self.rootClass.rows.count == 0{
          self.listView?.setEmptyPeople()
        }
        else{
          DispatchQueue.main.async {
            self.listView?.finishLoading()
           
          }
          
        }
      }
    }
    else{
      listView?.stopIndicator()
      listView?.internetAlert()
      print("No internet")
      
    }
    
  }
}
