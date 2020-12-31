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

struct History {
    
    let title: String
    let shortDescription: String
    let longDescription: String
}

//------------------------------------업적------------------------------------
//업적 : 게임 도전 과제 - 특정 대사를 들으면 달성됨. 해당 날(n일차) 마지막 대사 나오고 도전과제 달성되었다는 상단 팝업이 화면에 뜸
// 히스토리랑 마찬가지로 한정된 갯수기 때문에 동일 코드 구조 줌
// 프라퍼티 설명: 업적 이름, 해당 이미지, 글
struct AchievementStructure {
    let name: String
    let image: String
    let text: String
}

enum Achievement {
    case charonsInterrogation
    case firstComradeArgo
    case likeAWelllAgedWhiskey
    case whereIBelong
    
    func achievementInfo() -> AchievementStructure {
    switch self {
    case .charonsInterrogation:
        return AchievementStructure(name: "카론의 심문", image: "", text: "생과 사의 경계에 있는 최후의 꿈에 오신 것을 환영합니다.")
    case .firstComradeArgo:
        return AchievementStructure(name: "첫 동료 아르고", image: "", text: "흠.... 키렐, 그 말은 제가 동료가 되는 게 당신에게 무조건 유리하다는 뜻인가요?")
    case .likeAWelllAgedWhiskey:
        return AchievementStructure(name: "중년의 품격", image: "", text: "...이럴 땐 제 과제가 참 어렵습니다.")
    case .whereIBelong:
        return AchievementStructure(name: "내가 있을 장소", image: "", text: "이곳 생활이 재미있어질 것 같네요.")
    default:
        break
        
        }
    }
}

//------------------------------------게임 캐릭터 : 키렐 포함 모든 인물들------------------------------------

// 키렐 포함 인물들 정보를 담기 위한 스트럭처
// 프라퍼티 설명:  인물 이름, 대표 이미지, 키렐이 관찰기록한 듯한 내용의 해당 인물 정보들(인물상세페이지에 있음), 시련 미션, 호감도
struct GameCharacter {
    let name: String
    let profileImage: String
    let backGroundImage : String
    let infomation: [String]
    let Mission : String
    var likability: Int = 0
    
}
//----------얘는 유저스트럭처에 포함됨-----------

//유저가 파악한 현재 인물들 정보를 반영해 넣을 스트럭처
struct GameCharacters {                                                                                                 //현재 유저가 발견한 캐릭터만 확인되는 형태라면, 이름이 직관적이지 않다.
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
    var tickets: Int
    var currentHistories: [History]
    var currentAchievements: [Achievement]
    //var timellne: nil
    var currentCharacterInfo: [String:GameCharacter]
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
enum ChatType {
    case onlyText
    case untouchableImage
    case sectionHeader
    case choice
}

// 텍스트 블럭 스트럭처
//  프라퍼티 설명: 글, 이미지, 타입, 해당 인물
struct Chat {
    let text: String
    let image: String
    let type: ChatType
    let who: GameCharactersEnum
    let characterFace : Bool
}


//선택지 누르면 변경될 호감도
// 프라퍼티 설명:  해당 인물, 변경될 호감도 수치
struct ChoiceLikeability {
    let who: GameCharacter
    let number: Int
}

//선택지
// 프라퍼티 설명: 선택지 텍스트, 변경될 호감도
struct Choice {
    let text: String
    let likability: [ChoiceLikeability]
    let nextTextIndex: String
}

//n일차를 쪼갠 조각의 단위 : 일반 대화들 ~ 키렐 선택지가 마지막.
// 에피소드를 어떤 단위대로 쪼개야 할지 고민했음. 이거 게임 구조가 이랬음.[ 캐릭터들 대사가 자동으로 나옴 -> 키렐 선택지 나옴 -> 자동으로 나오던 대사는 멈춤 -> 키렐 선택지 결정하면 그 다음 대사들이 결정되고 또 자동으로 나옴] -> 그러니까 키렐 대사 선택지가 나오면 게임 진행이 멈춤. 그리고 이 선택을 기점으로 다음 내용이 결정되고, 진행이 되는 거임. 그러려면 키렐 대사 선택지는 하나하나 쪼개야 하나하나 쪼개야 했음. 그래서 본문을 이렇게 나눔.[키렐 대사 선택 직후 시작되는 인물들 대사부터 선택지 나오기 직전까지의 대화 내용 + 키렐 선택지]. 이 단위가 여러 개 이어지면 [대사-> 선택지-> 대사-> 선택지...]인 거고 이러면 괜찮지 않을까 싶었음.
// 프라퍼티 설명: 순차적으로 나오는 텍스트 블록, 선택지, 이거 깨면 달성되는 업적
struct BlockOfDayEpisode {
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
    let storyBlocks: [String:BlockOfDayEpisode]
    
