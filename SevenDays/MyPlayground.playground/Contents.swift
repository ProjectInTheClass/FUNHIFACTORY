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
struct HistoryStructure {
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
    
    func historyInfo() -> HistoryStructure {
    switch self {
    case .theTestBegins:
        return HistoryStructure(name: "시련의 시작", image: "", text: "사자의 나침반이 가리키는 방향으로 가십시오.")
    case .lastMemories:
        return HistoryStructure(name: "마지막 기억", image: "", text: "이것은 죽기 전 마지막 장면인가?")
    case .runawayGirl:
        return HistoryStructure(name: "가출", image: "", text: "그 쓰레기는 술을 마실 때마다 나를 때리고 그걸 말리러 온 엄마를 때렸다.")
    case .thePatronsConcerns:
        return HistoryStructure(name: "후견인의 걱정", image: "", text: "그 사람은 쓸데없는 사람까지 처리했다며 나를 꾸짖었다.")
    default:
        break
        
        }
    }
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
    let backgroundImage: String
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
    var gameChracters: GameCharacters
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
}

// 텍스트 블럭 스트럭처
//  프라퍼티 설명: 글, 이미지, 타입, 해당 인물
struct Chat {
    let text: String?
    let image: String?
    let type: ChatType
    let who: GameCharactersEnum
    let characterFace: Bool
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
    let nextTextIndex: Int
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
}
//n일차
// 프라퍼티 설명: 히스토리(그 날 꿈), 본문 블록(위 스트럭처 단위)들
struct DayEpisode {
    let history: History
    let storyBlocks: [BlockOfDayEpisode]
}

// 더미데이터 담을 스트럭처
// 총 스토리 본문, 모든 히스토리, 모든 업적, 전체 인물 정보
struct Data {
    let stories: [DayEpisode]
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
    case karon
    
    func info() -> GameCharacter {
        switch self {
        case .kirell:
            return GameCharacter(name: "키렐", profileImage: "", backgroundImage: "", infomation: [], Mission: "나침반")
        case .argo:
            return GameCharacter(name: "아르고",profileImage: "", backgroundImage: "", infomation: [], Mission: "가까운 사람")
        case .unknown:
            return GameCharacter(name: "???", profileImage: "", backgroundImage: "", infomation: [], Mission: "")
        case .wolf:
            return GameCharacter(name: "상처 입은 남자", profileImage: "", backgroundImage: "", infomation: [], Mission: "")
        case .ballam:
            return GameCharacter(name: "발람", profileImage: "", backgroundImage: "", infomation: [], Mission: "")
        case .karon:
            return GameCharacter(name: "카론", profileImage: "", backgroundImage: "", infomation: [], Mission: "")
        }
        
    }
}

