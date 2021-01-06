//
//  DataModel.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import Foundation
//------------------------------------설정------------------------------------

// 프라퍼티 설명:  언어 설정, 배경음, 효과음, 넘김 속도
struct Setting {
    var bgmVolume: Double
    var effectVolume: Double
    var textSpeed: Double
    
}

//------------------------------------히스토리: 업적 비슷한 개념------------------------------------
// 히스토리: 키렐이 매일 꾸는 꿈 내용.


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

//------------------------------------업적------------------------------------

//주인공 업적
// 프라퍼티 설명: 업적 이름, 해당 이미지, 글

enum AchievementID :String,Codable{
    case achievement1
    case achievement2
    case achievement3
    case achievement4
}

struct Achievement :Codable{
    let name: String
    let image: String
    let id: AchievementID
    var isLocked: Bool
}



//------------------------------------게임 캐릭터 : 키렐 포함 모든 인물들------------------------------------
//수첩 인물 정보
enum InfomationID :String,Codable{
    case hwiryeong1
    case hwiryeong2
    case hwiryeong3
    case hwiryeong4
    case hwiryeong5
}
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
    
    func info() -> GameCharacter{
        switch self {
        case .danhee:
            return prologueChapter.currentCharacterNote[1]
        case .hwiryeong:
            return prologueChapter.currentCharacterNote[2]
        case .hwiryeong1:
            return prologueChapter.currentCharacterNote[2]
        case .hwiryeong2:
            return prologueChapter.currentCharacterNote[2]
        case .hwiryeong3:
            return prologueChapter.currentCharacterNote[2]
        case .hwiryeong4:
            return prologueChapter.currentCharacterNote[2]
        default:
            break
        }
    }
}


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
//----------얘는 유저스트럭처에 포함됨-----------

//유저가 파악한 현재 인물들 정보를 반영해 넣을 스트럭처
struct GameCharacters{                                                                                                 //현재 유저가 발견한 캐릭터만 확인되는 형태라면, 이름이 직관적이지 않다.
    let kirell: GameCharacter
    let hilde: GameCharacter
    let argo: GameCharacter
    let philio: GameCharacter
    let balaam: GameCharacter
}
//------------------------------------유저------------------------------------

//  프라퍼티 설명: 설정, 티켓(게임화폐), 유저가 달성한 히스토리, 유저가 달성한 업적, 타임라인(?), 유저가 파악한 캐릭터들 정보
struct User {
    var setting: Setting
    var currentEpisodes: [Episode]
    //var timellne: nil
    var currentCharacterInfo: [String:GameCharacter]
    var currentAchievementInfo: [Achievement]
    var clearedAchievementInfo: Int {
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
    let who: GameCharacter
    let characterFace : Bool
    let achievementToUnlock: AchievementID?
    let infomationToUnlock: InfomationID?
    let gameCharacterToUnlock: GameCharacterID?
    let caseToUnlock: NoteCaseID?
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
    let isCleared: Bool
    //(예시 : 대사)
    var storyBlocks: [String:BlockOfDayEpisode]
    // 해당 사건의 수첩에 적힐 캐릭터들
    var currentCharacterNote: [GameCharacter]
    // 해당 사건의 수첩에 적힐 사건들
    var currentCaseNote: [NoteCase]
}

// 더미데이터 담을 스트럭처
// 총 스토리 본문, 모든 히스토리, 모든 업적, 전체 인물 정보
struct GameData {
    let stories: [String:Episode]
    let histories: [Int:NoteCase]
    let achivements: [Int:Achievement]
    let gameCharacters: [String:GameCharacter]
}

//mainGame에서 currentChat 정보 읽어서 알맞는 주인공 업적 해금하기
func checkAchievementInChat() {
    let currentChatAchievement = currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].achievementToUnlock
    if currentChatAchievement != nil {
        for achievement in player.currentAchievementInfo.enumerated() {
            if achievement.element.id == currentChatAchievement {
                player.currentAchievementInfo[achievement.offset].isLocked = false
                print("업적 '\(player.currentAchievementInfo[achievement.offset].name)' 달성됨")
                
            }
        }
    }
}

//mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 등장인물 해금하기
func checkGameCharacterInChat() {
    let currentChatGameCharacter = currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].gameCharacterToUnlock
    if currentChatGameCharacter != nil {
        for gameCharacter in currentDay().currentCharacterNote.enumerated() {
            if gameCharacter.element.name == currentChatGameCharacter {
                currentDay().currentCharacterNote[gameCharacter.offset].isLocked = false
                print("캐릭터 '\(testChapter1.currentCharacterNote[0].isLocked)' 해금됨")
                
            }
        }
    }
}

//mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 사건 해금하기
func checkCaseInChat() {
    let currentChatCase = currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].caseToUnlock
    if currentChatCase != nil {
        for caseNote in currentDay().currentCaseNote.enumerated() {
            if caseNote.element.id == currentChatCase {
                currentDay().currentCharacterNote[caseNote.offset].isLocked = false
                print("사건 노트 '\(testChapter1.currentCaseNote[0].isLocked)' 해금됨")
                
            }
        }
    }
}

//mainGame에서 currentChat 정보 읽어서 알맞는 등장인물의 infomation 해금하기
func checkgameCharacterInfomationInChat() {
    let currentChatInfomation = currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].infomationToUnlock
    if currentChatInfomation != nil {
        for gameCharacter in currentDay().currentCharacterNote.enumerated() {
            for infomation in gameCharacter.element.infomation.enumerated() {
                if infomation.element.infomationID == currentChatInfomation {
                    currentDay().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].isLocked = false
                    print("사건 노트 '\(currentDay().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].isLocked)' 해금됨")
                }
            }
        }
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
