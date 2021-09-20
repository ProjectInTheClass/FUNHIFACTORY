//
//  DataModel.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import Foundation
import UIKit

var currentEpIndex: Int {
  get {
    if currentEpisode().episodePlace == "프롤로그" {
      return 0
    } else if currentEpisode().episodePlace == "임진왜란" {
      return 1
    } else if currentEpisode().episodePlace == "인조반정" {
      return 2
    } else if currentEpisode().episodePlace == "3.1 운동" {
      return 3
    } else if currentEpisode().episodePlace == "내 생일" {
      return 4
    } else {
      print("currentEpIndex 없음. 수정 필요")
      return 0
    }
  }
}

func currentEpisode() -> Episode{
  return player.currentEpisodes[strToIndex(str: player.dayId)]
}

func currentBlockOfDay() -> BlockOfDayEpisode{
  return currentEpisode().storyBlocks[currentEpisode().currentStoryBlockIndex]!
}

func currentChatAmount() -> Int{
  return currentBlockOfDay().chats.count
}

func currentChatType() -> ChatType{
  return currentEpisode().storyBlocks[currentEpisode().currentStoryBlockIndex]!.chats[player.indexNumber].type
}

enum ScreenAnimation: String, Codable {
  case none
  case fadeIn
  case fadeOut
}

enum Bgm : String, Codable {
  case none
  case normal
  case badending
  case cover1
  case cover2
  case bright
  case nervous1
  case nervous2
  case highlyElated
  
  func info() -> String{
    switch self {
    case .none: return ""
    case .normal: return "normal"
    case .badending: return "badending"
    case .cover1: return "cover1"
    case .cover2: return "cover2"
    case .bright: return "bright"
    case .nervous1: return "nervous1"
    case .nervous2: return "nervous2"
    case .highlyElated: return "highlyElated"
    }
  }
}

// 프라퍼티 설명: 순차적으로 나오는 텍스트 블록, 선택지, 이거 깨면 달성되는 업적
struct BlockOfDayEpisode: Codable {
  let chats: [Chat]
  let choices: [Choice]
  let choiceSkip : Bool
  let isGodChat : Bool
  let backGroundMusic : Bgm
  let currentRoute : Route
}

struct GameData {
  var stories: [String:Episode]
  let histories: [String:NoteCase]
  let achivements: [String:Achievement]
}

func currentMainGameDanhee() -> GameCharacterID {
  switch currentEpisode().episodeID {
    case "prologue":
      return .danhee
    case "1623":
      return .danhee2
    default:
      return .danhee
  }
}

var globalPopupOpen: Bool = false

func strToIndex(str : String) -> Int {
  switch str {
  case "prologue":
    return 0
  case "1592":
    return 1
  case "1623":
    return 2
  case "1803":
    return 3
  case "1918":
    return 4
  case "ending":
    return 5
  default:
    return 0
  }
}

struct Ending {
  let name : String
  let comment : String
  let buttonUIColor : [UIColor]
  /*
   0. 버튼 팝업창 테두리색
   1. 좌측 원 배경 및 버튼 테두리
   2. 좌측 원 테두리
   3. 버튼 배경
   4. 버튼 빛반사 부분
   */
}

//지도 뷰컨에서 사용할 전각 구조체
struct Spots {
  let number: String
  let name : String
  let images : [String]
  let description : String
}

enum Route : String, Codable {
  case normal, first, second
}

//json 파싱 전용 파일
struct BlockOfDayEpisodeForJson: Codable {
  let id : String
  let chats: [Chat]
  let choices: [Choice]
  let choiceSkip : Bool
  let isGodChat : Bool
  let backGroundMusic : Bgm
  let currentRoute : Route
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    id = (try? values.decode(String.self, forKey: .id)) ?? ""
    chats = (try? values.decode([Chat].self, forKey: .chats)) ?? []
    choices = (try? values.decode([Choice].self, forKey: .choices)) ?? []
    choiceSkip = (try? values.decode(Bool.self, forKey: .choiceSkip)) ?? false
    isGodChat = (try? values.decode(Bool.self, forKey: .isGodChat)) ?? false
    backGroundMusic = (try? values.decode(Bgm.self, forKey: .backGroundMusic)) ?? .none
    currentRoute   = (try? values.decode(Route.self, forKey: .currentRoute)) ?? .normal
  }
}

