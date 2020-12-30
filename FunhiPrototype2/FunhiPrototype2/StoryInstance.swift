//
//  StoryInstance.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//
import Foundation

var currentChatArray : [Chat] = []
let test = Episode(episodeName: "테스트 에피소드", episodeYear: 1623, episodeDesciption: "테스트 에피소드입니다.", episodePlaceImage: "", isCleared: false, storyBlocks: [
    "001":BlockOfDayEpisode(chats:
                                [Chat(text: "사건을 시작하기 전에 먼저 이 사건에 대해 알려주겠다.", image: "", type: .onlyText, who: .ballam, characterFace: true)],
                            choices: [
                                    Choice(text: "알겠어요.", likability: [], nextTextIndex: "002"),
                                    Choice(text: "이번은 어떤 내용인가요?", likability: [], nextTextIndex: "002")], achievement: nil, choiceSkip: false),
    "002":BlockOfDayEpisode(chats:
                                [Chat(text: "네가 학교에서 수업을 잘 들었다면 이미 알 거라고 생각한다.", image: "", type: .onlyText, who: .ballam, characterFace: true),
                                Chat(text: "이번 사건은 인조반정이야.", image: "", type: .onlyText, who: .ballam, characterFace: false)],
                            choices: [
                                    Choice(text: "어... 많이 들어봤는데 잘 모르겠어요.", likability: [], nextTextIndex: "004"),
                                    Choice(text: "광해군이 폐위된 사건이죠?", likability: [], nextTextIndex: "003")], achievement: nil, choiceSkip: false),
    "003":BlockOfDayEpisode(chats:
                                [Chat(text: "맞아.", image: "", type: .onlyText, who: .ballam, characterFace: true),
                                 Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .ballam, characterFace: true)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], nextTextIndex: "005"),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], nextTextIndex: "006")], achievement: nil, choiceSkip: false),
    "004":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .ballam, characterFace: true),
                                Chat(text: "내가 설명을 좀 해주마.", image: "", type: .onlyText, who: .ballam, characterFace: false),
                                Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .ballam, characterFace: true)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], nextTextIndex: "005"),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], nextTextIndex: "006")], achievement: nil, choiceSkip: false),
    "005":BlockOfDayEpisode(chats:
                                [Chat(text: "모를 수 있지.", image: "", type: .onlyText, who: .ballam, characterFace: true),
                                Chat(text: "하지만 역사에 좀 귀기울여 살거라.", image: "", type: .onlyText, who: .ballam, characterFace: false),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "karonRoom", type: .onlyText, who: .ballam, characterFace: true),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "sampleImageeee", type: .untouchableImage, who: .ballam, characterFace: true),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .ballam, characterFace: true),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .ballam, characterFace: false)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], nextTextIndex: "007"),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], nextTextIndex: "008")], achievement: nil, choiceSkip: false),
    "006":BlockOfDayEpisode(chats:
                                [Chat(text: "태정태세문단세예성연중인명선광인", image: "", type: .onlyText, who: .kirell, characterFace: true),
                                Chat(text: "아!", image: "", type: .onlyText, who: .kirell, characterFace: false),
                                Chat(text: "인조네요!", image: "karonRoom", type: .onlyText, who: .kirell, characterFace: true),
                                Chat(text: "그래.", image: "karonRoom", type: .onlyText, who: .ballam, characterFace: true),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .ballam,    characterFace: true),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .ballam, characterFace: false)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], nextTextIndex: "007"),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], nextTextIndex: "008")], achievement: nil, choiceSkip: false),
    "007":BlockOfDayEpisode(chats:
                                [Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .ballam, characterFace: false),
                                Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .ballam, characterFace: false),
                     Chat(text: "...", image: "karonRoom", type: .onlyText, who: .ballam, characterFace: true),
                     Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .ballam, characterFace: true),
                    Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .ballam, characterFace: false)],
                            choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], nextTextIndex: "011"), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], nextTextIndex: "011")], achievement: nil, choiceSkip: false),
    "008":BlockOfDayEpisode(chats:
                                [Chat(text: "으음...", image: "", type: .onlyText, who: .ballam, characterFace: true),
                                Chat(text: "정말이니?", image: "", type: .onlyText, who: .ballam, characterFace: false)],
                            choices: [Choice(text: "네.", likability: [], nextTextIndex: "009"),
                                      Choice(text: "...아니요.", likability: [], nextTextIndex: "010")], achievement: nil, choiceSkip: false),
    "009":BlockOfDayEpisode(chats:
                                [Chat(text: "그래. 알겠다.", image: "", type: .onlyText, who: .ballam, characterFace: true),
                                Chat(text: "뭐. 중간에 도움이 필요하면 내가 나타날 것이니 걱정하지는 말고.", image: "", type: .onlyText, who: .ballam, characterFace: false)],
                            choices: [
                                Choice(text: "", likability: [], nextTextIndex: "End"),
                                Choice(text: "", likability: [], nextTextIndex: "End")], achievement: nil, choiceSkip: false),
    "010":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .ballam, characterFace: true),Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .ballam, characterFace: false),
                                 Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .ballam, characterFace: false),
                                 Chat(text: "...", image: "karonRoom", type: .onlyText, who: .ballam, characterFace: true),
                                 Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .ballam, characterFace: true),
                                 Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .ballam, characterFace: false)],
                             choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], nextTextIndex: "011"), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], nextTextIndex: "011")], achievement: nil, choiceSkip: false),
    "011":BlockOfDayEpisode(chats:
                                [Chat(text: "네 말이 맞아.", image: "", type: .onlyText, who: .ballam, characterFace: true),
                                 Chat(text: "자식을 잃은 슬픔과 그리움에 못 이겨 결국 능창군 뒤를 잇게 된다.", image: "", type: .onlyText, who: .ballam, characterFace: true)],
                            choices: [
                                Choice(text: "", likability: [], nextTextIndex: "End"),
                                Choice(text: "", likability: [], nextTextIndex: "End")], achievement: nil, choiceSkip: false)


])

//selectStageVC 테이블뷰 테스트 하드코딩용 데이터. 나중에 삭제예정
let testChapters: Array<Episode> = [
    Episode(episodeName: "임진왜란", episodeYear: 1592, episodeDesciption: "임진왜란 때 대부분의 궁궐이 화재로 인해 소실되었다.", episodePlaceImage: "placeImage_1x", isCleared: false, storyBlocks: ["1":BlockOfDayEpisode(chats: [], choices: [], achievement: nil, choiceSkip: false)]),
    Episode(episodeName: "인조반정", episodeYear: 1623, episodeDesciption: "광해군이 반정으로 인해 폐위되다", episodePlaceImage: "placeImage_1x",isCleared: false,storyBlocks: ["1":BlockOfDayEpisode(chats: [], choices: [], achievement: nil, choiceSkip: false)]),
    Episode(episodeName: "3.1 운동", episodeYear: 1919, episodeDesciption: "대한독립 만세",episodePlaceImage: "placeImage_1x", isCleared: false,storyBlocks: ["1":BlockOfDayEpisode(chats: [], choices: [], achievement: nil, choiceSkip: false)]),
    Episode(episodeName: "내 생일", episodeYear: 2003, episodeDesciption: "7월 28일임",episodePlaceImage: "placeImage_1x",isCleared: false, storyBlocks: ["1":BlockOfDayEpisode(chats: [], choices: [], achievement: nil, choiceSkip: false)])

]


