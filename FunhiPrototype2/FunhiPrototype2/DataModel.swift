//
//  DataModel.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import Foundation
import UIKit

//------------------------------------설정------------------------------------

// 프라퍼티 설명:  언어 설정, 배경음, 효과음, 넘김 속도
struct Setting {
    var bgmVolume: Double
    var effectVolume: Double
    var textSpeed: Double
    
}

//------------------------------------수첩 사건------------------------------------

// player.currentEpisodes에서 현재 플레이중인 episode 골라내는 인덱스. 현재 에피소드 이름으로 식별함.
var currentEpIndex: Int {
    get {
        if currentDay().episodeName == "프롤로그" {
            return 0
        } else if currentDay().episodeName == "임진왜란" {
            return 1
        } else if currentDay().episodeName == "인조반정" {
            return 2
        } else if currentDay().episodeName == "3.1 운동" {
            return 3
        } else if currentDay().episodeName == "내 생일" {
            return 4
        } else {
            print("currentEpIndex 없음. 수정 필요")
            return 0
        }
    }
}
//수첩 사건

enum NoteCaseID :String,Codable{
    case case101
    case case201
    case case301
    case case401
}
class NoteCase :Codable{
    //구별 위한 ID
    let id: NoteCaseID
    let title: String
    let shortDescription: String
    let longDescription: String
    var isLocked: Bool
    
    init(id: NoteCaseID, title: String, shortDescription: String, longDescription: String, isLocked: Bool) {
        self.id = id
        self.title = title
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.isLocked = isLocked
    }
}

//------------------------------------주인공 업적------------------------------------

//주인공 업적


enum AchievementID :String,Codable{
    case donhwamun
    case achievement2
    case achievement3
    case achievement4
}
// 프라퍼티 설명: 업적 이름, 업적 이미지, id(업적 획득 로직에서 사용), 업적 잠금 여부
struct Achievement :Codable{
    let name: String
    let image: String
    let id: AchievementID
    var isLocked: Bool
}

//------------------------------------앨범 이미지------------------------------------

enum AlbumImageID :String,Codable{
    case prologueCase1
    case achievement1Locked
    
    func info() -> AlbumImage{
        switch self {
        case .prologueCase1:
            return test.currentAlbumImages[0]
        case .achievement1Locked:
            return test.currentAlbumImages[1]
        }
    }
}
class AlbumImage :Codable{
    //구별 위한 ID
    let id: AlbumImageID
    let image: String
    let title: String
    let description: String
    var isLocked: Bool
    
    init(id: AlbumImageID, image: String, title: String, description: String, isLocked: Bool) {
        self.id = id
        self.image = image
        self.title = title
        self.description = description
        self.isLocked = isLocked
    }
}
//------------------------------------등장인물 정보------------------------------------
//수첩 인물 정보
enum InfomationID :String,Codable{
    case hwiryeong1
    case hwiryeong2
    case hwiryeong3
    case hwiryeong4
    case hwiryeong5
}

// id(정보 획득 로직에서 사용), 업적 잠금 여부, 정보 텍스트
class Infomation :Codable{
    var infomationID: InfomationID
    var isLocked: Bool
    var text: String
    
    init(infomationID: InfomationID, isLocked: Bool, text: String) {
        self.infomationID = infomationID
        self.isLocked = isLocked
        self.text = text
    }
}
//------------------------------등장인물-----------------------
// 키렐 포함 인물들 정보를 담기 위한 스트럭처
// 프라퍼티 설명:  인물 이름, 대표 이미지, 키렐이 관찰기록한 듯한 내용의 해당 인물 정보들(인물상세페이지에 있음), 시련 미션, 호감도
//인물

enum GameCharacterID :String,Codable{
    case danhee
    case hwiryeong
    case hwiryeong1
    case hwiryeong2
    case hwiryeong3
    case hwiryeong4
    case tourguide
    case teacher
    case unknown
    
