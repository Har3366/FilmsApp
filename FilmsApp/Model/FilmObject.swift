//
//  FilmObject.swift
//  FilmsApp
//
//  Created by Игорь on 13.02.2022.
//

import Foundation
import RealmSwift

class FilmObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var filmPic:String = ""
    @objc dynamic var filmTitle:String = ""
    @objc dynamic var filmYear:Int = 0
    @objc dynamic var filmRating:Double = 0
    @objc dynamic var isLiked:Bool = false
    @objc dynamic var backdrop_path:String = ""
    @objc dynamic var overview:String = ""
    dynamic var screenshots: List<String> = List<String>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}


