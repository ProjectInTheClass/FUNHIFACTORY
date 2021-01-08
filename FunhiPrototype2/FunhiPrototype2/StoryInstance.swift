//
//  StoryInstance.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//
import Foundation
var indexNumber = 0 
var currentChatArray : [Chat] = []
let test = Episode(episodeID: "test", episodeName: "임진왜란", episodeYear: 1592, episodeKingYear: "선조 25년", episodeDesciption: "임진왜란 때 대부분의 궁궐이 화재로 인해 소실되었다.", episodePlaceImage: "placeImage_1x", isCleared: true, chatHistory: [], storyBlocks: [
    "001":BlockOfDayEpisode(chats:
                                [Chat(text: "사건을 시작하기 저어언에 먼저 이 사건에 대해 알려주겠다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: .achievement1, infomationToUnlock: .hwiryeong1 , gameCharacterToUnlock: .hwiryeong, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "알겠어요.", likability: [], nextTextIndex: "002"),
                                    Choice(text: "이번은 어떤 내용인가요?", likability: [], nextTextIndex: "002")], achievement: nil, choiceSkip: false),
    "002":BlockOfDayEpisode(chats:
                                [Chat(text: "네가 학교에서 수업을 잘 들었다면 이미 알 거라고 생각한다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: .achievement2, infomationToUnlock: .hwiryeong2, gameCharacterToUnlock: .danhee, caseToUnlock: .case101, albumImageToUnlock: .prologueCase1),
                                 Chat(text: "이번 사건은 인조반정이야.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: .achievement3, infomationToUnlock: .hwiryeong4, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: .achievement1Locked)],
                            choices: [
                                    Choice(text: "어... 많이 들어봤는데 잘 모르겠어요.", likability: [], nextTextIndex: "004"),
                                    Choice(text: "광해군이 폐위된 사건이죠?", likability: [], nextTextIndex: "003")], achievement: nil, choiceSkip: false),
    "003":BlockOfDayEpisode(chats:
                                [Chat(text: "맞아.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], nextTextIndex: "005"),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], nextTextIndex: "006")], achievement: nil, choiceSkip: false),
    "004":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "내가 설명을 좀 해주마.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], nextTextIndex: "005"),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], nextTextIndex: "006")], achievement: nil, choiceSkip: false),
    "005":BlockOfDayEpisode(chats:
                                [Chat(text: "모를 수 있지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "하지만 역사에 좀 귀기울여 살거라.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "sampleImageeee", type: .untouchableImage, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], nextTextIndex: "007"),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], nextTextIndex: "008")], achievement: nil, choiceSkip: false),
    "006":BlockOfDayEpisode(chats:
                                [Chat(text: "태정태세문단세예성연중인명선광인", image: "", type: .onlyText, who: .danhee, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "아!", image: "", type: .onlyText, who: .danhee, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조네요!", image: "karonRoom", type: .onlyText, who: .danhee, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "그래.", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .hwiryeong,    characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], nextTextIndex: "007"),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], nextTextIndex: "008")], achievement: nil, choiceSkip: false),
    "007":BlockOfDayEpisode(chats:
                                [Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "...", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                    Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], nextTextIndex: "011"), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], nextTextIndex: "011")], achievement: nil, choiceSkip: false),
    "008":BlockOfDayEpisode(chats:
                                [Chat(text: "으음...", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "정말이니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [Choice(text: "네.", likability: [], nextTextIndex: "009"),
                                      Choice(text: "...아니요.", likability: [], nextTextIndex: "010")], achievement: nil, choiceSkip: false),
    "009":BlockOfDayEpisode(chats:
                                [Chat(text: "그래. 알겠다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "뭐. 중간에 도움이 필요하면 내가 나타날 것이니 걱정하지는 말고.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                Choice(text: "", likability: [], nextTextIndex: "End"),
                                Choice(text: "", likability: [], nextTextIndex: "End")], achievement: nil, choiceSkip: false),
    "010":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "...", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                             choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], nextTextIndex: "011"), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], nextTextIndex: "011")], achievement: nil, choiceSkip: false),
    "011":BlockOfDayEpisode(chats:
                                [Chat(text: "네 말이 맞아.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "자식을 잃은 슬픔과 그리움에 못 이겨 결국 능창군 뒤를 잇게 된다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                Choice(text: "", likability: [], nextTextIndex: "End"),
                                Choice(text: "", likability: [], nextTextIndex: "End")], achievement: nil, choiceSkip: false)],currentCharacterNote: [GameCharacter(name: "이단희", profileImage: "heeryeongBackgroundImage", backGroundImage: "heeryeongBackgroundImage", description: "인물 설명", infomation: [], likability: 0, isLocked: false), GameCharacter(name: "휘령", profileImage: "heeryeongBackgroundImage", backGroundImage: "heeryeongBackgroundImage", description: "인물 설명", infomation: [Infomation(infomationID: .hwiryeong1, isLocked: true, text: "휘령은 신이다."), Infomation(infomationID: .hwiryeong2, isLocked: true, text: "휘령은 금발이다."), Infomation(infomationID: .hwiryeong3, isLocked: true, text: "휘령은 남자이다."), Infomation(infomationID: .hwiryeong4, isLocked: true, text: "휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다."), Infomation(infomationID: .hwiryeong5, isLocked: true, text: "휘령은 휘령이다.")], likability: 0, isLocked: true)], currentCaseNote: [NoteCase(id: .case101, title: "사건 1-1", shortDescription: "사건 1-1이 일어남.", longDescription: "사건 1-1이 일어나아아아아아아아아아아아아아아아아아아아아아아아아아아아암. ", isLocked: true)], currentAlbumImages: [AlbumImage(id: .prologueCase1, image: "prologueCase1", title: "단희 창덕궁 감", description: "단희가 창덕궁에 갔다. 눈 앞에는 돈화문으로 보이는 대문이 있다.", isLocked: true), AlbumImage(id: .achievement1Locked, image: "achievement1Locked", title: "병사가 된 단희", description: "창덕궁을 구하기 위해 과거로 이동한 단희는 남자가 되어있었다.", isLocked: true)])




