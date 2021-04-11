//
//  DataModel.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import Foundation
import UIKit

//MARK: 구조체(Struct, Class, Enum), 변수
//------------------------------------설정------------------------------------

// 프라퍼티 설명:  언어 설정, 배경음, 효과음, 넘김 속도
struct Setting : Codable{
    var bgmVolume: Float
    var effectVolume: Float
    var textSpeed: Double
    var darkmode: Bool
    var vibration : Bool
}
var xImage: String {
    if playerSetting.darkmode {
        return "black x"
    } else {
        return "white x"
    }
}

//일반 색깔
//var colorTopbarLine: UIColor {
//    if player.setting.darkmode {
//        return UIColor(hex: "#D9D9D9", alpha: 1)
//    } else {
//        return UIColor(hex: "#FFFFFF", alpha: 1)
//    }
//}
//
//var colorWhite: UIColor {
//    if player.setting.darkmode {
//        return UIColor(hex: "#FFFFFF", alpha: 1)
//    } else {
//        return UIColor(hex: "#D9D9D9", alpha: 1)
//    }
//}
//var colorBlack: UIColor {
//    if player.setting.darkmode {
//        return UIColor(hex: "#000000", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1)
//    }
//}
////시작 버튼 색깔
//var colorEPCellBackground: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#C4C4C4", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.862, green: 0.862, blue: 0.862, alpha: 1)
//    }
//}
//var colorEPCellTouchedBackground: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#959595", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}
//
//var colorEPCellspine: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#7A7A7A", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}
//
//// 팝업 뷰 색깔
//var colorPopupHeader: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#313131", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}
//
//var colorPopupButtonBackground: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#B8B8B8", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}
//
//var colorPopupButtonBorder: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#848484", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}
//
////수첩 색깔
//
//var colorNoteSelectedBackground: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#DCDCDC", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}
//
//var colorNoteUnselectedBackground: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#787878", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}
//
//var colorLockedViewBackground: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#3F3F3F", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}
//
//var colorNoteUnselectedEPNameText: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#717171", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}
//
////타임라인 색깔
//
//
//var colorTimelinePopupButtonBackground: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#656565", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}
//
//var colorTimelinePopupButtonBorder: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#E5E5E5", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}
//
////호감도 색깔
//
//var colorLikability: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#92A5B6", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}
//
////메인게임의 업적 획득 팝업 배경 색깔
//
//var colorMaingameGetAchievementPopupBackground: UIColor {
//    if !player.setting.darkmode {
//        return UIColor(hex: "#D6EBFF", alpha: 1)
//    } else {
//        return UIColor(displayP3Red: 0.479, green: 0.479, blue: 0.479, alpha: 1)
//    }
//}


//------------------------------------수첩 사건------------------------------------

// player.currentEpisodes에서 현재 플레이중인 episode 골라내는 인덱스. 현재 에피소드 이름으로 식별함.
var currentEpIndex: Int {
    get {
        if currentDay().episodePlace == "프롤로그" {
            return 0
        } else if currentDay().episodePlace == "임진왜란" {
            return 1
        } else if currentDay().episodePlace == "인조반정" {
            return 2
        } else if currentDay().episodePlace == "3.1 운동" {
            return 3
        } else if currentDay().episodePlace == "내 생일" {
            return 4
        } else {
            print("currentEpIndex 없음. 수정 필요")
            return 0
        }
    }
}
//수첩 사건

enum NoteCaseID: String,Codable{
    case case101
    case case201
    case case301
    case case401
}
class NoteCase: Codable{
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


enum AchievementID: String,Codable {
    case donhwamun,geumcheongyo,injeongjeon,cat,necklace,faith //프롤로그
}
// 프라퍼티 설명: 업적 이름, 업적 이미지, id(업적 획득 로직에서 사용), 업적 잠금 여부
struct Achievement: Codable {
    let name: String
    let image: String
    let id: AchievementID
    var isLocked: Bool
}

//------------------------------------앨범 이미지------------------------------------

enum AlbumImageID: String,Codable{
// case는 가독성 좋게 하나하나 만드는 게 좋다고 희종쌤께 피드백 들은 적 있음
    case prologueCase1
    case achievement1Locked
    case chapter2case1
    case chapter2case2
    case chapter2case3