func saveToFile() {
  let documentsDirectory =
    FileManager.default.urls(for: .documentDirectory,
    in: .userDomainMask).first!
  let archiveURL =
    documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
  let propertyListEncoder = PropertyListEncoder()
  let encodedNotes = try? propertyListEncoder.encode(player)
  try? encodedNotes?.write(to: archiveURL,options: .noFileProtection)
}

func loadFromFile() {
  let documentsDirectory =
    FileManager.default.urls(for: .documentDirectory,
    in: .userDomainMask).first!
  let archiveURL =
    documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
  let propertyListDecoder = PropertyListDecoder()
  if let retrievedNotesData = try? Data(contentsOf: archiveURL), let decodedNotes = try? propertyListDecoder.decode(User.self, from:retrievedNotesData) {
    player = decodedNotes
  }
}

func checkEnding(id : String) -> Ending {
  switch id {
    case "endingDied":
      return Ending(name: "당신은 죽었습니다.", comment: "나는 이렇게 끝낼 순 없어.", buttonUIColor: [
                            UIColor(red: 0.737, green: 0.452, blue: 0.452, alpha: 1),
                            UIColor(red: 0.558, green: 0.286, blue: 0.286, alpha: 1),
                            UIColor(red: 0.483, green: 0.246, blue: 0.246, alpha: 1),
                            UIColor(red: 0.843, green: 0.553, blue: 0.553, alpha: 1),
                            UIColor(red: 0.843, green: 0.553, blue: 0.553, alpha: 1)])
    case "endingLocked":
      return Ending(name: "당신은 과거에 갇혔습니다.", comment: "나는 이렇게 끝낼 순 없어.", buttonUIColor: [
                            UIColor(red: 0.546, green: 0.546, blue: 0.546, alpha: 1),
                            UIColor(red: 0.412, green: 0.412, blue: 0.412, alpha: 1),
                            UIColor(red: 0.358, green: 0.358, blue: 0.358, alpha: 1),
                            UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1),
                            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)])
    case "endingReturn" :
      return Ending(name: "당신은 현실로 돌아왔습니다.", comment: "한 번만 기회를 더 주면 잘 할 텐데...", buttonUIColor: [
                            UIColor(red: 0.698, green: 0.588, blue: 0.376, alpha: 1),
                            UIColor(red: 0.514, green: 0.404, blue: 0.204, alpha: 1),
                            UIColor(red: 0.429, green: 0.33, blue: 0.151, alpha: 1),
                            UIColor(red: 0.875, green: 0.729, blue: 0.459, alpha: 1),
                            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)])
    default :
        return Ending(name: "Error Occured", comment: "", buttonUIColor: [])
  }
}


func typingEffect(label : UILabel, str : String, loopTime : Double) {
  for i in str{
    label.text! += "\(i)"
    RunLoop.current.run(until: Date() + loopTime)
  }
}

var readAllNotes: Bool {
  get {
    var readAll = true
    player.currentEpisodes.forEach { episode in
      episode.currentCharacterNote.forEach { note in
        if !note.isChecked { readAll = false }
      }
      episode.currentCaseNote.forEach { note in
        if !note.isChecked { readAll = false }
      }
    }
    return readAll
  }
}

var readAllAlbums: Bool {
  get {
    var readAll = true
    player.currentEpisodes.forEach { episode in
      episode.currentAlbumImages.forEach { album in
        if !album.isChecked { readAll = false }
      }
    }
    return readAll
  }
}

var readAllNotification: Bool {
  get {
    return readAllNotes && readAllAlbums
  }
}