//얘 사용 용도 더미데이터에 보관하는 용 말고 또 무언가 있다면 주석으로 적어줘요 (맞음. 전체적인 데이터들을 넣어놓는 자리가 필요하다 생각했는데 다른 데가 있으면 놔둬도 됨.)
var currentCharactersInfo: [String:GameCharacter] = [
    "kirell":GameCharacter(name: "키렐", profileImage: "kirell", backGroundImage: "kirell", description: "인물 설명", infomation: [], likability: 66, isLocked: false),
    "ballam":GameCharacter(name: "발람", profileImage: "ballam", backGroundImage: "ballam", description: "인물 설명", infomation: [], likability: 77, isLocked: false),
    ".danhee":GameCharacter(name: "단희", profileImage: "", backGroundImage: "", description: "인물 설명", infomation: [], likability: 0, isLocked: false),
    ".hwiryeong":GameCharacter(name: "휘령", profileImage: "", backGroundImage: "", description: "인물 설명", infomation: [], likability: 0, isLocked: false)
]

//selectStageVC 테이블뷰 테스트 하드코딩용 데이터. 나중에 삭제 혹은 위치 변경 예정


var prologueChapter: Episode = Episode(episodeID: "prologue", episodeName: "프롤로그", episodeYear: 2020, episodeKingYear: "현재 2020년", episodeDesciption: "프롤로그임", episodePlaceImage: "프롤로그 자세한 설명임", isCleared: false, chatHistory: [], storyBlocks: [:], currentCharacterNote: [GameCharacter(name: "이단희", profileImage: "heeryeongBackgroundImage", backGroundImage: "heeryeongBackgroundImage", description: "인물 설명", infomation: [], likability: 0, isLocked: false), GameCharacter(name: "휘령", profileImage: "heeryeongBackgroundImage", backGroundImage: "heeryeongGrayBackgroundImage", description: "인물 설명", infomation: [], likability: 0, isLocked: false),GameCharacter(name: "투어 가이드", profileImage: "", backGroundImage: "", description: "", infomation: [], likability: 0, isLocked: true), GameCharacter(name: "선생님", profileImage: "", backGroundImage: "", description: "", infomation: [], likability: 0, isLocked: true),GameCharacter(name: "??", profileImage: "", backGroundImage: "", description: "", infomation: [], likability: 0, isLocked: true)], currentCaseNote: [], currentAlbumImages: [])


