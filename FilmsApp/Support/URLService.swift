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
    var imageCache = NSCache<NSString,UIImage>()
    
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
    
    func posterSetUp(with url:URL, completion: @escaping (UIImage) -> Void) {
        if let cachedImage  = imageCache.object(forKey: url.absoluteString as NSString){
            completion(cachedImage)
        } else {
            let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataDontLoad, timeoutInterval: 10)
            let downloadingTask = session.dataTask(with: request){ [weak self] data, response, error in
                guard error == nil,
                      let unwrData = data,
                      let response = response as? HTTPURLResponse, response.statusCode == 200,
                      let `self` = self else {
                          return
                      }
                guard let image = UIImage(data: unwrData) else {
                    return
                }
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    completion(image)
                }
            }
            downloadingTask.resume()
        }
    }

}