    case donhwamun
    case geumcheongyo
    case injeongjeon
    case necklace
   

    
    func info() -> AlbumImage{
        switch self {
        case .donhwamun:
                return prologueChapter.currentAlbumImages[0]
        case .geumcheongyo:
                return prologueChapter.currentAlbumImages[1]
        case .injeongjeon:
                return prologueChapter.currentAlbumImages[2]
        case .necklace:
                return prologueChapter.currentAlbumImages[3]
        case .prologueCase1:
            return chapter1.currentAlbumImages[0]
        case .achievement1Locked:
            return chapter1.currentAlbumImages[1]
        case .chapter2case1:
                return chapter2.currentAlbumImages[0]
        case .chapter2case2:
                return chapter2.currentAlbumImages[1]
        case .chapter2case3:
                return chapter2.currentAlbumImages[2]

        }
        
    }
}
class AlbumImage: Codable {
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
enum InfomationID: String, Codable {
    case hwiryeong1
    case hwiryeong2
    case hwiryeong3
    case hwiryeong4
    case hwiryeong5
    case teacher1
    case teacher2
    case teacher3
    case teacher4
    case leegyi1
    case leegyi2
    case kimjajeom1
    case kimjajeom2
    case kimjajeom3
    case kimsanggung1
    case kimsanggung2
    case kimsanggung3
    case kimsanggung4
    case kimsanggung5
    case kimsanggung6
}

// id(정보 획득 로직에서 사용), 업적 잠금 여부, 정보 텍스트
class Infomation: Codable {
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

enum GameCharacterID: String,Codable {
    case danhee
    case hwiryeong
    case tourguide
    case teacher
    