    func info() -> GameCharacter{
        switch self {
        case .danhee:
            return prologueChapter.currentCharacterNote[0]
        case .hwiryeong:
            return prologueChapter.currentCharacterNote[1]
        case .hwiryeong1:
            return prologueChapter.currentCharacterNote[1]
        case .hwiryeong2:
            return prologueChapter.currentCharacterNote[1]
        case .hwiryeong3:
            return prologueChapter.currentCharacterNote[1]
        case .hwiryeong4:
            return prologueChapter.currentCharacterNote[1]
        case .tourguide:
            return prologueChapter.currentCharacterNote[2]
        case .teacher:
            return prologueChapter.currentCharacterNote[3]
        case .unknown:
            return prologueChapter.currentCharacterNote[4]
        default:
            break
        }
    }
}

// gameCharacter는 참조 기능 필요해서 class임
// 프라퍼티 설명: 등장인물 이름, 프로필 이미지, 배경 이미지, 등장인물 설명, 등장인물 정보 목록, 호감도, 잠금 여부
class GameCharacter :Codable{
    let name: String
    let profileImage: String
    let backGroundImage : String
    //노트 인물 페이지 셀에 들어갈 주인공 설명
    let description: String
    var infomation: [Infomation]
    var likability: Int
    var isLocked: Bool
    
    init(name: String, profileImage: String ,backGroundImage: String, description: String, infomation: [Infomation], likability:Int, isLocked: Bool ) {
        self.name = name
        self.profileImage = profileImage
        self.backGroundImage = backGroundImage
        self.description = description
        self.infomation = infomation
        self.likability = likability
        self.isLocked = isLocked

    }
    
}

//------------------------------------유저------------------------------------

//  프라퍼티 설명: 게임 설정 정보, 플레이한 에피소드 내용, ???, 유저 업적, 획득된 업적 개수, 앨범 이미지, ??, ??, 현재 게임 대화 진행현황 id
struct User {
    var setting: Setting
    var currentEpisodes: [Episode]
    //var timellne: nil
    // 얘 역할 주석으로 설명 부탁합니다 궁금함
    var currentCharacterInfo: [String:GameCharacter]
    var currentAchievementInfo: [Achievement]
    //획득한 업적 개수 계산해주는 프로퍼티. 주인공 노트 화면에서 사용합니다
    var clearedAchievementCount: Int {
        get {
            var cleardCount = Int()
            for achievement in self.currentAchievementInfo {
                if !achievement.isLocked {
                    cleardCount += 1
                }
            }
            return cleardCount
        }
    }
   
    //이 아래 두 개 역할이 어떻게 되고 어떤 차이점이 있는지 주석으로 설명 부탁합니다 궁금22
    var dayIndex:Int
    var dayId:String
    var currentChatId:String
}

func currentDay() -> Episode{
    return dummyData.stories[player.dayId]!
}
func currentBlockOfDay() -> BlockOfDayEpisode{
    return currentDay().storyBlocks[player.currentChatId]!
}
func currentChatAmount() -> Int{
    return currentBlockOfDay().chats.count
}
func currentChatType() -> ChatType{
    return currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].type
}

//------------------------------------스토리------------------------------------

// 대화할 때 나오는 텍스트 블럭 "종류"
// 프라퍼티 설명:  그냥 글, 터치하면 확대되는 큰 이미지, 터치 안 되는 작은 이미지, 팝업(키렐 혼잣말), 팝업(짤막한 움짤), 섹션 해더같은 애
enum ChatType :String, Codable{
    case onlyText
    case untouchableImage
    case sectionHeader
    case choice
    case monologue
}

// 텍스트 블럭 스트럭처
//  프라퍼티 설명: 글, 이미지, 타입, 해당 인물
struct Chat :Codable{
    let text: String
    let image: String
    let type: ChatType
    let who: GameCharacterID
    let characterFace : Bool
    let achievementToUnlock: AchievementID?
    let infomationToUnlock: InfomationID?
    let gameCharacterToUnlock: GameCharacterID?
    let caseToUnlock: NoteCaseID?
    let albumImageToUnlock: AlbumImageID?
}

