//
//  JSONParsingService.swift
//  FilmsApp
//
//  Created by Игорь on 28.02.2022.
//

import Foundation
import RealmSwift

class JSONParsingService{
    func parseJSON(parseData: Data, parseError: Error?){
        do {
            let filmObject = try JSONDecoder().decode(MovieList.self, from: parseData)
            
            let jsonObjects = filmObject.results
            let realm = try? Realm()
            try realm?.write({
                for item in jsonObjects {
                    let object = FilmObject()
                    if let unwrID = item.id,
                       let unwrPosterPath = item.poster_path,
                       let unwrOriginalTitle = item.original_title,
                       let unwrOverview = item.overview,
                       let unwrReleaseDate = item.release_date,
                       let unwrVoteAverage = item.vote_average,
                       let unwrBackdropPath = item.backdrop_path {
                        object.id = unwrID
                        object.filmPic = unwrPosterPath
                        object.filmTitle = unwrOriginalTitle
                        object.overview = unwrOverview
                        object.filmYear = Int(unwrReleaseDate.prefix(4)) ?? 0000
                        object.filmRating = unwrVoteAverage
                        object.backdrop_path = unwrBackdropPath
                        object.isLiked = false
                    }
                    
                    
                    realm?.add(object,update: .all)  //обновление уже записанных данных
                }
            })
            
        } catch let error {
            print(error)
        }
    }
}
