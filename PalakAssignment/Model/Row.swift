

import Foundation


class Row : NSObject, NSCoding{

	var descriptionField : String!
	var imageHref : String!
	var title : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		descriptionField = dictionary["description"] as? String
		imageHref = dictionary["imageHref"] as? String
		title = dictionary["title"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if imageHref != nil{
			dictionary["imageHref"] = imageHref
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
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         imageHref = aDecoder.decodeObject(forKey: "imageHref") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if imageHref != nil{
			aCoder.encode(imageHref, forKey: "imageHref")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}

	}

}