//선택지 누르면 변경될 호감도
// 프라퍼티 설명:  해당 인물, 변경될 호감도 수치
struct ChoiceLikeability :Codable{
    let who: GameCharacter
    let number: Int
}

//선택지
// 프라퍼티 설명: 선택지 텍스트, 변경될 호감도
struct Choice :Codable{
    let text: String
    let likability: [ChoiceLikeability]
    let nextTextIndex: String
}

//n일차를 쪼갠 조각의 단위 : 일반 대화들 ~ 키렐 선택지가 마지막.
// 에피소드를 어떤 단위대로 쪼개야 할지 고민했음. 이거 게임 구조가 이랬음.[ 캐릭터들 대사가 자동으로 나옴 -> 키렐 선택지 나옴 -> 자동으로 나오던 대사는 멈춤 -> 키렐 선택지 결정하면 그 다음 대사들이 결정되고 또 자동으로 나옴] -> 그러니까 키렐 대사 선택지가 나오면 게임 진행이 멈춤. 그리고 이 선택을 기점으로 다음 내용이 결정되고, 진행이 되는 거임. 그러려면 키렐 대사 선택지는 하나하나 쪼개야 하나하나 쪼개야 했음. 그래서 본문을 이렇게 나눔.[키렐 대사 선택 직후 시작되는 인물들 대사부터 선택지 나오기 직전까지의 대화 내용 + 키렐 선택지]. 이 단위가 여러 개 이어지면 [대사-> 선택지-> 대사-> 선택지...]인 거고 이러면 괜찮지 않을까 싶었음.
// 프라퍼티 설명: 순차적으로 나오는 텍스트 블록, 선택지, 이거 깨면 달성되는 업적
struct BlockOfDayEpisode :Codable{
    let chats: [Chat]
    
    //다음 페이지(?)블럭(?)을 선택하는 로직을 좀 더 간결하게 할 수 있을지 고민하다 딕셔너리 어떨까 생각함. 원래는 다음 페이지를 nextIndexPage값으로 했다면, 이번에는 key값을 이용해보는 거? 만약 key 값이 각가 1, 2를 가진 선택지가 있따면, 현재 페이지 번호에 선택지 key 값인 1, 2를 더한 수를 가진 페이지가 다음 페이지가 됨. 예를 들어서 3번 페이지에서 1번 선택지를 고르면 1+1= 2번 페이지로 가게 되고, 2번을 고르면 1+2 = 3번 페이지로 가게 됨.
    // choices: [[다음페이지 결정짓는 key값 : 선택지 텍스트]]
    let choices: [Choice]
    let achievement: Achievement?
    let choiceSkip : Bool
}
//n일차
// 프라퍼티 설명: 에피소드 이름(ex)인조반정), 에피소드 연도(1xxx년), 에피소드 설명(인조반정에서 무슨 일이 일어날 예정이다 과연 주인공은 이를 막을 수 있을까? 어쩌구저쩌구), 에피소드 이미지(전각 이미지)스토리블럭(대사 인스턴스)
struct Episode {
    let episodeID: String
    //(예시 : 임진왜란)
    let episodeName: String
    //(예시 : 1592)
    let episodeYear: Int
    //(예시 : 선조 25년, 광해군 11년)
    let episodeKingYear: String
    //  //(예시 : "어쩌구"\n "저쩌구"\n 창덕궁이 임진왜란으로 인해 화재의 위험에 처하다.)
    let episodeDesciption: String
    //(예시 : assets.xcassets에 넣은 이미지 이름)
    let episodePlaceImage: String
    //(예시 : 해당 에피 클리어 여부)
    var isCleared: Bool
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
    
//    init(episodeID: String,episodeName: String,episodeYear: Int,episodeKingYear: String,episodeDesciption: String,episodePlaceImage: String,isCleared: Bool,chatHistory: [Chat],storyBlocks: [String:BlockOfDayEpisode],currentCharacterNote: [GameCharacter],currentCaseNote: [NoteCase],currentAlbumImages: [AlbumImage]) {
//        self.episodeID = episodeID
//        self.episodeName = episodeName
//        self.episodeYear = episodeYear
//        self.episodeKingYear = episodeKingYear
//        self.episodeDesciption = episodeDesciption
//        self.episodePlaceImage = episodePlaceImage
//        self.isCleared = isCleared
//        self.chatHistory = chatHistory
//        self.storyBlocks = storyBlocks
//        self.currentCharacterNote = currentCharacterNote
//        self.currentCaseNote = currentCaseNote
//        self.currentAlbumImages = currentAlbumImages
//    
//    }
}

