//
//  Episode.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation

struct Episode: Codable, Equatable {
  static func == (lhs: Episode, rhs: Episode) -> Bool {
    return lhs.episodeID == rhs.episodeID
  }

  let episodeID: String
  
  let episodePlace: String
  
  let episodeYear: Int
  //(예시 : 선조 25년, 광해군 11년)
  let episodeKingYear: String
  
  let episodeShortDesciption: String
  //  //(예시 : "어쩌구"\n "저쩌구"\n 창덕궁이 임진왜란으로 인해 화재의 위험에 처하다.)
  let episodeDesciption: String
  //(예시 : assets.xcassets에 넣은 이미지 이름)
  let episodePlaceImage: String
  
  let episodeCoverImage: String
  //(예시 : 해당 에피 클리어 여부)
  var isCleared: Bool = false
  // 에피소드 첫 진입 했는지 안 했는지 여부. 수첩/앨범 에피소드 이름 표시 여부 식별 위함
  var isStarted: Bool = false
  // 에피소드 완료시, 해당 에피소드 대화 내용이 저장되는 곳. 추후 타임라인에서 '이전 기록 보기'기능 할 때 사용될 예정임.
  var chatHistory: [Chat]
  //(예시 : 대사)
  var storyBlocks: [String:BlockOfDayEpisode]
  // 해당 사건의 수첩에 적힐 캐릭터들
  var currentCharacterNote: [GameCharacter]
  // 해당 사건의 수첩에 적힐 사건들
  var currentCaseNote: [NoteCase]
  // 해당 사건의 앨범 창에 추가될 이미지
  var currentAlbumImages: [AlbumImage]
  // 해당 사건에 포함 되어있는 체크포인트
  var timelineCheckPoint:[[CheckPoint]]
  // 마지막으로 플레이 한 지점 인덱스
  var currentStoryBlockIndex: String

  var currentEpRoute: Route {
    get { return storyBlocks[currentStoryBlockIndex]?.currentRoute ?? .normal }
  }
  
  init(episodeID: String, episodePlace: String, episodeYear: Int, episodeKingYear: String, episodeShortDesciption: String, episodeDesciption: String, episodePlaceImage: String, episodeCoverImage: String, isCleared: Bool, chatHistory: [Chat], storyBlocks: [String:BlockOfDayEpisode], currentCharacterNote: [GameCharacter], currentCaseNote: [NoteCase], currentAlbumImages: [AlbumImage], timelineCheckPoint: [[CheckPoint]], currentStoryBlockIndex: String) {
    
    self.episodeID = episodeID
    self.episodePlace = episodePlace
    self.episodeYear = episodeYear
    self.episodeKingYear = episodeKingYear
    self.episodeShortDesciption = episodeShortDesciption
    self.episodeDesciption = episodeDesciption
    self.episodePlaceImage = episodePlaceImage
    self.episodeCoverImage = episodeCoverImage
    self.isCleared = isCleared
    self.chatHistory = chatHistory
    self.storyBlocks = storyBlocks
    self.currentCharacterNote = currentCharacterNote
    self.currentCaseNote = currentCaseNote
    self.currentAlbumImages = currentAlbumImages
    self.timelineCheckPoint = timelineCheckPoint
    self.currentStoryBlockIndex = currentStoryBlockIndex
  }
  
  init(episodeID: String, episodePlace: String, episodeYear: Int, episodeKingYear: String, episodeShortDesciption: String, episodeDesciption: String, episodePlaceImage: String, episodeCoverImage: String, chatHistory: [Chat], storyBlocks: [String:BlockOfDayEpisode], currentCharacterNote: [GameCharacter], currentCaseNote: [NoteCase], currentAlbumImages: [AlbumImage], timelineCheckPoint: [[CheckPoint]], currentStoryBlockIndex: String) {
    
    self.init(episodeID: episodeID,
              episodePlace: episodePlace,
              episodeYear: episodeYear,
              episodeKingYear: episodeKingYear,
              episodeShortDesciption: episodeShortDesciption,
              episodeDesciption: episodeDesciption,
              episodePlaceImage: episodePlaceImage,
              episodeCoverImage: episodeCoverImage,
              isCleared: false,
              chatHistory: chatHistory,
              storyBlocks: storyBlocks,
              currentCharacterNote: currentCharacterNote,
              currentCaseNote: currentCaseNote,
              currentAlbumImages: currentAlbumImages,
              timelineCheckPoint: timelineCheckPoint,
              currentStoryBlockIndex: currentStoryBlockIndex)
  }
  
  init() {
    self.init(episodeID: "", episodePlace: "", episodeYear: 0, episodeKingYear: "", episodeShortDesciption: "", episodeDesciption: "", episodePlaceImage: "", episodeCoverImage: "", isCleared: true, chatHistory: [], storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [], timelineCheckPoint: [], currentStoryBlockIndex: "")
  }
}
