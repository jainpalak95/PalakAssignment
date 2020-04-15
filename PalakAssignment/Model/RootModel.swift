

import Foundation


class RootModel : NSObject{

	var rows : [Row]!
	var title : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		rows = [Row]()
		if let rowsArray = dictionary["rows"] as? [[String:Any]]{
			for dic in rowsArray{
				let value = Row(fromDictionary: dic)
        if (value.descriptionField == nil && value.title == nil && value.imageHref == nil){
      
        }
        else{
        rows.append(value)
        }
			}
		}
		title = dictionary["title"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if rows != nil{
			var dictionaryElements = [[String:Any]]()
			for rowsElement in rows {
				dictionaryElements.append(rowsElement.toDictionary())
			}
			dictionary["rows"] = dictionaryElements
		}
		if title != nil{
			dictionary["title"] = title
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         rows = aDecoder.decodeObject(forKey :"rows") as? [Row]
         title = aDecoder.decodeObject(forKey: "title") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if rows != nil{
			aCoder.encode(rows, forKey: "rows")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}

	}

}
