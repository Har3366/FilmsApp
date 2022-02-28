//
//  URLService.swift
//  FilmsApp
//
//  Created by Игорь on 28.02.2022.
//

import Foundation
import UIKit

class URLService {
    
    let apiKey = "7001b5bc6ff4d393243b5bea8968a0bb"
    let session = URLSession.shared
    let parser = JSONParsingService()
    
   func dataRequest(){
        guard let apiURL = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=ru-RU&page=1")
        else {return}
        let task = session.dataTask(with: apiURL) { data, response, error in
            guard let unwrData = data,
                  (response as? HTTPURLResponse)?.statusCode == 200,
                  error == nil else {return}
            self.parser.parseJSON(parseData: unwrData, parseError: error)
        }
        task.resume()
    }
    
    func postersSetUp(with url:URL, imageView: UIImageView) {
        let downloadingTask = session.dataTask(with: url) { pictures, response, failure in
            guard let pic = try? Data(contentsOf: url) else {return}
            
            DispatchQueue.main.async {
                imageView.image = UIImage(data: pic)
            }
        }
        downloadingTask.resume()
    }
}