// 더미데이터 담을 스트럭처
// 총 스토리 본문, 모든 히스토리, 모든 업적, 전체 인물 정보
struct GameData {
    let stories: [String:Episode]
    let histories: [String:NoteCase]
    let achivements: [String:Achievement]
    let gameCharacters: [String:GameCharacter]
}

//mainGame에서 currentChat 정보 읽어서 알맞는 주인공 업적 해금하기
func checkAchievementInChat(popupView: UIView, backgroundView: UIView, titleLabel: UILabel, descriptionLabel: UILabel) {
    let infoID = "achievement"
    let currentChatAchievement = currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].achievementToUnlock
    if currentChatAchievement != nil {
        for achievement in player.currentAchievementInfo.enumerated() {
            if achievement.element.id == currentChatAchievement {
                player.currentAchievementInfo[achievement.offset].isLocked = false
                print("업적 '\(player.currentAchievementInfo[achievement.offset].name)' 달성됨")
                
                backgroundView.addSubview(popupView)
                notePopupViewDesign(notePopupView: popupView, backgroundView: backgroundView, titleLabel: titleLabel, descriptionLabel: descriptionLabel, descriptionText: player.currentAchievementInfo[achievement.offset].name , infoID: infoID)
                popupView.bringSubviewToFront(backgroundView)
                
            }
        }
    }
}

//mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 등장인물 해금하기
func checkGameCharacterInChat(popupView: UIView, backgroundView: UIView, titleLabel: UILabel, descriptionLabel: UILabel) {
    let infoID = "gameCharacter"
    let currentChatGameCharacter = currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].gameCharacterToUnlock
    if let currentChatGameCharacter = currentChatGameCharacter {
        for gameCharacter in currentDay().currentCharacterNote.enumerated() {
            if gameCharacter.element.name == currentChatGameCharacter.info().name {
                currentDay().currentCharacterNote[gameCharacter.offset].isLocked = false
                
                print("캐릭터 '\(currentDay().currentCharacterNote[gameCharacter.offset].isLocked)' 해금됨")
                backgroundView.addSubview(popupView)
                notePopupViewDesign(notePopupView: popupView, backgroundView: backgroundView, titleLabel: titleLabel, descriptionLabel: descriptionLabel, descriptionText: currentDay().currentCharacterNote[gameCharacter.offset].name, infoID: infoID)
                popupView.bringSubviewToFront(backgroundView)
            }
        }
    }
}

//mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 사건 금하기
func checkCaseInChat(popupView: UIView, backgroundView: UIView, titleLabel: UILabel, descriptionLabel: UILabel) {
    let infoID = "case"
    let currentChatCase = currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].caseToUnlock
    if currentChatCase != nil {
        for caseNote in currentDay().currentCaseNote.enumerated() {
            if caseNote.element.id == currentChatCase {
                testChapter1.currentCaseNote[0].isLocked = false
                
                print("사건 노트 '\(testChapter1.currentCaseNote[0].isLocked)' 해금됨")
                backgroundView.addSubview(popupView)
                notePopupViewDesign(notePopupView: popupView, backgroundView: backgroundView, titleLabel: titleLabel, descriptionLabel: descriptionLabel, descriptionText: currentDay().currentCaseNote[caseNote.offset].title, infoID: infoID)
                popupView.bringSubviewToFront(backgroundView)
            }
        }
    }
}

