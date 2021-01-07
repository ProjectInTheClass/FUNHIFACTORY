//
//  jsonParsing.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/06.
//

import Foundation
import UIKit

let jsonEncoder = JSONEncoder()
let jsonDecoder = JSONDecoder()

let urlString = "https://raw.githubusercontent.com/ChoiSeoyeon61/FUNHI_Toy_seoul2033/mugwort/storyInstance.json"

func parse(jsonData : Data){
    do{
        //let jsonString = try String(data: asset.data, encoding: .utf8)
        let ex = try jsonDecoder.decode([BlockOfDayEpisodeForJson].self, from: jsonData)
        dataToDictionary(storyData: ex, storyStorage: prologueChapter.storyBlocks)
    } catch{
        print(error)
    }
}

func dataToDictionary(storyData : [BlockOfDayEpisodeForJson], storyStorage : [String:BlockOfDayEpisode]){
    
    for ex in storyData{
        let storyId = ex.id
        let chats = ex.chats
        let choices = ex.choices
        let achievement = ex.achievement
        let choiceSkip = ex.choiceSkip
        let story = BlockOfDayEpisode(chats: chats, choices: choices, achievement: achievement, choiceSkip: choiceSkip)
        prologueChapter.storyBlocks[storyId] = story
    }
    
}
func loadJson(fromURLString urlString: String,
                      completion: @escaping (Result<Data, Error>) -> Void) {
    if let url = URL(string: urlString) {
        let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        
        urlSession.resume()
    }
}

func readLocalFile(forName name: String) -> Data? {
   do {
       if let bundlePath = Bundle.main.path(forResource: name,
                                            ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
           return jsonData
       }
   } catch {
       print(error)
   }
   
   return nil
}

/*
 loadJson(fromURLString: urlString) { (result) in
      switch result {
      case .success(let data):
          self.parse(jsonData: data)
      case .failure(let error):
          print(error)
      }
  }
 */
