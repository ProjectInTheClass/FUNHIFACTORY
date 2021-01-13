//
//  StoryInstance.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//
import Foundation
var indexNumber = 0 
var currentChatArray : [Chat] = []

let test = Episode(episodeID: "test", episodePlace: "prologue map", episodeYear: 1592, episodeKingYear: "선조 25년", episodeShortDesciption: "", episodeDesciption: "임진왜란 때 대부분의 궁궐이 화재로 인해 소실되었다.", episodePlaceImage: "placeImage_1x", episodeCoverImage: "", isCleared: true, chatHistory: [], storyBlocks: [
                    
    "001":BlockOfDayEpisode(chats:
                                [Chat(text: "사건을 시작하기 저어언에 먼저 이 사건에 대해 알려주겠다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: .donhwamun, infomationToUnlock: .hwiryeong1 , gameCharacterToUnlock: .hwiryeong, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "알겠어요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "002", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "이번은 어떤 내용인가요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "002", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "002":BlockOfDayEpisode(chats:
                                [Chat(text: "네가 학교에서 수업을 잘 들었다면 이미 알 거라고 생각한다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: .hwiryeong2, gameCharacterToUnlock: .danhee, caseToUnlock: .case101, albumImageToUnlock: .prologueCase1),
                                 Chat(text: "이번 사건은 인조반정이야.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: .cat, infomationToUnlock: .hwiryeong4, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: .achievement1Locked)],
                            choices: [
                                    Choice(text: "어... 많이 들어봤는데 잘 모르겠어요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "004", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "광해군이 폐위된 사건이죠?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "003", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "003":BlockOfDayEpisode(chats:
                                [Chat(text: "맞아.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], chatType: .monologue, characterFace: .sad, nextTextIndex: "005", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "006", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "004":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .angry1, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "내가 설명을 좀 해주마.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], chatType: .onlyText, characterFace: .sad, nextTextIndex: "005", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "006", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "005":BlockOfDayEpisode(chats:
                                [Chat(text: "모를 수 있지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "하지만 역사에 좀 귀기울여 살거라.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "sampleImageeee", type: .untouchableImage, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "007", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "008", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "006":BlockOfDayEpisode(chats:
                                [Chat(text: "태정태세문단세예성연중인명선광인", image: "", type: .onlyText, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "아!", image: "", type: .onlyText, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조네요!", image: "karonRoom", type: .onlyText, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "그래.", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .hwiryeong,    characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "007", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "008", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "007":BlockOfDayEpisode(chats:
                                [Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "...", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                    Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                Choice(text: "많이... 힘들었을 것 같아요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "011", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "011", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "008":BlockOfDayEpisode(chats:
                                [Chat(text: "으음...", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "정말이니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [Choice(text: "네.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "009", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                      Choice(text: "...아니요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "010", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "009":BlockOfDayEpisode(chats:
                                [Chat(text: "그래. 알겠다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "뭐. 중간에 도움이 필요하면 내가 나타날 것이니 걱정하지는 말고.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "End", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "End", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "010":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "...", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                             choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "011", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "011", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "011":BlockOfDayEpisode(chats:
                                [Chat(text: "네 말이 맞아.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "자식을 잃은 슬픔과 그리움에 못 이겨 결국 능창군 뒤를 잇게 된다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "End", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "End", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false)
                    ],currentCharacterNote: [GameCharacter(name: "이단희", profileImage: "heeryeongBackgroundImage", backGroundImage: "heeryeongBackgroundImage", description: "인물 설명", infomation: [], likability: 0, isLocked: false), GameCharacter(name: "휘령", profileImage: "heeryeongBackgroundImage", backGroundImage: "heeryeongBackgroundImage", description: "인물 설명", infomation: [Infomation(infomationID: .hwiryeong1, isLocked: true, text: "휘령은 신이다."), Infomation(infomationID: .hwiryeong2, isLocked: true, text: "휘령은 금발이다."), Infomation(infomationID: .hwiryeong3, isLocked: true, text: "휘령은 남자이다."), Infomation(infomationID: .hwiryeong4, isLocked: true, text: "휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다. 휘령은 예쁘다."), Infomation(infomationID: .hwiryeong5, isLocked: true, text: "휘령은 휘령이다.")], likability: 0, isLocked: true)], currentCaseNote: [NoteCase(id: .case101, title: "사건 1-1", shortDescription: "사건 1-1이 일어남.", longDescription: "사건 1-1이 일어나아아아아아아아아아아아아아아아아아아아아아아아아아아아암. ", isLocked: true)], currentAlbumImages: [AlbumImage(id: .prologueCase1, image: "prologueCase1", title: "단희 창덕궁 감", description: "단희가 창덕궁에 갔다. 눈 앞에는 돈화문으로 보이는 대문이 있다.", isLocked: true), AlbumImage(id: .achievement1Locked, image: "achievement1Locked", title: "병사가 된 단희", description: "창덕궁을 구하기 위해 과거로 이동한 단희는 남자가 되어있었다.", isLocked: true)], timelineSavePoint: [SavePoint(name: "시작부터", storyBlockIndex: "001")])




//얘 사용 용도 더미데이터에 보관하는 용 말고 또 무언가 있다면 주석으로 적어줘요 (맞음. 전체적인 데이터들을 넣어놓는 자리가 필요하다 생각했는데 다른 데가 있으면 놔둬도 됨.)
var currentCharactersInfo: [String:GameCharacter] = [
    "kirell":GameCharacter(name: "키렐", profileImage: "kirell", backGroundImage: "kirell", description: "인물 설명", infomation: [], likability: 66, isLocked: false),
    "ballam":GameCharacter(name: "발람", profileImage: "ballam", backGroundImage: "ballam", description: "인물 설명", infomation: [], likability: 77, isLocked: false),
    ".danhee":GameCharacter(name: "단희", profileImage: "", backGroundImage: "", description: "인물 설명", infomation: [], likability: 0, isLocked: false),
    ".hwiryeong":GameCharacter(name: "휘령", profileImage: "", backGroundImage: "", description: "인물 설명", infomation: [], likability: 0, isLocked: false)
]

//selectStageVC 테이블뷰 테스트 하드코딩용 데이터. 나중에 삭제 혹은 위치 변경 예정


var prologueChapter: Episode = Episode(episodeID: "prologue", episodePlace: "현재", episodeYear: 2020, episodeKingYear: "현재 2020년", episodeShortDesciption: "누군가 나에게 내 하루를 바꿀 수 있는, 내 인생을 바꿀 수 있는 구원의 손길을 내밀어 준다면, 나는 그 손을....잡을 수 있을까?", episodeDesciption: "지루하고 따분한, 그저 우울하기만 한 내 인생은 변하긴 할까?\n이런 삶은 이제 그만하고 싶다.\n누군가 나에게 내 하루를 바꿀 수 있는, 내 인생을 바꿀 수 있는 구원의 손길을 내밀어 준다면,\n 나는 그 손을....잡을 수 있을까?", episodePlaceImage: "changdeokgung lllu image", episodeCoverImage: "changdeokgung image sample", isCleared: true, chatHistory: [], storyBlocks: [
    "001":BlockOfDayEpisode(chats:
                                [Chat(text: "프롤로그임. 사건을 시작하기 저어언에 먼저 이 사건에 대해 알려주겠다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: .donhwamun, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "알겠어요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "002", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "이번은 어떤 내용인가요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "078", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "002":BlockOfDayEpisode(chats:
                                [Chat(text: "네가 학교에서 수업을 잘 들었다면 이미 알 거라고 생각한다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: .hwiryeong, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "이번 사건은 인조반정이야.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "어... 많이 들어봤는데 잘 모르겠어요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "004", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "광해군이 폐위된 사건이죠?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "003", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "003":BlockOfDayEpisode(chats:
                                [Chat(text: "맞아.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "005", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "006", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "004":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "내가 설명을 좀 해주마.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "005", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "006", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "005":BlockOfDayEpisode(chats:
                                [Chat(text: "모를 수 있지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "하지만 역사에 좀 귀기울여 살거라.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "sampleImageeee", type: .untouchableImage, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "007", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "008", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "006":BlockOfDayEpisode(chats:
                                [Chat(text: "태정태세문단세예성연중인명선광인", image: "", type: .onlyText, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "아!", image: "", type: .onlyText, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조네요!", image: "karonRoom", type: .onlyText, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "그래.", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .hwiryeong,    characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "007", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "008", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "007":BlockOfDayEpisode(chats:
                                [Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "...", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                    Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "011", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "011", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "008":BlockOfDayEpisode(chats:
                                [Chat(text: "으음...", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "정말이니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [Choice(text: "네.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "009", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                      Choice(text: "...아니요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "010", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "009":BlockOfDayEpisode(chats:
                                [Chat(text: "그래. 알겠다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "뭐. 중간에 도움이 필요하면 내가 나타날 것이니 걱정하지는 말고.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "End", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "End", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "010":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "...", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                             choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "011", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "011", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "011":BlockOfDayEpisode(chats:
                                [Chat(text: "네 말이 맞아.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "자식을 잃은 슬픔과 그리움에 못 이겨 결국 능창군 뒤를 잇게 된다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                                          choices: [
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "End", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "End", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "078":BlockOfDayEpisode(chats:
                                [],
                                          choices: [
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "003", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "선태", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false)
], currentCharacterNote:
    [GameCharacter(name: "이단희", profileImage: "danhee basic face", backGroundImage: "leedanheeBackground", description: "내 곁에 아무도 없다는 게 이젠 익숙해. 이런 내 삶이 바뀔 수 있을까?", infomation: [], likability: 0, isLocked: false),
     GameCharacter(name: "휘령", profileImage: "hwiryeong basic face", backGroundImage: "hwiryeong illu 1x", description: "네가 나의 마지막 희망이다. 네가 가진 그 1초가 나를, 이 세상을 바꾸는 법. 부디 이번엔 꼭 성공하길...", infomation: [Infomation(infomationID: .hwiryeong1, isLocked: false, text: "조선이 생겨났을 때부터 존재했다."), Infomation(infomationID: .hwiryeong2, isLocked: false, text: "휘령이 곧 조선. 하지만 큰 사건들을 겪고 나서 그는 힘을 잃게 되었다. 그 힘을 찾기 위해서 내가 필요하다고 한다."), Infomation(infomationID: .hwiryeong3, isLocked: true, text: "휘령은 남자이다."), Infomation(infomationID: .hwiryeong5, isLocked: true, text: "휘령은 휘령이다.")], likability: 0, isLocked: false),
     GameCharacter(name: "투어 가이드", profileImage: "tour guide", backGroundImage: "", description: "", infomation: [], likability: 0, isLocked: false),
     GameCharacter(name: "선생님", profileImage: "teacher", backGroundImage: "cat", description: "선생님은 선생님이다. 선생님은 선생님이다. 선생님은 선생님이다. 선생님은 선생님이다. ", infomation: [Infomation(infomationID: .teacher1, isLocked: false, text: "선생님은 선생님이다."), Infomation(infomationID: .teacher1, isLocked: false, text: "선생님은 선생님이다."), Infomation(infomationID: .teacher1, isLocked: false, text: "선생님은 선생님이다."), Infomation(infomationID: .teacher1, isLocked: false, text: "선생님은 선생님이다.")], likability: 40, isLocked: false),
     GameCharacter(name: "??", profileImage: "hwiryeong basic face", backGroundImage: "", description: "", infomation: [], likability: 0, isLocked: true)], currentCaseNote: [], currentAlbumImages: [], timelineSavePoint: [SavePoint(name: "시작부터", storyBlockIndex: "001")])


//selectStageVC 테이블뷰 테스트 하드코딩용 데이터. 나중에 삭제 혹은 위치 변경 예정
let testChapter1 = Episode(episodeID: "1592", episodePlace: "인정전", episodeYear: 1592, episodeKingYear: "선조 25년", episodeShortDesciption: "우리나라의 뼈아픈 역사 중 하나다. ", episodeDesciption: "임진왜란 때 대부분의 궁궐이 화재로 인해 소실되었다.", episodePlaceImage: "changdeokgung lllu image", episodeCoverImage: "changdeokgung image sample", isCleared: true, chatHistory: [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                                                                                                                                                                                                                                                                                                                                            Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: .faith, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                                                                                                                                                                                                                                                                                  Chat(text: "...", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                                                                                                                                                                                                                                                                                  Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                                                                                                                                                                                                                                                                                  Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], storyBlocks: [
    "001":BlockOfDayEpisode(chats:

                                [Chat(text: "사건을 시작하기 저어언에 먼저 이 사건에 대해 알려주겠다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .angry1, achievementToUnlock: .donhwamun, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                Choice(text: "알겠어요.", likability: [], chatType: .onlyText, characterFace: .sad, nextTextIndex: "002", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "이번은 어떤 내용인가요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "002", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "002":BlockOfDayEpisode(chats:
                                [Chat(text: "네가 학교에서 수업을 잘 들었다면 이미 알 거라고 생각한다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: .hwiryeong, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "이번 사건은 인조반정이야.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "어... 많이 들어봤는데 잘 모르겠어요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "004", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "광해군이 폐위된 사건이죠?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "003", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "003":BlockOfDayEpisode(chats:
                                [Chat(text: "맞아.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], chatType: .monologue, characterFace: .basic, nextTextIndex: "001", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "006", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false)/*,
    "004":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "내가 설명을 좀 해주마.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "005", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "006", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "005":BlockOfDayEpisode(chats:
                                [Chat(text: "모를 수 있지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "하지만 역사에 좀 귀기울여 살거라.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "sampleImageeee", type: .untouchableImage, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "007", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "008", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "006":BlockOfDayEpisode(chats:
                                [Chat(text: "태정태세문단세예성연중인명선광인", image: "", type: .onlyText, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "아!", image: "", type: .onlyText, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조네요!", image: "karonRoom", type: .onlyText, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "그래.", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .hwiryeong,    characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "007", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "008", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "007":BlockOfDayEpisode(chats:
                                [Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "...", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                    Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "011", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "011", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "008":BlockOfDayEpisode(chats:
                                [Chat(text: "으음...", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "정말이니?", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [Choice(text: "네.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "009", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                      Choice(text: "...아니요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "010", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "009":BlockOfDayEpisode(chats:
                                [Chat(text: "그래. 알겠다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Chat(text: "뭐. 중간에 도움이 필요하면 내가 나타날 것이니 걱정하지는 말고.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "End", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "End", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "010":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "...", image: "karonRoom", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                             choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "011", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "011", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false),
    "011":BlockOfDayEpisode(chats:
                                [Chat(text: "네 말이 맞아.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                 Chat(text: "자식을 잃은 슬픔과 그리움에 못 이겨 결국 능창군 뒤를 잇게 된다.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
                            choices: [
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "End", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                Choice(text: "", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "End", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)], achievement: nil, choiceSkip: false) */
],
currentCharacterNote: [
    GameCharacter(name: "단희",profileImage: "heeryeongBackgroundImage",backGroundImage: "",description: "인물 설명",infomation: [Infomation(infomationID: .hwiryeong1, isLocked: false, text: "휘령 정보 1"),Infomation(infomationID: .hwiryeong2, isLocked: true, text: "휘령 정보 2"),Infomation(infomationID: .hwiryeong3, isLocked: false, text: "휘령 정보 3"),Infomation(infomationID: .hwiryeong4, isLocked: true, text: "휘령 정보 4"),Infomation(infomationID: .hwiryeong5, isLocked: true, text: "휘령 정보 5 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화")], likability: 0,isLocked: false)],
currentCaseNote: [NoteCase(id: .case201, title: "[인조반정]", shortDescription: "1623년 4월 11일에 일어난 사건이다.", longDescription: "1623년 4월 11일에 일어난 사건이다. 조선의 3대 반정 중 하나로, 서인 세력이 광해군과 대북파를 몰아내고 인조인 능양군을 왕위에 앉혔다.", isLocked: false) ], currentAlbumImages: [AlbumImage(id: .prologueCase1, image: "prologueCase1", title: "단희 창덕궁 감", description: "단희가 창덕궁에 갔다. 눈 앞에는 돈화문으로 보이는 대문이 있다.", isLocked: true), AlbumImage(id: .achievement1Locked, image: "achievement1Locked", title: "병사가 된 단희", description: "창덕궁을 구하기 위해 과거로 이동한 단희는 남자가 되어있었다.", isLocked: true)], timelineSavePoint: [SavePoint(name: "시작부터", storyBlockIndex: "001")])

let testChapter2 = Episode(episodeID: "1623", episodePlace: "돈화문", episodeYear: 1623, episodeKingYear: "광해 15년", episodeShortDesciption: "반란으로 왕이 바뀐 사건이다. 인조가 광해를 끌어내리고 왕 위에 오르던 과정에서 인정전을 제외한 모든 건물이 불에 타 버렸다. 반란이 성공하지 못하도록 하는 것이 이 사건의 실마리가 될 것이다.", episodeDesciption: "나는 현실로 돌아가야만 하는 사람이다.\n그런데 왜 자꾸 다른 마음을 품게 되는 거냐고!\n역사가 똑같이 흘러가게 냅두어서는 안 돼.\n안 되는 걸 너무 잘 아는데...\n정신 차리자.\n내가 할 선택은.....", episodePlaceImage: "changdeokgung lllu image", episodeCoverImage: "changdeokgung image sample", isCleared: false, chatHistory: [],storyBlocks: [:], currentCharacterNote: [
    GameCharacter(name: "주인공", profileImage: "", backGroundImage: "", description: "내가 부잣집 양반의 개인 사병이라고? 내가 모시는 양반이 반역자의 주요 인물이라니...들키지 않고 방해할 수 있을까?", infomation: [], likability: 0, isLocked: false),
    GameCharacter(name: "이귀", profileImage: "", backGroundImage: "", description: "", infomation: [
        Infomation(infomationID: .leegyi1, isLocked: false, text: "1616년에 역모 사건에 관련되어 이천에 유배되었다가 1619년 유배에서 풀려났다."),
        Infomation(infomationID: .leegyi2, isLocked: false, text: "이런 상황에서 반역이 먼저 계획되고 있었고, 이후 이 계획에 참여하게 되었다.")
    ], likability: 0, isLocked: false),
    GameCharacter(name: "김자점", profileImage: "", backGroundImage: "", description: "", infomation: [
        Infomation(infomationID: .kimjajeom1, isLocked: false, text: "개인 사병을 지니고 있고, 그 중 한 명이 주인공이다."),
        Infomation(infomationID: .kimjajeom2, isLocked: false, text: "이귀와 함께 역모 사건에 연루되어 곤경에 처했었다."),
        Infomation(infomationID: .kimjajeom3, isLocked: false, text: "김상궁에게 뇌물을 주며 반역의 소문을 잠재우려 했다.")
    ], likability: 0, isLocked: false),
    GameCharacter(name: "김상궁", profileImage: "", backGroundImage: "", description: "", infomation: [
        Infomation(infomationID: .kimsanggung1, isLocked: false, text: "조선 중기 광해군 시절의 상궁이다."),
        Infomation(infomationID: .kimsanggung2, isLocked: false, text: "광해군의 아내인 중전 유씨의 신임을 얻어 왕의 곁에서 모실 수 있는 기회를 얻었다."),
        Infomation(infomationID: .kimsanggung3, isLocked: false, text: "뛰어난 미모를 가지고 있지는 않았다."),
        Infomation(infomationID: .kimsanggung4, isLocked: false, text: "그녀의 총명함에 사로잡혀 광해군이 그녀를 매우 아꼈다."),
        Infomation(infomationID: .kimsanggung5, isLocked: false, text: "후궁이 되는 것을 거부하여 계속 상궁의 신분을 유지하였다. 그 덕에 자유롭게 궐 밖으로 돌아다닐 수 있어 다양한 정보를 확보할 수 있었다."),
        Infomation(infomationID: .kimsanggung6, isLocked: false, text: "광해군이 그녀를 아끼고 신뢰를 하면서 후궁보다 권세가 더 높았다.")
    ], likability: 0, isLocked: false)
], currentCaseNote: [NoteCase(id: .case201, title: "[인조반정]", shortDescription: "1623년 4월 11일에 일어난 사건이다.", longDescription: "1623년 4월 11일에 일어난 사건이다. 조선의 3대 반정 중 하나로, 서인 세력이 광해군과 대북파를 몰아내고 인조인 능양군을 왕위에 앉혔다.", isLocked: false) ], currentAlbumImages: [
                            AlbumImage(id: .chapter2case1, image: "case 2 image 1", title: "[반역을 꾀하는 자들]", description: "내 앞에 있는 사람들은 회의를 하는 것처럼 보인다. 그런데 그 내용이...반정을 일으킨다는 것이라니. 내가 반역자의 한 명이 될 수도 있다는 건가?", isLocked: false),
                            AlbumImage(id: .chapter2case2, image: "case 2 image 2", title: "[반정의 지름길]", description: "나도 모르게 뇌물을 전해버렸어...이걸 전해주면 이번 사건은 틀림없이 실패할 텐데.", isLocked: false),
                            AlbumImage(id: .chapter2case3, image: "case 2 image 3", title: "[반복되는 역사]", description: "불길이 건물을 덮치고 그에도 부족했는지 하늘까지 온통 검게 변했다. 내가....내가 막았으면 됐는데... 도대체 내가 무슨 짓을 한 거야? 분명...분명 좀 전까지만 해도 황홀한 풍경이었는데... 이 모습도 어떻게 보면 황홀한 광경이라고 할 수 있을까..", isLocked: true) ], timelineSavePoint: [SavePoint(name: "시작부터", storyBlockIndex: "001")])


let testChapter3 = Episode(episodeID: "1919", episodePlace: "선정전", episodeYear: 1803, episodeKingYear: "순조 3년", episodeShortDesciption: "왕의 나이가 너무 어려 대비가 대신 정치를 했다. 그 과정에서 한쪽 세력에만 힘을 실게 되고, 종교의 자유를 억압하게 되었다. 복수심을 가지고 있는 자가 이번 사건의 범인일지도.", episodeDesciption: "대한독립 만세",episodePlaceImage: "changdeokgung lllu image", episodeCoverImage: "changdeokgung image sample", isCleared: false, chatHistory: [],storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [], timelineSavePoint: [SavePoint(name: "시작부터", storyBlockIndex: "001")])

let testChapter4 = Episode(episodeID: "2003", episodePlace: "대조전", episodeYear: 1918, episodeKingYear: "순종 11년", episodeShortDesciption: "", episodeDesciption: "7월 28일임",episodePlaceImage: "changdeokgung lllu image", episodeCoverImage: "changdeokgung image sample", isCleared: false, chatHistory: [], storyBlocks: [
    
    
    
                            "001":BlockOfDayEpisode(chats:
                                                        [
                Chat(text: "장작을 좀 찾아보렴.", image: "", type: .onlyText, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "네.", image: "", type: .onlyText, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "장작이 어디 가면 있을까?", image: "", type: .monologue, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "단희는 고개를 두리번거리다가 돌무더기를 발견했다.", image: "", type: .sectionHeader, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "왜인지 저기를 들추면 장작이 있을 것만 같아.", image: "", type: .monologue, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "들춰보자.", image: "", type: .onlyText, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "단희는 돌무더기 앞으로 향했다.", image: "", type: .sectionHeader, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "돌무더기를 들춰보러 이동합니다.", image: "", type: .sectionHeader, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "", image: "", type: .ar, who: .danhee, characterFace: .straight, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                     Chat(text: "돌무더기 아래에는..", image: "", type: .monologue, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)],
             
                choices: [
                        Choice(text: "장작이 한 개 있었어.", likability: [], chatType: .monologue, characterFace: .basic, nextTextIndex: "002", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                        Choice(text: "장작이 두 개 있었어.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "003", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                ], achievement: nil, choiceSkip: false),
    
    "002":BlockOfDayEpisode(chats:
                                [

Chat(text: "아닌 것 같아. 다시 찾아보자.", image: "", type: .monologue, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
Chat(text: "다시 돌무더기를 들여다봐야겠어.", image: "", type: .sectionHeader, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
Chat(text: "돌무더기를 들춰보러 이동합니당.", image: "", type: .sectionHeader, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
Chat(text: "돌무더기 아래에는..", image: "", type: .monologue, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
                                ],


choices: [
Choice(text: "장작이 한 개 있었어.", likability: [], chatType: .monologue, characterFace: .basic, nextTextIndex: "001", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
Choice(text: "장작이 두 개 있었어.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "002", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
], achievement: nil, choiceSkip: false),
    
    "003":BlockOfDayEpisode(chats:
                                [
                                    Chat(text: "돌무더기 아래에는 두 개의 장작이 있었습니다.", image: "", type: .sectionHeader, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
Chat(text: "역시 장작이 두 개나 있었네.", image: "", type: .monologue, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
Chat(text: "히히.", image: "", type: .sectionHeader, who: .danhee, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
Chat(text: "이제 휘령님께 돌아가야겠다.", image: "", type: .sectionHeader, who: .hwiryeong, characterFace: .basic, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil)

                                ],


choices: [
Choice(text: "장작이 한 개 있었어.", likability: [], chatType: .monologue, characterFace: .basic, nextTextIndex: "001", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
Choice(text: "장작이 두 개 있었어.", likability: [], chatType: .onlyText, characterFace: .basic, nextTextIndex: "002", achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil),
], achievement: nil, choiceSkip: false),
    
    
    
    
    
    
], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [], timelineSavePoint: [SavePoint(name: "시작부터", storyBlockIndex: "001")])