    let currentCharacterNote: [GameCharacter]
    
    let currentHistoryNote: [History]
}

// 더미데이터 담을 스트럭처
// 총 스토리 본문, 모든 히스토리, 모든 업적, 전체 인물 정보
struct Data {
    let stories: [Episode]
    let histories: [[Int:History]]
    let achivements: [[Int:Achievement]]
    let gameCharacters: GameCharacters
}

enum GameCharactersEnum {
    case kirell
    case argo
    case unknown
    case wolf
    case ballam
    
    func info() -> GameCharacter {
        switch self {
        case .kirell:
            return GameCharacter(name: "키렐", profileImage: "", backGroundImage: "", infomation: [], Mission: "나침반")
        case .argo:
            return GameCharacter(name: "아르고", profileImage: "", backGroundImage: "",  infomation: [], Mission: "가까운 사람")
        case .unknown:
            return GameCharacter(name: "???", profileImage: "", backGroundImage: "",  infomation: [], Mission: "")
        case .wolf:
            return GameCharacter(name: "상처 입은 남자", profileImage: "", backGroundImage: "",  infomation: [], Mission: "")
        case .ballam:
            return GameCharacter(name: "발람", profileImage: "", backGroundImage: "",  infomation: [], Mission: "")
        }
    }
}
var currentCharactersInfo: [String:GameCharacter]
    

    = ["kirell":GameCharacter(name: "키렐", profileImage: "kirell", backGroundImage: "kirell", infomation: ["사후의 세계에 떨어지면서 이름 외에 생전의 모든 기억을 잃었다."], Mission: "나침반을 따라가라.", likability: 66),
       "argo":GameCharacter(name: "아르고", profileImage: "argo", backGroundImage: "argo", infomation: ["아르고는 남자다.", "아르고는 자연곱슬이다.","아르고는 고양이상이다."], Mission: "친한 동료를 죽여라", likability: 0),
        "unknown":GameCharacter(name: "???", profileImage: "unknown", backGroundImage: "unknown", infomation: ["정보가 없습니다."], Mission: "나침반을 따라가라.", likability: 0),
        "wolf":GameCharacter(name: "울프", profileImage: "unknown", backGroundImage: "unknown", infomation: ["정보가 없습니다."], Mission: "나침반을 따라가라.", likability: 87),
        "ballam":GameCharacter(name: "발람", profileImage: "ballam", backGroundImage: "ballam", infomation: ["그의 과제는 누군가를 죽이는 것이 분명하다. 과제를 완료할 때까지 사람을 죽일 생각인 것 같다."], Mission: "나침반을 따라가라.", likability: 77),
        "karon":GameCharacter(name: "카론", profileImage: "karon", backGroundImage: "karon", infomation: ["죽은 사람을 인도하는 역할을 가진 듯하다."], Mission: "나침반을 따라가라.", likability: 0),
        "hilde":GameCharacter(name: "힐데", profileImage: "hilde", backGroundImage: "hilde", infomation: ["밝은 성격에 감정도 풍부해 함께 있으면 편안하다. 다만 겁이 많아서 걱정이다."], Mission: "나침반을 따라가라.", likability: 0),
        "philio":GameCharacter(name: "필리오", profileImage: "philio", backGroundImage: "philio", infomation: ["기회 잃은 망자들은 필리오를 공격하지 않는다. 심지어 그의 주변에 다가오지도 않는다."], Mission: "나침반을 따라가라.", likability: 88),]