    func info() -> GameCharacter{
        switch self {
        case .danhee:
            return prologueChapter.currentCharacterNote[0]
        case .hwiryeong:
            return prologueChapter.currentCharacterNote[1]
        case .tourguide:
            return prologueChapter.currentCharacterNote[2]
        case .teacher:
            return prologueChapter.currentCharacterNote[3]
        }
    }
}

// gameCharacter는 참조 기능 필요해서 class임
// 프라퍼티 설명: 등장인물 이름, 프로필 이미지, 배경 이미지, 등장인물 설명, 등장인물 정보 목록, 호감도, 잠금 여부
class GameCharacter: Codable {
    let name: String
    let profileImage: String
    let backGroundImage : String
    //노트 인물 페이지 셀에 들어갈 주인공 설명
    let description: String
    var infomation: [Infomation]
    var likability: Int
    var isLocked: Bool
   
    
    init(name: String, profileImage: String ,backGroundImage: String, description: String, infomation: [Infomation], likability:Int, isLocked: Bool) {
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
struct User: Codable {
    var setting: Setting
    var currentEpisodes: [Episode]
    //var timellne: nil
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
    var currentChatId: String
    var currentChatArray: [Chat]
    var currentGodChatArray: [Chat]
    var indexNumber = 0 
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
    return currentDay().storyBlocks[player.currentChatId]!.chats[player.indexNumber].type
}
//------------------------------------스토리------------------------------------

// 대화할 때 나오는 텍스트 블럭 "종류"
// 프라퍼티 설명:  그냥 글, 터치하면 확대되는 큰 이미지, 터치 안 되는 작은 이미지, 팝업(키렐 혼잣말), 팝업(짤막한 움짤), 섹션 해더같은 애
enum ChatType: String, Codable{
    case onlyText
    case untouchableImage
    case sectionHeader
    case choice
    case monologue
    case ar
}

// 텍스트 블럭 스트럭처
//  프라퍼티 설명: 글, 이미지, 타입, 해당 인물
struct Chat: Codable {
    let text: String
    let image: String
    let type: ChatType
    let who: GameCharacterID
    let characterFace : CharacterFace
    let optionalOption: OptionalOption?
    let animationOption : screenAnimation
}

struct OptionalOption: Codable {
    let achievementToUnlock: AchievementID?
    let infomationToUnlock: InfomationID?
    let gameCharacterToUnlock: GameCharacterID?
    let caseToUnlock: NoteCaseID?
    let albumImageToUnlock: AlbumImageID?
}

//선택지 누르면 변경될 호감도
// 프라퍼티 설명:  해당 인물, 변경될 호감도 수치
struct ChoiceLikeability: Codable {
    let who: GameCharacterID
    let number: Int
}

//선택지
// 프라퍼티 설명: 선택지 텍스트, 변경될 호감도
struct Choice: Codable {
    let text: String
    let likability: [ChoiceLikeability]
    let chatType: ChatType
    let characterFace : CharacterFace
    let nextTextIndex: String
    let optionalOption: OptionalOption?
}

enum  screenAnimation: String, Codable {
    case none
    case fadeIn
    case fadeOut
}
enum backGroundMusic : String, Codable{
    case none
    case normal
    func info() -> String{
        switch self {
        case .none:
            return ""
        case .normal:
            return "mainGameBGM"
        }
    }
}
//n일차를 쪼갠 조각의 단위 : 일반 대화들 ~ 키렐 선택지가 마지막.
// 에피소드를 어떤 단위대로 쪼개야 할지 고민했음. 이거 게임 구조가 이랬음.[ 캐릭터들 대사가 자동으로 나옴 -> 키렐 선택지 나옴 -> 자동으로 나오던 대사는 멈춤 -> 키렐 선택지 결정하면 그 다음 대사들이 결정되고 또 자동으로 나옴] -> 그러니까 키렐 대사 선택지가 나오면 게임 진행이 멈춤. 그리고 이 선택을 기점으로 다음 내용이 결정되고, 진행이 되는 거임. 그러려면 키렐 대사 선택지는 하나하나 쪼개야 하나하나 쪼개야 했음. 그래서 본문을 이렇게 나눔.[키렐 대사 선택 직후 시작되는 인물들 대사부터 선택지 나오기 직전까지의 대화 내용 + 키렐 선택지]. 이 단위가 여러 개 이어지면 [대사-> 선택지-> 대사-> 선택지...]인 거고 이러면 괜찮지 않을까 싶었음.
// 프라퍼티 설명: 순차적으로 나오는 텍스트 블록, 선택지, 이거 깨면 달성되는 업적
struct BlockOfDayEpisode: Codable {
    let chats: [Chat]
    //다음 페이지(?)블럭(?)을 선택하는 로직을 좀 더 간결하게 할 수 있을지 고민하다 딕셔너리 어떨까 생각함. 원래는 다음 페이지를 nextIndexPage값으로 했다면, 이번에는 key값을 이용해보는 거? 만약 key 값이 각가 1, 2를 가진 선택지가 있따면, 현재 페이지 번호에 선택지 key 값인 1, 2를 더한 수를 가진 페이지가 다음 페이지가 됨. 예를 들어서 3번 페이지에서 1번 선택지를 고르면 1+1= 2번 페이지로 가게 되고, 2번을 고르면 1+2 = 3번 페이지로 가게 됨.
        // 그런데 json을 읽어올 때 데이터를 dictionary화 시키는 작업이 번거로워서 코드가 복잡해질 거 같음 (디코드 과정 중)
    // choices: [[다음페이지 결정짓는 key값 : 선택지 텍스트]]
    let choices: [Choice]
    let choiceSkip : Bool
    let isGodChat : isGodChat   //현재 신 채팅인지 구분
    let backGroundMusic : backGroundMusic
}
enum isGodChat : String,Codable{
    case on, off
}
//n일차
// 프라퍼티 설명: 에피소드 이름(ex)인조반정), 에피소드 연도(1xxx년), 에피소드 설명(인조반정에서 무슨 일이 일어날 예정이다 과연 주인공은 이를 막을 수 있을까? 어쩌구저쩌구), 에피소드 이미지(전각 이미지)스토리블럭(대사 인스턴스)
struct Episode: Codable {
    
    let episodeID: String
    //(예시 : 임진왜란)
    let episodePlace: String
    
    //(예시 : 1592)
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
    
    let timelineSavePoint:[[Savepoint]]
}

struct Savepoint: Codable {
    //이름
    let name: String
    //블럭 인덱스
    let storyBlockIndex: String
}

// 더미데이터 담을 스트럭처
// 총 스토리 본문, 모든 히스토리, 모든 업적, 전체 인물 정보
struct GameData {
    let stories: [String:Episode]
    let histories: [String:NoteCase]
    let achivements: [String:Achievement]
}

enum CharacterFace: String, Codable{
    case none,angry1,angry2,basic,cry1,cry2,happy1,happy2,happy3,sad,scared,straight,surprise1,surprise2
}

var globalPopupOpen: Bool = false







//MARK: 함수, Extension
//-------------------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//일단 만들어놓은 인물들 샘플 정보 변수입니다.

//json 파싱 전용 파일
struct BlockOfDayEpisodeForJson :Codable{
    let id : String
    let chats: [Chat]
    
    //다음 페이지(?)블럭(?)을 선택하는 로직을 좀 더 간결하게 할 수 있을지 고민하다 딕셔너리 어떨까 생각함. 원래는 다음 페이지를 nextIndexPage값으로 했다면, 이번에는 key값을 이용해보는 거? 만약 key 값이 각가 1, 2를 가진 선택지가 있따면, 현재 페이지 번호에 선택지 key 값인 1, 2를 더한 수를 가진 페이지가 다음 페이지가 됨. 예를 들어서 3번 페이지에서 1번 선택지를 고르면 1+1= 2번 페이지로 가게 되고, 2번을 고르면 1+2 = 3번 페이지로 가게 됨.
    // choices: [[다음페이지 결정짓는 key값 : 선택지 텍스트]]
    let choices: [Choice]
    let choiceSkip : Bool
    let isGodChat : isGodChat
    let backGroundMusic : backGroundMusic
}

open class CustomLabel : UILabel {
    @IBInspectable open var characterSpacing:CGFloat = 1 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }

    }
    @IBInspectable open var lineSpacing:CGFloat = 1 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: self.lineSpacing, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }

    }
    
}

extension UILabel {