let day0 = DayEpisode(history: <#T##History#>, storyBlocks: [
    BlockOfDayEpisode(chats:
                    [Chat(text: "으으, 추워. 여긴 어디지?", image: nil, type: .textPopup, who: .kirell, characterFace: false),
                    Chat(text: nil, image: "karonRoom", type: .untouchableImage, who: .karon, characterFace: true),
                    Chat(text: "살벌한 꿈이군요.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                    Chat(text: "하필이면 취조실이라니.", image: nil, type: .onlyText, who: .karon, characterFace: false)], choices: [Choice(text: "누구냐!?", likability: [], nextTextIndex: 1), Choice(text: "누군진 몰라도 지금 상황을 설명해주겠어?", likability: [], nextTextIndex: 1)], achievement: nil),
    BlockOfDayEpisode(chats:
                        [Chat(text: "저는 죽음의 안내자 카론.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                         Chat(text: "생과 사의 경계에 있는 최후의 꿈에 오신 것을", image: nil, type: .onlyText, who: .karon, characterFace: false),
                         Chat(text: "환영합니다.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                      choices: [
                        Choice(text: "대체 뭔 소리야?", likability: [], nextTextIndex: 2),
                        Choice(text: "죽음의 안내자? 지금 날 놀리는 건가?", likability: [], nextTextIndex: 2)], achievement: nil),
    BlockOfDayEpisode(chats:
                        [Chat(text: "당신은 죽었습니다.", image: nil, type: .onlyText, who: .karon, characterFace: true)],
                      choices: [
                        Choice(text: "그래서 어쩌라고?", likability: [], nextTextIndex: 3),
                        Choice(text: "죽은 사람이 어떻게 말을 할 수 있나?", likability: [], nextTextIndex: 3)], achievement: nil),
    BlockOfDayEpisode(chats:
                        [Chat(text: "당장은 이해가 안 되실 겁니다.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                         Chat(text: "망각의 강을 막 빠져나오셨으니까요.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                        choices: [
                         Choice(text: "아… 네… 그러세요….", likability: [], nextTextIndex: 4),
                         Choice(text: "뭐야, 무슨 영화나 소설 설정도 아니고.", likability: [], nextTextIndex: 4)], achievement: nil),
    BlockOfDayEpisode(chats:
                        [Chat(text: "의심을 풀기 위해, 하나 묻겠습니다.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                         Chat(text: "당신의 이름. 기억할 수 있습니까?", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                        choices: [
                         Choice(text: "나참. 어린애 장난도 아니고 유치하게", likability: [], nextTextIndex: 5),
                         Choice(text: "그 정도야 뭐.", likability: [], nextTextIndex: 5)], achievement: nil),
    BlockOfDayEpisode(chats:
                        [Chat(text: "...그런데 내 이름이 뭐였지?", image: nil, type: .onlyText, who: .kirell, characterFace: true),
                         Chat(text: "오기 전에 뭘 했죠? 사소한 거라도 말해보시죠.", image: nil, type: .onlyText, who: .karon, characterFace: true)],
                        choices: [
                            Choice(text: "아무것도... 모르겠어.", likability: [], nextTextIndex: 6),
                         Choice(text: "어... 어라. 너! 내 머릿소겡 뭘 한거지?", likability: [], nextTextIndex: 6)], achievement: nil),
    BlockOfDayEpisode(chats:
                        [Chat(text: "설명해 드리죠.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                         Chat(text: "당신의 이름은 키렐. \n망각의 강을 막 건넌", image: nil, type: .onlyText, who: .karon, characterFace: false),
                         Chat(text: "망자입니다.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                        choices: [
                         Choice(text: "사신. 망각의 강. 그리고 내 이름…\n알겠고. 본론이 뭐야?", likability: [], nextTextIndex: 7),
                         Choice(text: "젠장. 대체 어떻게 된거야?", likability: [], nextTextIndex: 7)], achievement: nil),
    BlockOfDayEpisode(chats:
                        [Chat(text: "당신은 현재 ‘죽음에 이르기 직전’에 있습니다. ", image: nil, type: .onlyText, who: .karon, characterFace: true),
                         Chat(text: "그런 당신에게 부활의 기회를 주려고 합니다.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                        choices: [
                         Choice(text: "점점 더 어처구니가 없군. 알았으니 계속 설명해봐.", likability: [], nextTextIndex: 8),
                         Choice(text: "다시 태어날 수 있는 건가?", likability: [], nextTextIndex: 8)], achievement: nil),
    BlockOfDayEpisode(chats:
                        [Chat(text: "부활 가능성이 있는 분을 안내하는 것이 제", image: nil, type: .onlyText, who: .karon, characterFace: true),
                         Chat(text: "역할입니다.", image: nil, type: .onlyText, who: .karon, characterFace: false),
                         Chat(text: "하지만 그냥은 안 됩니다. ", image: nil, type: .onlyText, who: .karon, characterFace: false),
                         Chat(text: "제가 정해주는 과제를 완료하셔야 합니다.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                        choices: [
                         Choice(text: "역시 공짜는 없군.", likability: [], nextTextIndex: 9),
                         Choice(text: "왜 그런게 필요하지?", likability: [], nextTextIndex: 9)], achievement: nil),
    BlockOfDayEpisode(chats:
                        [Chat(text: "부활하기 위해서는 자격이 필요합니다.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                         Chat(text: "그 자격을 확인하기 위한 시련인 것입니다.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                        choices: [
                         Choice(text: "운전면허 시험 같은 건가?", likability: [], nextTextIndex: 10),
                         Choice(text: "동화 속 주인공이 된 기분이군.", likability: [], nextTextIndex: 10)], achievement: nil),
    BlockOfDayEpisode(chats:
                        [Chat(text: "후후후, 재미있는 비유군요.", image: nil, type: .onlyText, who: .karon, characterFace: true)],
                        choices: [
                         Choice(text: "이런 말 하기는 그런데, 내가 왜 부활해야 하지?", likability: [], nextTextIndex: 11),
                         Choice(text: "날 부활시키면 당신에게 무슨 이득이야?", likability: [], nextTextIndex: 12)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "하지만 그건 제가 답할 의문이 아닙니다.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "당신이 찾아야 할 답입니다.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "", likability: [], nextTextIndex: 13),
                        Choice(text: "", likability: [], nextTextIndex: 13)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "다른 이유는 없습니다.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "이것이 제 사명이기 때문입니다.", image: nil, type: .onlyText, who: .karon, characterFace: false),
                        Chat(text: "그보다 당신이 부활해야 할 이유를 찾는 것이 낫지 않을까요?", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "", likability: [], nextTextIndex: 13),
                        Choice(text: "", likability: [], nextTextIndex: 13)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "당신은 기억이 없기 때문에 부활을 해야 할 이유도,", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "동기도 없을 겁니다.", image: nil, type: .onlyText, who: .karon, characterFace: false),
                        Chat(text: "살아야 할 이유를 찾지 못하고 저승을 떠도는", image: nil, type: .onlyText, who: .karon, characterFace: false),
                        Chat(text: "망자가 되고 싶지 않다면", image: nil, type: .onlyText, who: .karon, characterFace: false),
                        Chat(text: "우선은 스스로가 누군지 알아야 합니다.", image: nil, type: .onlyText, who: .karon, characterFace: false),
                        Chat(text: "자, 그럼.", image: nil, type: .onlyText, who: .karon, characterFace: false),
                        Chat(text: "키렐 당신에 대해 알아보죠.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "장난해? 방금까지 기억이 없다고 했잖아.", likability: [], nextTextIndex: 14),
                        Choice(text: "이미 망각의 강을 건넜는데?", likability: [], nextTextIndex: 14)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "기억은 없어도 됩니다.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "시련에 임하는 자신을 알리는 것이죠.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "머리 아픈 얘기가 나올 거 같은데.", likability: [], nextTextIndex: 15),
                        Choice(text: "나 자신을 알라 이건가.", likability: [], nextTextIndex: 15)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "이제부터 질문을 할 테니.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "마음 내키는 대로 대답하십시오.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "틀리면?", likability: [], nextTextIndex: 16),
                        Choice(text: "신중하게 답해야 하는 건가?", likability: [], nextTextIndex: 16)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "정답은 없습니다.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "하지만 답변을 하면서 자신에 대해 알게 될 겁니다.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "스무고개 같은 느낌인데.", likability: [], nextTextIndex: 17),
                        Choice(text: "답변을 하면서 내 성격을 자연스럽게 드러낸다는 건가.", likability: [], nextTextIndex: 17)], achievement: nil),
    BlockOfDayEpisode(chats:
                        [Chat(text: "그렇다면 지금부터는 답변을 신중하게 해야겠군", image: nil, type: .textPopup, who: .kirell, characterFace: true),
                        Chat(text: "우선 첫 번째 주제의 질문입니다.", image: nil, type: .onlyText, who: .karon, characterFace: false),
                        Chat(text: "키렐, 지금 당장 알고 싶은 정보가 있습니까?", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "음, 가족들에 대해 알고 싶어.", likability: [], nextTextIndex: 18),
                        Choice(text: "죽은 이유를 알고 싶어.", likability: [], nextTextIndex: 27)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "대부분 죽기 전 가족을 떠올리시죠.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "당신의 가족이 어떻게 있기를 바랍니까?", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "슬퍼하고 있었으면 해.", likability: [], nextTextIndex: 19),
                        Choice(text: "당연히 행복했으면 해.", likability: [], nextTextIndex: 24)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "호오, 슬퍼하기를 바란다고요?", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "어째서입니까?", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "그만큼 나를 진심으로 사랑했다는 뜻이니까.", likability: [], nextTextIndex: 20),
                        Choice(text: "가족이 죽었는데 당연히 슬퍼해야지.", likability: [], nextTextIndex: 23)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "호오... 가족의 사랑을 확인하고 싶은 겁니까?", image: nil, type: .onlyText, who: .karon, characterFace: true)],
                       choices: [
                        Choice(text: "다음", likability: [], nextTextIndex: 22),
                        Choice(text: "다음", likability: [], nextTextIndex: 22)], achievement: nil),
    BlockOfDayEpisode(chats: //첫번째 질문, 문답 1, 21
                       [Chat(text: "", image: "book", type: .untouchableImage, who: .karon, characterFace: false),
                        Chat(text: "어디보자. 방금의 문답으로도", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "현실의 당신은 정이 많은 사람이라 할 수 있겠군요.", image: nil, type: .onlyText, who: .karon, characterFace: false),
                        Chat(text: "당신의 죽음에 슬퍼할 사람이 많을 거 같습니다.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: <#T##String#>, likability: [], nextTextIndex: <#T##Int#>),
                        Choice(text: <#T##String#>, likability: [], nextTextIndex: <#T##Int#>)], achievement: nil),
    BlockOfDayEpisode(chats: //첫번째 질문, 문답 2, 22
                       [Chat(text: "", image: "book", type: .untouchableImage, who: .karon, characterFace: false),
                        Chat(text: "어디보자. 방금의 문답으로도", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "현실에 대한 미련이 남아있는\n사람이라 할 수 있겠군요.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "미련만큼 부활에 대한 의지를 보여주실 거라고 믿습니다.", image: nil, type: .onlyText, who: .karon, characterFace: true)],
                       choices: [
                        Choice(text: <#T##String#>, likability: [], nextTextIndex: <#T##Int#>),
                        Choice(text: <#T##String#>, likability: [], nextTextIndex: <#T##Int#>)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "그렇긴 한데,", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "억지로라도 울어야 된다는 말로 들리는군요.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "", likability: [], nextTextIndex: 22),
                        Choice(text: "", likability: [], nextTextIndex: 22)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "하지만 가족들이 당신 없이 행복할 수 있을까요?", image: nil, type: .onlyText, who: .karon, characterFace: true)],
                       choices: [
                        Choice(text: "힘들라나...", likability: [], nextTextIndex: 25),
                        Choice(text: "반드시 행복해야지.", likability: [], nextTextIndex: 26)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "죽어서도 걱정입니까?", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "성실한 가장 같군요.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "", likability: [], nextTextIndex: 21),
                        Choice(text: "", likability: [], nextTextIndex: 21)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "호오, 가슴이 따뜻해지는 \n답변이군요.", image: nil, type: .onlyText, who: .karon, characterFace: true)],
                       choices: [
                        Choice(text: "", likability: [], nextTextIndex: 21),
                        Choice(text: "", likability: [], nextTextIndex: 21)], achievement: nil),
    BlockOfDayEpisode(chats: //27
                       [Chat(text: "당연히 의문이 들겠죠.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "당신 나이의 여성이 자연사할\n가능성은 거의 없으니까요.", image: nil, type: .onlyText, who: .karon, characterFace: false),
                        Chat(text: "그렇다면 누군가에 의해 죽었거나 사고일 텐데. 당신은 어느 쪽이라 생각하십니까?", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "누군가에 의해 살해당했겠네.", likability: [], nextTextIndex: 28),
                        Choice(text: "사고를 당한 게 아닐까?", likability: [], nextTextIndex: 31)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "호오, 그렇게 생각하십니까?", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "만약 살해범이 누군지 안다면 어떻게 하시겠습니까?", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "그 이름을 저주할 거야.", likability: [], nextTextIndex: 29),
                        Choice(text: "더 이상 죄를 짓지 말라고 기도하고 싶어.", likability: [], nextTextIndex: 30)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "그 한 마디에 당신의 부활 의지가 엿 보이는군요.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "그리고 멋진 표정이었습니다.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "", likability: [], nextTextIndex: 22),
                        Choice(text: "", likability: [], nextTextIndex: 22)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "설마, 용서를 하겠다는 겁니까?", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "이렇게 착한 분일 줄이야.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "", likability: [], nextTextIndex: 21),
                        Choice(text: "", likability: [], nextTextIndex: 21)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "사고도 괜히 당하는 것이\n아닙니다.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "왜 하필 당신에게 그런 사고가\n벌어졌을까요?", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "어쩌면...., 누군가가 사고로 위장한 것일 수도 있겠군.", likability: [], nextTextIndex: 32),
                        Choice(text: "부주의했거나 운이 없었겠지.", likability: [], nextTextIndex: 33)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "재미있는 예측을 하시는군요.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "만약 그렇다면 주변에 적이나\n위험이 많다는 것인데.", image: nil, type: .onlyText, who: .karon, characterFace: false),
                        Chat(text: "허허, 이거 부활 후가\n걱정되는군요.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "", likability: [], nextTextIndex: 22),
                        Choice(text: "", likability: [], nextTextIndex: 22)], achievement: nil),
    BlockOfDayEpisode(chats:
                       [Chat(text: "그 한 마디에 당신의 부활 의지가 엿 보이는군요.", image: nil, type: .onlyText, who: .karon, characterFace: true),
                        Chat(text: "그리고 멋진 표정이었습니다.", image: nil, type: .onlyText, who: .karon, characterFace: false)],
                       choices: [
                        Choice(text: "그렇다면 이 자리에 있는 것이", likability: [], nextTextIndex: 22),
                        Choice(text: "매우 안타까운 일일 수도\n있겠군요.", likability: [], nextTextIndex: 22)], achievement: nil)
])


/*
 BlockOfDayEpisode(chats:
                    [Chat(text: <#T##String?#>, image: nil, type: .onlyText, who: .karon, characterFace: true),
                     Chat(text: <#T##String?#>, image: nil, type: .onlyText, who: .karon, characterFace: false),
                     Chat(text: <#T##String?#>, image: nil, type: .onlyText, who: .karon, characterFace: false)],
                    choices: [
                     Choice(text: <#T##String#>, likability: [], nextTextIndex: <#T##Int#>),
                     Choice(text: <#T##String#>, likability: [], nextTextIndex: <#T##Int#>)], achievement: nil)
*/
