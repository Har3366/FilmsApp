//
//  JSONModel.swift
//  FilmsApp
//
//  Created by Игорь on 15.12.2021.
//

import Foundation

class JSONModel: Codable {
    var original_title: String?
    var poster_payh: String?
    var release_date: String?
    var overview: String?
    var vote_average: Double?
    var backdrop_path: String?
    
}



class TestModel {
    var testPic: String?
    var testTitle: String?
    var testYear: String?
    var testRating: String?
    
    init(testPic: String?,testTitle: String?, testYear: String?, testRating: String?){
        self.testPic = testPic
        self.testTitle = testTitle
        self.testYear = testYear
        self.testRating = testRating
    }
}

var testArray:[TestModel] = [
TestModel(testPic: "image1", testTitle: "Фильм1", testYear: "2001", testRating: "1"),
TestModel(testPic: "image2", testTitle: "Фильм2", testYear: "2002", testRating: "12"),
TestModel(testPic: "image3", testTitle: "Фильм3", testYear: "2003", testRating: "3"),
TestModel(testPic: "image4", testTitle: "Фильм4", testYear: "2004", testRating: "5"),
TestModel(testPic: "image5", testTitle: "Фильм5", testYear: "2005", testRating: "6"),
TestModel(testPic: "image6", testTitle: "Фильм6", testYear: "2006", testRating: "7"),
TestModel(testPic: "image7", testTitle: "Фильм7", testYear: "2007", testRating: "18"),
TestModel(testPic: "image8", testTitle: "Фильм8", testYear: "2008", testRating: "09"),
TestModel(testPic: "image9", testTitle: "Фильм9", testYear: "2009", testRating: "111"),
TestModel(testPic: "image10", testTitle: "Фильм10", testYear: "2010", testRating: "23"),
TestModel(testPic: "image11", testTitle: "Фильм11", testYear: "2011", testRating: "45"),
TestModel(testPic: "image12", testTitle: "Фильм12", testYear: "2012", testRating: "31"),
TestModel(testPic: "image13", testTitle: "Фильм13", testYear: "2013", testRating: "0990"),
TestModel(testPic: "image14", testTitle: "Фильм14", testYear: "2014", testRating: "101"),
TestModel(testPic: "image15", testTitle: "Фильм15", testYear: "2015", testRating: "18")
]
