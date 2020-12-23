//
//  FunhiStoryTest.swift
//  sevenDays
//
//  Created by 최서연 on 2020/12/22.
//

import Foundation

let test1 = DayEpisode(startEpisode: "001", chapter: Chapter(chapterNumber: 0, chapterName: "베리 스토리", chapterInfo: "베리가 짠 스토리 테스트 시작합니다.", chapterImage: "chapterCover0"), history: .theTestBegins, storyBlocks: [
    "001":BlockOfDayEpisode(chats:
                                [Chat(text: "사건을 시작하기 전에 먼저 이 사건에 대해 알려주겠다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: true)],
                            choices: [
                                    Choice(text: "알겠어요.", likability: [], nextTextId: "002"),
                                    Choice(text: "이번은 어떤 내용인가요?", likability: [], nextTextId: "002")], achievement: nil, choiceSkip: false),
    "002":BlockOfDayEpisode(chats:
                                [Chat(text: "네가 학교에서 수업을 잘 들었다면 이미 알 거라고 생각한다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                Chat(text: "이번 사건은 인조반정이야.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                            choices: [
                                    Choice(text: "어... 많이 들어봤는데 잘 모르겠어요.", likability: [], nextTextId: "004"),
                                    Choice(text: "광해군이 폐위된 사건이죠?", likability: [], nextTextId: "003")], achievement: nil, choiceSkip: false),
    "003":BlockOfDayEpisode(chats:
                                [Chat(text: "맞아.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], nextTextId: "005"),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], nextTextId: "006")], achievement: nil, choiceSkip: false),
    "004":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                Chat(text: "내가 설명을 좀 해주마.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                Chat(text: "광해군 다음 왕이 누구인지 아니?", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: true)],
                            choices: [
                                    Choice(text: "음... 잘 모르겠는데...", likability: [], nextTextId: "005"),
                                    Choice(text: "조선 왕 순서를 읊어봐야겠다.", likability: [], nextTextId: "006")], achievement: nil, choiceSkip: false),
    "005":BlockOfDayEpisode(chats:
                                [Chat(text: "모를 수 있지.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                Chat(text: "하지만 역사에 좀 귀기울여 살거라.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                Chat(text: "어쨌든 인조반정은 이름 그대로", image: "karonRoom", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], nextTextId: "007"),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], nextTextId: "008")], achievement: nil, choiceSkip: false),
    "006":BlockOfDayEpisode(chats:
                                [Chat(text: "태정태세문단세예성연중인명선광인", image: "", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false),
                                Chat(text: "아!", image: "", type: .onlyText, who: .kirell, characterFace: false, isItLastPage: false),
                                Chat(text: "인조네요!", image: "karonRoom", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false),
                                Chat(text: "그래.", image: "karonRoom", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                Chat(text: "인조를 중심으로 벌어진 반란으로 광해군이 폐위된 사건이지.", image: "", type: .onlyText, who: .karon,    characterFace: true, isItLastPage: false),
                                Chat(text: "더 자세한 설명이 필요하니?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                            choices: [
                                    Choice(text: "네! 해주세요.", likability: [], nextTextId: "007"),
                                    Choice(text: "아뇨? 전 이미 전후사정을 다 알고 있는걸요?", likability: [], nextTextId: "008")], achievement: nil, choiceSkip: false),
    "007":BlockOfDayEpisode(chats:
                                [Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true),
                                Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                     Chat(text: "...", image: "karonRoom", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                     Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                    Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                            choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], nextTextId: "011"), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], nextTextId: "011")], achievement: nil, choiceSkip: false),
    "008":BlockOfDayEpisode(chats:
                                [Chat(text: "으음...", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                Chat(text: "정말이니?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                            choices: [Choice(text: "네.", likability: [], nextTextId: "009"),
                                      Choice(text: "...아니요.", likability: [], nextTextId: "010")], achievement: nil, choiceSkip: false),
    "009":BlockOfDayEpisode(chats:
                                [Chat(text: "그래. 알겠다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                Chat(text: "뭐. 중간에 도움이 필요하면 내가 나타날 것이니 걱정하지는 말고.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                            choices: [
                                Choice(text: "", likability: [], nextTextId: "End"),
                                Choice(text: "", likability: [], nextTextId: "End")], achievement: nil, choiceSkip: false),
    "010":BlockOfDayEpisode(chats:
                                [Chat(text: "그럴 줄 알았다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),Chat(text: "인조의 아비는 정원군이라는 사람이었다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                 Chat(text: "그런데 정원군의 아들 중 셋째 능창군이 유배를 가게 되었지.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                 Chat(text: "...", image: "karonRoom", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "능창군은 유배지에서 자살을 하고 말았단다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "그 소식을 들은 정원군 마음이 어땠을까? ", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                             choices: [Choice(text: "많이... 힘들었을 것 같아요.", likability: [], nextTextId: "011"), Choice(text: "아들을 엄청 그리워하지 않았을까요?", likability: [], nextTextId: "011")], achievement: nil, choiceSkip: false),
    "011":BlockOfDayEpisode(chats:
                                [Chat(text: "그래. 알겠다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: true)],
                            choices: [
                                Choice(text: "", likability: [], nextTextId: "End"),
                                Choice(text: "", likability: [], nextTextId: "End")], achievement: nil, choiceSkip: false)


])