//selectStageVC 테이블뷰 테스트 하드코딩용 데이터. 나중에 삭제 혹은 위치 변경 예정
let testChapter1 = Episode(episodeID: "1592", episodeName: "임진왜란", episodeYear: 1592, episodeKingYear: "선조 25년", episodeDesciption: "임진왜란 때 대부분의 궁궐이 화재로 인해 소실되었다.", episodePlaceImage: "placeImage_1x", isCleared: true, chatHistory: [], storyBlocks: [
    "001":BlockOfDayEpisode(chats:
                                [Chat(text: "사건을 시작하기 저어언에 먼저 이 사건에 대해 알려주겠다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: .achievement1, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "알겠어요.", likability: [], nextTextIndex: "002"),
                                    Choice(text: "이번은 어떤 내용인가요?", likability: [], nextTextIndex: "002")], achievement: nil, choiceSkip: false),
    "002":BlockOfDayEpisode(chats:
                                [Chat(text: "네가 학교에서 수업을 잘 들었다면 이미 알 거라고 생각한다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: .achievement2, infomationToUnlock: nil, gameCharacterToUnlock: .hwiryeong1, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "이번 사건은 인조반정이야.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "어... 많이 들어봤는데 잘 모르겠어요.", likability: [], nextTextIndex: "004"),
                                    Choice(text: "광해군이 폐위된 사건이죠?", likability: [], nextTextIndex: "003")], achievement: nil, choiceSkip: false),
    "003":BlockOfDayEpisode(chats:
                                [Chat(text: "맞아.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], nextTextIndex: "005"),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], nextTextIndex: "006")], achievement: nil, choiceSkip: false),
    "004":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "내가 설명을 좀 해주마.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], nextTextIndex: "005"),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], nextTextIndex: "006")], achievement: nil, choiceSkip: false),
    "005":BlockOfDayEpisode(chats:
                                [Chat(text: "모를 수 있지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "하지만 역사에 좀 귀기울여 살거라.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "sampleImageeee", type: .untouchableImage, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], nextTextIndex: "007"),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], nextTextIndex: "008")], achievement: nil, choiceSkip: false),
    "006":BlockOfDayEpisode(chats:
                                [Chat(text: "태정태세문단세예성연중인명선광인", image: "", type: .onlyText, who: .danhee, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "아!", image: "", type: .onlyText, who: .danhee, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조네요!", image: "karonRoom", type: .onlyText, who: .danhee, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "그래.", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .hwiryeong,    characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], nextTextIndex: "007"),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], nextTextIndex: "008")], achievement: nil, choiceSkip: false),
    "007":BlockOfDayEpisode(chats:
                                [Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "...", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                    Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], nextTextIndex: "011"), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], nextTextIndex: "011")], achievement: nil, choiceSkip: false),
    "008":BlockOfDayEpisode(chats:
                                [Chat(text: "으음...", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "정말이니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [Choice(text: "네.", likability: [], nextTextIndex: "009"),
                                      Choice(text: "...아니요.", likability: [], nextTextIndex: "010")], achievement: nil, choiceSkip: false),
    "009":BlockOfDayEpisode(chats:
                                [Chat(text: "그래. 알겠다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "뭐. 중간에 도움이 필요하면 내가 나타날 것이니 걱정하지는 말고.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                Choice(text: "", likability: [], nextTextIndex: "End"),
                                Choice(text: "", likability: [], nextTextIndex: "End")], achievement: nil, choiceSkip: false),
    "010":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "...", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                             choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], nextTextIndex: "011"), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], nextTextIndex: "011")], achievement: nil, choiceSkip: false),
    "011":BlockOfDayEpisode(chats:
                                [Chat(text: "네 말이 맞아.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "자식을 잃은 슬픔과 그리움에 못 이겨 결국 능창군 뒤를 잇게 된다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                Choice(text: "", likability: [], nextTextIndex: "End"),
                                Choice(text: "", likability: [], nextTextIndex: "End")], achievement: nil, choiceSkip: false)
],
currentCharacterNote: [
    GameCharacter(name: "단희",profileImage: "heeryeongBackgroundImage",backGroundImage: "",description: "인물 설명",infomation: [Infomation(infomationID: .hwiryeong1, isLocked: true, text: "휘령 정보 1"),Infomation(infomationID: .hwiryeong2, isLocked: true, text: "휘령 정보 2"),Infomation(infomationID: .hwiryeong3, isLocked: true, text: "휘령 정보 3"),Infomation(infomationID: .hwiryeong4, isLocked: true, text: "휘령 정보 4"),Infomation(infomationID: .hwiryeong5, isLocked: true, text: "휘령 정보 5 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화")], likability: 0,isLocked: true)],
currentCaseNote: [NoteCase(id: .case101, title: "사건 1-1", shortDescription: "사건 1-1이 일어남.", longDescription: "사건 1-1이 일어나아아아아아아아아아아아아아아아아아아아아아아아아아아아암. ", isLocked: true)], currentAlbumImages: [AlbumImage(id: .prologueCase1, image: "prologueAlbumImage1", title: "단희 창덕궁 감", description: "단희가 창덕궁에 갔다. 눈 앞에는 돈화문으로 보이는 대문이 있다.", isLocked: true), AlbumImage(id: .achievement1Locked, image: "achievement1Locked", title: "병사가 된 단희", description: "창덕궁을 구하기 위해 과거로 이동한 단희는 남자가 되어있었다.", isLocked: false)])

let testChapter2 = Episode(episodeID: "1623", episodeName: "인조반정", episodeYear: 1623, episodeKingYear: "지조 25년", episodeDesciption: "광해군이 반정으로 인해 폐위되다", episodePlaceImage: "placeImage_1x", isCleared: false, chatHistory: [],storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [])

let testChapter3 = Episode(episodeID: "1919", episodeName: "3.1 운동", episodeYear: 1919, episodeKingYear: "짱조 25년", episodeDesciption: "대한독립 만세",episodePlaceImage: "placeImage_1x", isCleared: false, chatHistory: [],storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [])

let testChapter4 = Episode(episodeID: "2003", episodeName: "내 생일", episodeYear: 2003, episodeKingYear: "맛조 25년", episodeDesciption: "7월 28일임",episodePlaceImage: "placeImage_1x", isCleared: false, chatHistory: [], storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [])

