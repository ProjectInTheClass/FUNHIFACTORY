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

let urlString = "https://raw.githubusercontent.com/ProjectInTheClass/FUNHIFACTORY/master/FunhiPrototype2/storyInstance.json?token=ALEJVF4PKMNFMEM4C5E3IGLAA2H6K"

func parse(jsonData : Data){
    do{
        //let jsonString = try String(data: asset.data, encoding: .utf8)
        let ex = try jsonDecoder.decode([BlockOfDayEpisodeForJson].self, from: jsonData)
        dataToDictionary(storyData: ex, storyStorage: prologueChapter.storyBlocks)
    }
  catch let DecodingError.dataCorrupted(context){
         print("**데이터가 손상되었거나 유효하지 않다**")
         print(context)
     } catch let DecodingError.keyNotFound(key, context) {
         print("**데이터에 알맞는 key가 존재하지 않는다**")
         print("Key '\(key)' not found:", context.debugDescription)
         print("codingPath:", context.codingPath)
     } catch let DecodingError.valueNotFound(value, context) {
         print("**예기치 않은 optional Value가 발견되었다.**")
         print("Value '\(value)' not found:", context.debugDescription)
         print("codingPath:", context.codingPath)
     } catch let DecodingError.typeMismatch(type, context)  {
         print("**value값에 예기치 않은 타입이 왔다**")
         print("Type '\(type)' mismatch:", context.debugDescription)
         print("codingPath:", context.codingPath)
     }
    catch {
        print("error: ", error)
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
                print("url에서 json을 불러오는 데 실패했습니다")
                completion(.failure(error))
            }
            
            if let data = data {
                print("url에서 json을 불러오는 데 성공했습니다")
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
