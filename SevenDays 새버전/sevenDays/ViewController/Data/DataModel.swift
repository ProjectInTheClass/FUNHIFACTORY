//
//  DataModel.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import Foundation

//타임라인은 어떻게 하면 좋을지 생각이 안 나서 내용에서 일단 비워뒀어요
//------------------------------------설정------------------------------------

//설정 - 언어
enum Language {
    case Korean
    case English
    case Japanese
    case Chinese
    
}
// 프라퍼티 설명:  언어 설정, 배경음, 효과음, 넘김 속도
struct Setting {
    var langueage: Language
    var bgmVolume: Double
    var effectVolume: Double
    var textSpeed: Double
    
}

//------------------------------------히스토리: 업적 비슷한 개념------------------------------------
// 히스토리: 키렐이 매일 꾸는 꿈 내용.
// 프라퍼티 설명:  히스토리 이름, 해당 이미지, 글
struct HistoryAndAchievementStructure {
    let name: String
    let image: String
    let text: String
}

// 개수가 한정적이므로 enum으로 처리. 아래 case들은 게임 내 1~4일차 꿈들 임시로 만들어 본 것
// switch 함수로 바로 각 항목 데이터 넘기는 걸 구상함
enum History {
    case theTestBegins
    case lastMemories
    case runawayGirl
    case thePatronsConcerns
    
    func historyInfo() -> HistoryAndAchievementStructure {
    switch self {
    case .theTestBegins:
        return HistoryAndAchievementStructure(name: "시련의 시작", image: "historyImage1", text: "사자의 나침반이 가리키는 방향으로 가십시오.") //나침반의 바늘이 돌고 있지만\n주변에 죽은 자가 있을 때\n가야 할 방향을 가리킬 것입니다.
    case .lastMemories:
        return HistoryAndAchievementStructure(name: "마지막 기억", image: "historyImage2", text: "이것은 죽기 전 마지막 장면인가?")
    case .runawayGirl:
        return HistoryAndAchievementStructure(name: "가출", image: "historyImage3", text: "그 쓰레기는 술을 마실 때마다 나를 때리고 그걸 말리러 온 엄마를 때렸다.")
    case .thePatronsConcerns:
        return HistoryAndAchievementStructure(name: "후견인의 걱정", image: "historyImage4", text: "그 사람은 쓸데없는 사람까지 처리했다며 나를 꾸짖었다.")
    default:
        break
        
        }
    }
}

//------------------------------------업적------------------------------------
//업적 : 게임 도전 과제 - 특정 대사를 들으면 달성됨. 해당 날(n일차) 마지막 대사 나오고 도전과제 달성되었다는 상단 팝업이 화면에 뜸
// 히스토리랑 마찬가지로 한정된 갯수기 때문에 동일 스트럭처 사용함
// 프라퍼티 설명: 위와 동일

enum Achievement {
    case charonsInterrogation
    case firstComradeArgo
    case likeAWelllAgedWhiskey
    case whereIBelong
    
    func achievementInfo() -> HistoryAndAchievementStructure {
    switch self {
    case .charonsInterrogation:
        return HistoryAndAchievementStructure(name: "카론의 심문", image: "achievementImage1", text: "생과 사의 경계에 있는 최후의 꿈에 오신 것을 환영합니다.")
    case .firstComradeArgo:
        return HistoryAndAchievementStructure(name: "첫 동료 아르고", image: "achievementImage2", text: "흠.... 키렐, 그 말은 제가 동료가 되는 게 당신에게 무조건 유리하다는 뜻인가요?")
    case .likeAWelllAgedWhiskey:
        return HistoryAndAchievementStructure(name: "중년의 품격", image: "karonBook", text: "...이럴 땐 제 과제가 참 어렵습니다.")
    case .whereIBelong:
        return HistoryAndAchievementStructure(name: "내가 있을 장소", image: "karonRoom", text: "이곳 생활이 재미있어질 것 같네요.")
    default:
        break
        
        }
    }
}

//------------------------------------게임 캐릭터 : 키렐 포함 모든 인물들------------------------------------

// 키렐 포함 인물들 정보를 담기 위한 스트럭처
// 프라퍼티 설명:  인물 이름, 대표 이미지, 키렐이 관찰기록한 듯한 내용의 해당 인물 정보들(인물상세페이지에 있음), 시련 미션, 호감도
class GameCharacter {
    let name: String
    let profileImage: String
    let backgroundImage: String
    let infomation: [String]
    let mission : String
    var likability: Int
    
    init(name: String, profileImage: String, backgroundImage: String, infomation: [String], mission : String, likability: Int) {
        self.name = name
        self.profileImage = profileImage
        self.backgroundImage = backgroundImage
        self.infomation = infomation
        self.mission = mission
        self.likability = likability
    }
     
}
//----------얘는 유저스트럭처에 포함됨-----------

//유저가 파악한 현재 인물들 정보를 반영해 넣을 스트럭처

