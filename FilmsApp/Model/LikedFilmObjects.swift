//
//  LikedFilmObjects.swift
//  FilmsApp
//
//  Created by Игорь on 28.02.2022.
//

import Foundation
import RealmSwift

class LikedFilmObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var filmPic:String = ""
    @objc dynamic var filmTitle:String = ""
    @objc dynamic var filmYear:Int = 0
    @objc dynamic var filmRating:Double = 0
    @objc dynamic var isLiked:Bool = true
    @objc dynamic var backdrop_path:String = ""
    @objc dynamic var overview:String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