//mainGame에서 currentChat 정보 읽어서 알맞는 등장인물의 infomation 해금하기
func checkgameCharacterInfomationInChat(popupView: UIView, backgroundView: UIView, titleLabel: UILabel, descriptionLabel: UILabel) {
    let infoID = "characterInfomation"
    let currentChatInfomation = currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].infomationToUnlock
    if currentChatInfomation != nil {
        for gameCharacter in currentDay().currentCharacterNote.enumerated() {
            for infomation in gameCharacter.element.infomation.enumerated() {
                if infomation.element.infomationID == currentChatInfomation {
                    currentDay().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].isLocked = false
                    print("'\(testChapter1.currentCharacterNote[0].isLocked)' 정보 해금됨")
                    backgroundView.addSubview(popupView)
                    notePopupViewDesign(notePopupView: popupView, backgroundView: backgroundView, titleLabel: titleLabel, descriptionLabel: descriptionLabel, descriptionText: currentDay().currentCharacterNote[gameCharacter.offset].name, infoID: infoID)
                    popupView.bringSubviewToFront(backgroundView)
                }
            }
        }
    }
}

//mainGame에서 currentChat 정보 읽어서 알맞은 앨범 이미지 해금하기
func checkAlbumImageInChat() {
    
    let currentChatAlbumImage = currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].albumImageToUnlock
    
    if currentChatAlbumImage != nil {
   
    for albumImage in currentDay().currentAlbumImages.enumerated() {
        if albumImage.element.id == currentChatAlbumImage {
            currentDay().currentAlbumImages[albumImage.offset].isLocked = false
            print("'\(currentDay().currentAlbumImages[albumImage.offset].isLocked)' 앨범 이미지 해금됨")
          
            
        }
    }
    }
}

func notePopupViewDesign(notePopupView: UIView, backgroundView: UIView, titleLabel: UILabel, descriptionLabel: UILabel, descriptionText: String, infoID: String) {
    
    notePopupView.translatesAutoresizingMaskIntoConstraints = false
    notePopupView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 118).isActive = true
        let horizontalConstraint = NSLayoutConstraint(item: notePopupView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: backgroundView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: notePopupView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 231)
        let heightConstraint = NSLayoutConstraint(item: notePopupView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 53)
    backgroundView.addConstraints([horizontalConstraint, widthConstraint, heightConstraint])
    
    if infoID == "achievement" {
        titleLabel.text = "업적"
        descriptionLabel.text = "\(descriptionText) 획득"
    }
    if infoID == "gameCharacter" {
        titleLabel.text = "수첩 - 인물"
        descriptionLabel.text = "\(descriptionText) 정보 획득"
    }
    if infoID == "case" {
        titleLabel.text = "수첩 - 역사"
        descriptionLabel.text = "\(descriptionText) 정보 획득"
    }
    if infoID == "characterInfomation" {
        titleLabel.text = "수첩 - 인물"
        descriptionLabel.text = "\(descriptionText) 획득"
    }
    
}
//일단 만들어놓은 인물들 샘플 정보 변수입니다.

//json 파싱 전용 파일
struct BlockOfDayEpisodeForJson :Codable{
    let id : String
    let chats: [Chat]
    
    //다음 페이지(?)블럭(?)을 선택하는 로직을 좀 더 간결하게 할 수 있을지 고민하다 딕셔너리 어떨까 생각함. 원래는 다음 페이지를 nextIndexPage값으로 했다면, 이번에는 key값을 이용해보는 거? 만약 key 값이 각가 1, 2를 가진 선택지가 있따면, 현재 페이지 번호에 선택지 key 값인 1, 2를 더한 수를 가진 페이지가 다음 페이지가 됨. 예를 들어서 3번 페이지에서 1번 선택지를 고르면 1+1= 2번 페이지로 가게 되고, 2번을 고르면 1+2 = 3번 페이지로 가게 됨.
    // choices: [[다음페이지 결정짓는 key값 : 선택지 텍스트]]
    let choices: [Choice]
    let achievement: Achievement?
    let choiceSkip : Bool
}