//---------- 캐릭터 인스턴스 인스턴스. 여기서 다 참조해서 쓰는 거임. 이넘 안의 캐릭터 정보도 여기에서 가져다 썼음.(GameCharacter는 스트럭처->클래스로 타입 수정함)
var currentCharactersInfo: [String:GameCharacter]
    

    = ["kirell":GameCharacter(name: "키렐", profileImage: "kirell", backgroundImage: "kirell", infomation: [], mission: "나침반을 따라가라.", likability: 66),
        "argo":GameCharacter(name: "아르고", profileImage: "argo", backgroundImage: "argo", infomation: ["아르고는 남자다.", "아르고는 자연곱슬이다.","아르고는 고양이상이다."], mission: "친한 동료를 죽여라", likability: 0),
        "unknown":GameCharacter(name: "???", profileImage: "", backgroundImage: "", infomation: [], mission: "나침반을 따라가라.", likability: 0),
        "wolf":GameCharacter(name: "울프", profileImage: "", backgroundImage: "", infomation: [], mission: "나침반을 따라가라.", likability: 87),
        "ballam":GameCharacter(name: "발람", profileImage: "ballam", backgroundImage: "ballam", infomation: [], mission: "나침반을 따라가라.", likability: 77),
        "karon":GameCharacter(name: "카론", profileImage: "karon", backgroundImage: "karon", infomation: [], mission: "나침반을 따라가라.", likability: 0),
        "hilde":GameCharacter(name: "힐데", profileImage: "hilde", backgroundImage: "hilde", infomation: [], mission: "나침반을 따라가라.", likability: 0),
        "philio":GameCharacter(name: "필리오", profileImage: "philio", backgroundImage: "philio", infomation: [], mission: "나침반을 따라가라.", likability: 88),]

let noDataCharacter = GameCharacter(name: "캐릭터가 없습니다", profileImage: "", backgroundImage: "", infomation: [], mission: "", likability: 0)


//------------------------------------유저------------------------------------

//  프라퍼티 설명: 설정, 티켓(게임화폐), 유저가 달성한 히스토리, 유저가 달성한 업적, 타임라인(?), 유저가 파악한 캐릭터들 정보
// 게임 캐릭터 : 딕셔너리 형태로 바꿈. [인물영어이름:게임캐릭터 인스턴스] 구조임.
struct User {
    var setting: Setting
    var tickets: Int
    var currentHistories: [History]
    var currentAchievements: [Achievement]
    //var timellne: nil
    var currentGameCharacter: [String:GameCharacter] = currentCharactersInfo
    var dayIndex:Int
    var dayId:String
    var currentChatId:String
}
func currentDay() -> DayEpisode{
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
    case touchableImage
    case untouchableImage
    case textPopup
    case animationPopup
    case sectionHeader
    case fullImage
    case choice
}

// 텍스트 블럭 스트럭처
//  프라퍼티 설명: 글, 이미지, 타입, 해당 인물
struct Chat {
    let text: String
    let image: String
    let type: ChatType
    let who: GameCharactersEnum
    let characterFace: Bool
    let isItLastPage : Bool
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
    let nextTextId: String
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
// 프라퍼티 설명: 히스토리(그 날 꿈), 본문 블록(위 스트럭처 단위)들
struct DayEpisode {
    let startEpisode : String
    let chapter: Chapter
    let history: History
    let storyBlocks: [String:BlockOfDayEpisode]
}

// 더미데이터 담을 스트럭처
// 총 스토리 본문, 모든 히스토리, 모든 업적, 전체 인물 정보
struct GameData{
    let stories: [String:DayEpisode]
    let histories: [History]
    let achivements: [Achievement]
    let FullGameCharactersInfo: [String:GameCharacter]
}
struct Chapter {
    let chapterNumber : Int
    let chapterName : String
    let chapterInfo : String
    let chapterImage : String
}

// 게임 캐릭터 클래스로 바꾼 것. 이 info() 안에 있는 게 현재 캐릭터 정보 원본 인스턴스. 여기서도 참조해서 쓰면 돼요.
enum GameCharactersEnum {
    case kirell
    case argo
    case unknown
    case wolf
    case ballam
    case karon
    case hilde
    case philio
    
    func info() -> GameCharacter {
        
        switch self {
        case .kirell:
            if let kirell = currentCharactersInfo["kirell"] {
                return kirell
            } else {
             return noDataCharacter
            }
            
        case .argo:
            if let argo = currentCharactersInfo["argo"] {
                return argo
            } else {
                return noDataCharacter
               }
        case .unknown:
            if let unknown = currentCharactersInfo["unknown"] {
                return unknown
            } else {
                return noDataCharacter
               }
        case .wolf:
            if let wolf = currentCharactersInfo["wolf"] {
                return wolf
            } else {
                return noDataCharacter
               }
        case .ballam:
            if let ballam = currentCharactersInfo["ballam"] {
                return ballam
            } else {
                return noDataCharacter
               }
        case .karon:
            if let karon = currentCharactersInfo["karon"] {
                return karon
            } else {
                return noDataCharacter
               }
        case .hilde:
            if let hilde = currentCharactersInfo["argo"] {
                return hilde
            } else {
                return GameCharacter(name: "캐릭터가 없습니다", profileImage: "", backgroundImage: "", infomation: [], mission: "", likability: 0)
               }
        case .philio:
            if let philio = currentCharactersInfo["argo"] {
                return philio
            } else {
                return GameCharacter(name: "캐릭터가 없습니다", profileImage: "", backgroundImage: "", infomation: [], mission: "", likability: 0)
               }
        }
    
}
}