    func setLineSpacing(lineSpacing: CGFloat) {

        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        

        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        // (Swift 4.2 and above) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
    func setCharacterSpacing(characterSpacing: CGFloat) {

        guard let selfText = self.text else { return }
        let attributedString = NSMutableAttributedString(string: selfText)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
     
    }
}
// view 코너마다 다른 radius 값 주기 위한 extension
extension UIBezierPath {
    convenience init(shouldRoundRect rect: CGRect, topLeftRadius: CGSize = .zero, topRightRadius: CGSize = .zero, bottomLeftRadius: CGSize = .zero, bottomRightRadius: CGSize = .zero){

        self.init()

        let path = CGMutablePath()

        let topLeft = rect.origin
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)

        if topLeftRadius != .zero{
            path.move(to: CGPoint(x: topLeft.x+topLeftRadius.width, y: topLeft.y))
        } else {
            path.move(to: CGPoint(x: topLeft.x, y: topLeft.y))
        }

        if topRightRadius != .zero{
            path.addLine(to: CGPoint(x: topRight.x-topRightRadius.width, y: topRight.y))
            path.addCurve(to:  CGPoint(x: topRight.x, y: topRight.y+topRightRadius.height), control1: CGPoint(x: topRight.x, y: topRight.y), control2:CGPoint(x: topRight.x, y: topRight.y+topRightRadius.height))
        } else {
             path.addLine(to: CGPoint(x: topRight.x, y: topRight.y))
        }

        if bottomRightRadius != .zero{
            path.addLine(to: CGPoint(x: bottomRight.x, y: bottomRight.y-bottomRightRadius.height))
            path.addCurve(to: CGPoint(x: bottomRight.x-bottomRightRadius.width, y: bottomRight.y), control1: CGPoint(x: bottomRight.x, y: bottomRight.y), control2: CGPoint(x: bottomRight.x-bottomRightRadius.width, y: bottomRight.y))
        } else {
            path.addLine(to: CGPoint(x: bottomRight.x, y: bottomRight.y))
        }

        if bottomLeftRadius != .zero{
            path.addLine(to: CGPoint(x: bottomLeft.x+bottomLeftRadius.width, y: bottomLeft.y))
            path.addCurve(to: CGPoint(x: bottomLeft.x, y: bottomLeft.y-bottomLeftRadius.height), control1: CGPoint(x: bottomLeft.x, y: bottomLeft.y), control2: CGPoint(x: bottomLeft.x, y: bottomLeft.y-bottomLeftRadius.height))
        } else {
            path.addLine(to: CGPoint(x: bottomLeft.x, y: bottomLeft.y))
        }

        if topLeftRadius != .zero{
            path.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y+topLeftRadius.height))
            path.addCurve(to: CGPoint(x: topLeft.x+topLeftRadius.width, y: topLeft.y) , control1: CGPoint(x: topLeft.x, y: topLeft.y) , control2: CGPoint(x: topLeft.x+topLeftRadius.width, y: topLeft.y))
        } else {
            path.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y))
        }

        path.closeSubpath()
        cgPath = path
    }
}
// view 코너마다 다른 radius 값 주기 위한 extension 2
//위의 extension은 준비 단계고, 여기 있는 메소드를 쓰면 되는 거.
//view.roundCorners(...)  사용하면 됨.
extension UIView{
    func roundCorners(topLeft: CGFloat = 0, topRight: CGFloat = 0, bottomLeft: CGFloat = 0, bottomRight: CGFloat = 0) {//(topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat) {
        let topLeftRadius = CGSize(width: topLeft, height: topLeft)
        let topRightRadius = CGSize(width: topRight, height: topRight)
        let bottomLeftRadius = CGSize(width: bottomLeft, height: bottomLeft)
        let bottomRightRadius = CGSize(width: bottomRight, height: bottomRight)
        let maskPath = UIBezierPath(shouldRoundRect: bounds, topLeftRadius: topLeftRadius, topRightRadius: topRightRadius, bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius)
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}

extension UIColor {
    public convenience init(hex: String, alpha: CGFloat) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = alpha

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        self.init(red: 0, green: 0, blue: 0, alpha: 1)
        return
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
// saving Data : 데이터 로컬에서 불러오기
func loadFromFile() {
    let documentsDirectory =
      FileManager.default.urls(for: .documentDirectory,
      in: .userDomainMask).first!
    let archiveURL =
      documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
    let propertyListDecoder = PropertyListDecoder()
   
    if let retrievedNotesData = try? Data(contentsOf: archiveURL), let decodedNotes = try? propertyListDecoder.decode(User.self, from:retrievedNotesData) {
        print(decodedNotes)
        player = decodedNotes
        print("이야아아아ㅏ아아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아야아아아ㅏ아아\(player.currentChatArray)")
    }
}


