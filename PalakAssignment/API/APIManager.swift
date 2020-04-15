//
//  APIManager.swift
//  PalakAssignment
//
//  Created by Palak jain on 01/04/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import Foundation
import UIKit

class APIManager {
  
  static let instance = APIManager()
  
  enum RequestMethod {
    case get
  }
  //MARK: API calling
  func makeGetCall(WSUrl:String,WSCompletionBlock:@escaping (_ data:AnyObject?,_ error:NSError?) -> ()){
    
    let newurl = WSUrl
    guard let url = URL(string: newurl) else {
      print("Error")
      return
    }
    let urlRequest = URLRequest(url: url)
    
    // set up the session
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    
    // make the request
    let task = session.dataTask(with: urlRequest) {
      (data, response, error) in
      // check for any errors
      guard error == nil else {
        print("error when calling GET request")
        print(error!)
        WSCompletionBlock(nil,error as NSError?)
        return
      }
      guard let responseData = data else {
        print("Error: did not receive data")
        WSCompletionBlock(data as AnyObject?,nil)
        return
      }
      let strISOLatin = String(data: responseData, encoding: .isoLatin1)
      let dataUTF8 = strISOLatin?.data(using: .utf8)
      var dict: Any? = nil
      do {
        if let dataUTF8 = dataUTF8 {
          dict = try JSONSerialization.jsonObject(with: dataUTF8, options: [])
        }
      } catch {
        print("error trying to convert data to JSON")
        return
      }
      if dict != nil {
        if let dict = dict {
          WSCompletionBlock(dict as AnyObject,nil)
          
        }
      } else {
        if let error = error {
          print("Error: \(error)")
        }
      }
    }
    task.resume()
    
  }
  
  //MARK: This function will download the image from the url.
  func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleToFill, img: UIImageView) {
    img.contentMode = mode
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      if  let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
        let data = data, error == nil,
        let image = UIImage(data: data)
      {
        DispatchQueue.main.async() {
          img.image = image
          
        }
      }
      else {
        DispatchQueue.main.async() {
          img.image =  UIImage(named: Constants.ImageName.placeholder) }
      }
      
    }.resume()
  }
}




