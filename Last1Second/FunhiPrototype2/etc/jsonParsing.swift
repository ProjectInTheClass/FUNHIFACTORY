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



func parse(jsonData : Data, targetEpisode : Int){
    do{
        //let jsonString = try String(data: asset.data, encoding: .utf8)
        let ex = try jsonDecoder.decode([BlockOfDayEpisodeForJson].self, from: jsonData)
        if (!ex.isEmpty)
        {
            print("에피소드 \(targetEpisode + 1) 다운로드 완료")
        }
        dataToTargetEpisode(storyData: ex, target : &player.currentEpisodes[targetEpisode].storyBlocks)
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

func dataToTargetEpisode(storyData : [BlockOfDayEpisodeForJson], target : inout [String : BlockOfDayEpisode]){
    
    var storyBlock : [String : BlockOfDayEpisode] = [:]
    for ex in storyData{
        let storyId = ex.id
        let story = BlockOfDayEpisode(chats: ex.chats, choices: ex.choices, choiceSkip: ex.choiceSkip, isGodChat: ex.isGodChat, backGroundMusic: ex.backGroundMusic, currentRoute: ex.currentRoute)
        storyBlock[storyId] = story
    }
    target = storyBlock
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



func downloadData(targetURL : String, targetEpisodeIndex : Int)
{
    loadJson(fromURLString: targetURL) { (result) in
          switch result {
          case .success(let data):
            parse(jsonData: data, targetEpisode: targetEpisodeIndex)
          case .failure(let error):
              print(error)
          }
        if (player.currentEpisodes[targetEpisodeIndex].storyBlocks.isEmpty)
        {
            print("\(player.currentEpisodes[targetEpisodeIndex].episodeID) 챕터가 비었습니다")
        }
        else
        {
            print("\(player.currentEpisodes[targetEpisodeIndex].episodeID) 챕터가 들어있습니다")
        }
      }
}
