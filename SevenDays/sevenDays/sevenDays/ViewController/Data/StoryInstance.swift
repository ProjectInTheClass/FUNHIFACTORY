//
//  StoryInstance.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import Foundation

var indexNumber = 0
var currentChatArray : [Chat] = []

let day0 = DayEpisode(chapter: Chapter(chapterNumber: 0, chapterName: "사자의 심문", chapterInfo: "당신의 선택 하나하나가 이후의 운명을 바꿔나갈 것이다."), history: .theTestBegins, storyBlocks: [
    "001":BlockOfDayEpisode(chats:
                                [Chat(text: "00:00", image: "", type: .sectionHeader, who: .kirell, characterFace: false, isItLastPage: false),
                                Chat(text: "으으, 추워. 여긴 어디지?", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
                     Chat(text: "", image: "karonRoom", type: .touchableImage, who: .kirell, characterFace: true, isItLastPage: false),
                     Chat(text: "살벌한 꿈이군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                    Chat(text: "하필이면 취조실이라니.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                            choices: [Choice(text: "누구냐!?", likability: [], nextTextId: "002"), Choice(text: "누군진 몰라도 지금 상황을 설명해주겠어?", likability: [], nextTextId: "002")], achievement: nil, choiceSkip: false),
    "002":BlockOfDayEpisode(chats:
                                [Chat(text: "저는 죽음의 안내자 카론.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                         Chat(text: "생과 사의 경계에 있는 최후의 꿈에 오신 것을", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                         Chat(text: "환영합니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                      choices: [
                        Choice(text: "대체 뭔 소리야?", likability: [], nextTextId: "003"),
                        Choice(text: "죽음의 안내자? 지금 날 놀리는 건가?", likability: [], nextTextId: "003")], achievement: nil, choiceSkip: false),
    "003":BlockOfDayEpisode(chats:
                                [Chat(text: "당신은 죽었습니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: true)],
                      choices: [
                        Choice(text: "그래서 어쩌라고?", likability: [], nextTextId: "004"),
                        Choice(text: "죽은 사람이 어떻게 말을 할 수 있나?", likability: [], nextTextId: "004")], achievement: nil, choiceSkip: false),
    "004":BlockOfDayEpisode(chats:
                                [Chat(text: "당장은 이해가 안 되실 겁니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                         Chat(text: "망각의 강을 막 빠져나오셨으니까요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                        choices: [
                         Choice(text: "아… 네… 그러세요….", likability: [], nextTextId: "005"),
                            Choice(text: "뭐야, 무슨 영화나 소설 설정도 아니고.", likability: [], nextTextId: "005")], achievement: nil, choiceSkip: false),
    "005":BlockOfDayEpisode(chats:
                                [Chat(text: "의심을 풀기 위해, 하나 묻겠습니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "당신의 이름. 기억할 수 있습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                        choices: [
                         Choice(text: "나참. 어린애 장난도 아니고 유치하게", likability: [], nextTextId: "006"),
                            Choice(text: "그 정도야 뭐.", likability: [], nextTextId: "006")], achievement: nil, choiceSkip: false),
    "006":BlockOfDayEpisode(chats:
                                [Chat(text: "...그런데 내 이름이 뭐였지?", image: "", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false),
                                 Chat(text: "오기 전에 뭘 했죠? 사소한 거라도 말해보시죠.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: true)],
                        choices: [
                            Choice(text: "아무것도... 모르겠어.", likability: [], nextTextId: "007"),
                            Choice(text: "어... 어라. 너! 내 머릿속에 뭘 한거지?", likability: [], nextTextId: "007")], achievement: nil, choiceSkip: false),
    "007":BlockOfDayEpisode(chats:
                                [Chat(text: "설명해 드리죠.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                         Chat(text: "당신의 이름은 키렐. \n망각의 강을 막 건넌", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                         Chat(text: "망자입니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                        choices: [
                         Choice(text: "사신. 망각의 강. 그리고 내 이름…\n알겠고. 본론이 뭐야?", likability: [], nextTextId: "008"),
                            Choice(text: "젠장. 대체 어떻게 된거야?", likability: [], nextTextId: "008")], achievement: nil, choiceSkip: false),
    "008":BlockOfDayEpisode(chats:
                                [Chat(text: "당신은 현재 ‘죽음에 이르기 직전’에 있습니다. ", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                         Chat(text: "그런 당신에게 부활의 기회를 주려고 합니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                        choices: [
                         Choice(text: "점점 더 어처구니가 없군. 알았으니 계속 설명해봐.", likability: [], nextTextId: "009"),
                            Choice(text: "다시 태어날 수 있는 건가?", likability: [], nextTextId: "009")], achievement: nil, choiceSkip: false),
    "009":BlockOfDayEpisode(chats:
                                [Chat(text: "부활 가능성이 있는 분을 안내하는 것이 제", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                         Chat(text: "역할입니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                         Chat(text: "하지만 그냥은 안 됩니다. ", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                         Chat(text: "제가 정해주는 과제를 완료하셔야 합니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                        choices: [
                         Choice(text: "역시 공짜는 없군.", likability: [], nextTextId: "011"),
                            Choice(text: "왜 그런게 필요하지?", likability: [], nextTextId: "011")], achievement: nil, choiceSkip: false),
    "010":BlockOfDayEpisode(chats:
                                [Chat(text: "부활하기 위해서는 자격이 필요합니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "그 자격을 확인하기 위한 시련인 것입니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                        choices: [
                         Choice(text: "운전면허 시험 같은 건가?", likability: [], nextTextId: "011"),
                            Choice(text: "동화 속 주인공이 된 기분이군.", likability: [], nextTextId: "011")], achievement: nil, choiceSkip: false),
    "011":BlockOfDayEpisode(chats:
                                [Chat(text: "후후후, 재미있는 비유군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: true)],
                        choices: [
                         Choice(text: "이런 말 하기는 그런데, 내가 왜 부활해야 하지?", likability: [], nextTextId: "012"),
                            Choice(text: "날 부활시키면 당신에게 무슨 이득이야?", likability: [], nextTextId: "013")], achievement: nil, choiceSkip: false),
    "012":BlockOfDayEpisode(chats:
                                [Chat(text: "하지만 그건 제가 답할 의문이 아닙니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "당신이 찾아야 할 답입니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "", likability: [], nextTextId: "014"),
                        Choice(text: "", likability: [], nextTextId: "014")], achievement: nil, choiceSkip: true),
    "013":BlockOfDayEpisode(chats:
                                [Chat(text: "다른 이유는 없습니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "이것이 제 사명이기 때문입니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                        Chat(text: "그보다 당신이 부활해야 할 이유를 찾는 것이 낫지 않을까요?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "", likability: [], nextTextId: "014"),
                        Choice(text: "", likability: [], nextTextId: "014")], achievement: nil, choiceSkip: true),
    "014":BlockOfDayEpisode(chats:
                                [Chat(text: "당신은 기억이 없기 때문에 부활을 해야 할 이유도,", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "동기도 없을 겁니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                        Chat(text: "살아야 할 이유를 찾지 못하고 저승을 떠도는", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                        Chat(text: "망자가 되고 싶지 않다면", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                        Chat(text: "우선은 스스로가 누군지 알아야 합니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                        Chat(text: "자, 그럼.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                        Chat(text: "키렐 당신에 대해 알아보죠.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "장난해? 방금까지 기억이 없다고 했잖아.", likability: [], nextTextId: "015"),
                        Choice(text: "이미 망각의 강을 건넜는데?", likability: [], nextTextId: "015")], achievement: nil, choiceSkip: false),
    "015":BlockOfDayEpisode(chats:
                                [Chat(text: "기억은 없어도 됩니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "시련에 임하는 자신을 알리는 것이죠.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "머리 아픈 얘기가 나올 거 같은데.", likability: [], nextTextId: "016"),
                        Choice(text: "나 자신을 알라 이건가.", likability: [], nextTextId: "016")], achievement: nil, choiceSkip: false),
    "016":BlockOfDayEpisode(chats:
                                [Chat(text: "이제부터 질문을 할 테니.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "마음 내키는 대로 대답하십시오.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "틀리면?", likability: [], nextTextId: "017"),
                        Choice(text: "신중하게 답해야 하는 건가?", likability: [], nextTextId: "017")], achievement: nil, choiceSkip: false),
    "017":BlockOfDayEpisode(chats:
                                [Chat(text: "정답은 없습니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "하지만 답변을 하면서 자신에 대해 알게 될 겁니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "스무고개 같은 느낌인데.", likability: [], nextTextId: "018"),
                        Choice(text: "답변을 하면서 내 성격을 자연스럽게 드러낸다는 건가.", likability: [], nextTextId: "018")], achievement: nil, choiceSkip: false),
    "018":BlockOfDayEpisode(chats:
                                [Chat(text: "그렇다면 지금부터는 답변을 신중하게 해야겠군", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                                 Chat(text: "우선 첫 번째 주제의 질문입니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                        Chat(text: "키렐, 지금 당장 알고 싶은 정보가 있습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "음, 가족들에 대해 알고 싶어.", likability: [], nextTextId: "019"),
                        Choice(text: "죽은 이유를 알고 싶어.", likability: [], nextTextId: "028")], achievement: nil, choiceSkip: false),
    "019":BlockOfDayEpisode(chats:
                                [Chat(text: "대부분 죽기 전 가족을 떠올리시죠.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "당신의 가족이 어떻게 있기를 바랍니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "슬퍼하고 있었으면 해.", likability: [], nextTextId: "020"),
                        Choice(text: "당연히 행복했으면 해.", likability: [], nextTextId: "025")], achievement: nil, choiceSkip: false),
    "020":BlockOfDayEpisode(chats:
                                [Chat(text: "호오, 슬퍼하기를 바란다고요?", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "어째서입니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "그만큼 나를 진심으로 사랑했다는 뜻이니까.", likability: [], nextTextId: "021"),
                        Choice(text: "가족이 죽었는데 당연히 슬퍼해야지.", likability: [], nextTextId: "024")], achievement: nil, choiceSkip: false),
    "021":BlockOfDayEpisode(chats:
                                [Chat(text: "호오... 가족의 사랑을 확인하고 싶은 겁니까?", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: true)],
                       choices: [
                        Choice(text: "다음", likability: [], nextTextId: "023"),
                        Choice(text: "다음", likability: [], nextTextId: "023")], achievement: nil, choiceSkip: true),
    "022":BlockOfDayEpisode(chats: //첫번째 질문, 문답 1, 21
                                [Chat(text: "", image: "book", type: .untouchableImage, who: .karon, characterFace: false, isItLastPage: false),
                                 Chat(text: "어디보자. 방금의 문답으로도", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "현실의 당신은 정이 많은 사람이라 할 수 있겠군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                        Chat(text: "당신의 죽음에 슬퍼할 사람이 많을 거 같습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "비어있음", likability: [], nextTextId: "666"),
                        Choice(text: "비어있음", likability: [], nextTextId: "666")], achievement: nil, choiceSkip: true),
    "023":BlockOfDayEpisode(chats: //첫번째 질문, 문답 2, 22
                                [Chat(text: "", image: "book", type: .untouchableImage, who: .karon, characterFace: false, isItLastPage: false),
                                 Chat(text: "어디보자. 방금의 문답으로도", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "현실에 대한 미련이 남아있는\n사람이라 할 수 있겠군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "미련만큼 부활에 대한 의지를 보여주실 거라고 믿습니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: true)],
                       choices: [
                        Choice(text: "비어있음", likability: [], nextTextId: "666"),
                        Choice(text: "비어있음", likability: [], nextTextId: "666")], achievement: nil, choiceSkip: false),
    "024":BlockOfDayEpisode(chats:
                                [Chat(text: "그렇긴 한데,", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "억지로라도 울어야 된다는 말로 들리는군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "", likability: [], nextTextId: "023"),
                        Choice(text: "", likability: [], nextTextId: "023")], achievement: nil, choiceSkip: true),
    "025":BlockOfDayEpisode(chats:
                                [Chat(text: "하지만 가족들이 당신 없이 행복할 수 있을까요?", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: true)],
                       choices: [
                        Choice(text: "힘들라나...", likability: [], nextTextId: "026"),
                        Choice(text: "반드시 행복해야지.", likability: [], nextTextId: "027")], achievement: nil, choiceSkip: false),
    "026":BlockOfDayEpisode(chats:
                                [Chat(text: "죽어서도 걱정입니까?", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "성실한 가장 같군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "", likability: [], nextTextId: "022"),
                        Choice(text: "", likability: [], nextTextId: "022")], achievement: nil, choiceSkip: true),
    "027":BlockOfDayEpisode(chats:
                                [Chat(text: "호오, 가슴이 따뜻해지는 \n답변이군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: true)],
                       choices: [
                        Choice(text: "", likability: [], nextTextId: "022"),
                        Choice(text: "", likability: [], nextTextId: "022")], achievement: nil, choiceSkip: true),
    "028":BlockOfDayEpisode(chats: //27
                                [Chat(text: "당연히 의문이 들겠죠.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "당신 나이의 여성이 자연사할\n가능성은 거의 없으니까요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                        Chat(text: "그렇다면 누군가에 의해 죽었거나 사고일 텐데. 당신은 어느 쪽이라 생각하십니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "누군가에 의해 살해당했겠네.", likability: [], nextTextId: "029"),
                        Choice(text: "사고를 당한 게 아닐까?", likability: [], nextTextId: "032")], achievement: nil, choiceSkip: false),
    "029":BlockOfDayEpisode(chats:
                                [Chat(text: "호오, 그렇게 생각하십니까?", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "만약 살해범이 누군지 안다면 어떻게 하시겠습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "그 이름을 저주할 거야.", likability: [], nextTextId: "030"),
                        Choice(text: "더 이상 죄를 짓지 말라고 기도하고 싶어.", likability: [], nextTextId: "031")], achievement: nil, choiceSkip: false),
    "030":BlockOfDayEpisode(chats:
                                [Chat(text: "그 한 마디에 당신의 부활 의지가 엿 보이는군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "그리고 멋진 표정이었습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "", likability: [], nextTextId: "023"),
                        Choice(text: "", likability: [], nextTextId: "023")], achievement: nil, choiceSkip: true),
    "031":BlockOfDayEpisode(chats:
                                [Chat(text: "설마, 용서를 하겠다는 겁니까?", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "이렇게 착한 분일 줄이야.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "", likability: [], nextTextId: "022"),
                        Choice(text: "", likability: [], nextTextId: "022")], achievement: nil, choiceSkip: true),
    "032":BlockOfDayEpisode(chats:
                                [Chat(text: "사고도 괜히 당하는 것이\n아닙니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "왜 하필 당신에게 그런 사고가\n벌어졌을까요?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "어쩌면...., 누군가가 사고로 위장한 것일 수도 있겠군.", likability: [], nextTextId: "033"),
                        Choice(text: "부주의했거나 운이 없었겠지.", likability: [], nextTextId: "034")], achievement: nil, choiceSkip: false),
    "033":BlockOfDayEpisode(chats:
                                [Chat(text: "재미있는 예측을 하시는군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "만약 그렇다면 주변에 적이나\n위험이 많다는 것인데.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                        Chat(text: "허허, 이거 부활 후가\n걱정되는군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "", likability: [], nextTextId: "023"),
                        Choice(text: "", likability: [], nextTextId: "023")], achievement: nil, choiceSkip: true),
    "034":BlockOfDayEpisode(chats:
                                [Chat(text: "그 한 마디에 당신의 부활 의지가 엿 보이는군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "그리고 멋진 표정이었습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "그렇다면 이 자리에 있는 것이", likability: [], nextTextId: "023"),
                        Choice(text: "매우 안타까운 일일 수도\n있겠군요.", likability: [], nextTextId: "023")], achievement: nil, choiceSkip: false)
])


/* 예시
 BlockOfDayEpisode(chats:
                    [Chat(text: <#T##String?#>, image: "", type: .onlyText, who: .karon, characterFace: true),
                     Chat(text: <#T##String?#>, image: "", type: .onlyText, who: .karon, characterFace: false),
                     Chat(text: <#T##String?#>, image: "", type: .onlyText, who: .karon, characterFace: false)],
                    choices: [
                     Choice(text: <#T##String#>, likability: [], nextTextId: "<#T##Int#>),
                     Choice(text: <#T##String#>, likability: [], nextTextId: "<#T##Int#>)], achievement: nil)
*/


let day1 = DayEpisode(chapter: Chapter(chapterNumber: 1, chapterName: "첫 동료", chapterInfo: ""), history: .lastMemories , storyBlocks: [
        "101":BlockOfDayEpisode(chats: [
            Chat(text: "으음, 카론이 있던 취조실이 아니잖아.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "설마..", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
    ], choices: [
        Choice(text: "시련이 시작된건가?", likability: [], nextTextId: "102"),
        Choice(text: "7일 중 첫 날이 시작된 건가?", likability: [], nextTextId: "102")
    ], achievement: nil, choiceSkip: false),
    
        "102":BlockOfDayEpisode(chats: [
            Chat(text: "", image: "", type: .untouchableImage, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "사자의 나침반은 누군가 죽어야 작동이 된다고 했어.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "일단은 사람을 찾아야 되겠군.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "하지만.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "막상 사람을 만나면 어떻게 대해야 할까?", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false)
    ], choices: [
        Choice(text: "동료로 대해야 할까?", likability: [], nextTextId: "103"),
        Choice(text: "희생양으로 삼아야 할까?", likability: [], nextTextId: "103")
    ], achievement: nil, choiceSkip: false),
    
        "103":BlockOfDayEpisode(chats: [
            Chat(text: "아직은 모르겠군.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "일단은 만나보고 판단하자.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "", image: "", type: .touchableImage, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "좀비라도 나올 거 같은 풍경이네.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "응?!", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "이런. 실례했습니다. ", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "본의 아니게 놀라게 했군요.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "저는 아르고입니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "그보다, 저에게 이렇게 조용히 접근할 필요가 있었나요? ", likability: [], nextTextId: "104"),
        Choice(text: "으슥한 거리에서 발소리까지 죽이다니. 장난이 지나치네요.", likability: [], nextTextId: "105")
    ], achievement: nil, choiceSkip: false),
    
        "104":BlockOfDayEpisode(chats: [
            Chat(text: "다른 의도는 없었습니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "저도 모르게 그렇게 행동한 거 같습니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "기억은 안 나지만 생전의 습관인가 봅니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "키렐입니다. 상당히 특이한 습관을 가지고 계시군요.", likability: [], nextTextId: "106"),
        Choice(text: "당신도 이름 외의 기억을 잃었군요. 저는 키렐입니다.", likability: [], nextTextId: "107")
    ], achievement: nil, choiceSkip: false),
    
        "105":BlockOfDayEpisode(chats: [
            Chat(text: "놀라게 할 생각은 없었습니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "저도 모르게 그렇게 행동한 거 같습니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "기억은 안 나지만 생전의 습관인가 봅니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "키렐입니다. 상당히 특이한 습관을 가지고 계시군요.", likability: [], nextTextId: "106"),
        Choice(text: "당신도 이름 외의 기억을 잃었군요. 저는 키렐입니다.", likability: [], nextTextId: "107")
    ], achievement: nil, choiceSkip: false),
    
        "106":BlockOfDayEpisode(chats: [
            Chat(text: "죄송합니다. 앞으로 주의하겠습니다. ", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "그나저나 키렐, 당신도 시련 중인 망자 같은데,", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "이왕이면 함께하지 않겠습니까?", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "겉보기와 다르게 신사적인 중년이네.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "사자의 나침반은 주변에 죽은 사람이 있어야 작동이 된다고 했어.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "사람이 있는 편이 무조건 유리할 거야,", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "거절할 이유가 없군요. ", likability: [], nextTextId: "108"),
        Choice(text: "그렇지 않아도 함께 할 사람이 필요했습니다.", likability: [], nextTextId: "108")
    ], achievement: nil, choiceSkip: false),
    
        "107":BlockOfDayEpisode(chats: [
            Chat(text: "이해해주셔서 다행입니다.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "그나저나 키렐, 당신도 시련 중인 망자 같은데,", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "이왕이면 함께하지 않겠습니까?", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "겉보기와 다르게 신사적인 중년이네.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "사자의 나침반은 주변에 죽은 사람이 있어야 작동이 된다고 했어.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "사람이 있는 편이 무조건 유리할 거야,", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "거절할 이유가 없군요. ", likability: [], nextTextId: "108"),
        Choice(text: "그렇지 않아도 함께 할 사람이 필요했습니다.", likability: [], nextTextId: "108")
    ], achievement: nil, choiceSkip: false),
    
        "108":BlockOfDayEpisode(chats: [
            Chat(text: "흠…….", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "키렐, 그 말은 제가 동료가 되는 게 ", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "당신에게 무조건 유리하다는 뜻인가요?", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "윽?!", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "갑자기 아르고에게서 엄청난 압박감이 느껴지네.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "이거, 답변에 주의해야겠어.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "네. 부정하지 않습니다.", likability: [], nextTextId: "109"),
        Choice(text: "아니요, 너무 반가워서 그만….", likability: [], nextTextId: "110")
    ], achievement: nil, choiceSkip: false),
    
        "109":BlockOfDayEpisode(chats: [
            Chat(text: "그렇군요.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "솔직히 말하죠.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "", image: "", type: .untouchableImage, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "키렐, 저는 총이 있습니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "협박할 셈인가요?", likability: [], nextTextId: "111"),
        Choice(text: "드디어 본색을 드러내는 건가요?", likability: [], nextTextId: "112")
    ], achievement: nil, choiceSkip: false),
    
        "110":BlockOfDayEpisode(chats: [
            Chat(text: "으음, 사람을 반가워할 당신이", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "저를 처음 볼 땐 무척 놀라더군요.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "으윽, 이 사람 엄청 날카로워.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "솔직히 말하죠.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "", image: "", type: .untouchableImage, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "키렐, 저는 총이 있습니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "협박할 셈인가요?", likability: [], nextTextId: "111"),
        Choice(text: "드디어 본색을 드러내는 건가요?", likability: [], nextTextId: "112")
    ], achievement: nil, choiceSkip: false),
        "111":BlockOfDayEpisode(chats: [
            Chat(text: "협박할 용도로 꺼낸 것이 아닙니다.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "보다 진실된 얘기를 듣고 싶어", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "저부터 대등한 정보를 하나 꺼낸 것입니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "분위기가 장난이 아니네.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "앞으로 함꼐 할 동료로써 묻겠습니다.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "키렐, 당신의 과제는 무엇이죠?", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "어떤 목표 지점에 도착하는 겁니다.", likability: [], nextTextId: "113"),
        Choice(text: "나침반이 가리키는 방향에 도착하는 겁니다.", likability: [], nextTextId: "115")
    ], achievement: nil, choiceSkip: false),
    
        "112":BlockOfDayEpisode(chats: [
        
            Chat(text: "확실하게 말해주시죠.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "목표 지점이 어디죠?", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false)
        
    ], choices: [
        Choice(text: "그게, 저도 잘 모릅니다. ", likability: [], nextTextId: "114"),
        Choice(text: "나침반이 가리키는 방향입니다. ", likability: [], nextTextId: "115")
    ], achievement: nil, choiceSkip: false),
    
                        "113":BlockOfDayEpisode(chats: [
                            Chat(text: "거짓말하지 마시죠.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "당신도 사신에게 힌트를 듣고 장비를 받았을 텐데요.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
                            Chat(text: "키렐, 당신의 장비가 뭔지 보여주시겠습니까?", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
                            Chat(text: "", image: "", type: .untouchableImage, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "이 나침반입니까?", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "하지만 바늘이 빙빙 돌고 있지 않습니까?", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
                            Chat(text: "이걸로 어떻게 목적지를 찾는다는 거죠?", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
                            Chat(text: "으음, 사자의 나침반에 대해 말해도 될까?", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "가끔 멈추는 때가 있습니다.", likability: [], nextTextId: "116"),
        Choice(text: "거기까지는, 말할 수 없습니다.", likability: [], nextTextId: "117")
    ], achievement: nil, choiceSkip: false),
    
                        "114":BlockOfDayEpisode(chats: [
                            Chat(text: "", image: "", type: .untouchableImage, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "이 나침반입니까?", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "하지만 바늘이 빙빙 돌고 있지 않습니까?", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
                            Chat(text: "이걸로 어떻게 목적지를 찾는다는 거죠?", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
                            Chat(text: "으음, 사자의 나침반에 대해 말해도 될까?", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "가끔 멈추는 때가 있습니다.", likability: [], nextTextId: "116"),
        Choice(text: "거기까지는, 말할 수 없습니다.", likability: [], nextTextId: "117")
    ], achievement: nil, choiceSkip: false),
    
    
        "115":BlockOfDayEpisode(chats: [
            Chat(text: "거짓말,", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "바늘이 언제 멈출니 모르는데", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "당신은 그 나침반을 보고 있지 않았습니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "지금은 멈추지 않는다는 것을 알고 있는 것이죠.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "아니면 멈추는 조건을 알고 있다는 뜻.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "흠.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "본의 아니게 추궁을 해버렸군요.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "어쨌든 그 이상은 말하기 힘든 거 같군요.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "이 이상 물어볼 거면 그냥 헤어지죠.", likability: [], nextTextId: "118"),
        Choice(text: "아직은 당신을 믿을 수 없으니까요.", likability: [], nextTextId: "119")
    ], achievement: nil, choiceSkip: false),
    
    
        "116":BlockOfDayEpisode(chats: [
            Chat(text: "흠.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "본의 아니게 추궁을 해버렸군요.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "어쨌든 그 이상은 말하기 힘든 거 같군요.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "이 이상 물어볼 거면 그냥 헤어지죠.", likability: [], nextTextId: "118"),
        Choice(text: "아직은 당신을 믿을 수 없으니까요.", likability: [], nextTextId: "119")
    ], achievement: nil, choiceSkip: false),
    
    
        "117":BlockOfDayEpisode(chats: [
            Chat(text: "죄송합니다, 본의 아니게 기분을 상하게 했군요.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "당신과 마찬가지로 저에게도 비밀이 있습니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "함께 협력할 생각이라면 서로 비밀을 가진 채로 타협합시다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "지금은 어색해도 언젠가 서로 믿고 아끼는 관계가 된다면,", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "그때 털어놓는 것이 좋을 것 같습니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "저 성격과 저 얼굴을 가지고 아끼는 관계가 되자고 말하니….", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "안 어울려. 수상할 정도로.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "으아아아아아아!!", image: "", type: .onlyText, who: .unknown, characterFace: true, isItLastPage: false),
            Chat(text: "살려줘!!", image: "", type: .onlyText, who: .unknown, characterFace: false, isItLastPage: false),
            Chat(text: "", image: "", type: .untouchableImage, who: .unknown, characterFace: false, isItLastPage: false),
            Chat(text: "총소리!?", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "키렐 어찌할까요?", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false)
    ], choices: [
        Choice(text: "상황을 파악하기 위해서라도 가보죠.", likability: [], nextTextId: "120"),
        Choice(text: "도움을 요청하잖아요! 빨리 가요!", likability: [], nextTextId: "121")
    ], achievement: nil, choiceSkip: false),
    
        "118":BlockOfDayEpisode(chats: [
            Chat(text: "이해합니다.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "당신과 마찬가지로 저에게도 비밀이 있습니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "함께 협력할 생각이라면 서로 비밀을 가진 채로 타협합시다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "지금은 어색해도 언젠가 서로 믿고 아끼는 관계가 된다면,", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "그때 털어놓는 것이 좋을 것 같습니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "저 성격과 저 얼굴을 가지고 아끼는 관계가 되자고 말하니….", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "안 어울려. 수상할 정도로.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "으아아아아아아!!", image: "", type: .onlyText, who: .unknown, characterFace: true, isItLastPage: false),
            Chat(text: "살려줘!!", image: "", type: .onlyText, who: .unknown, characterFace: false, isItLastPage: false),
            Chat(text: "", image: "", type: .animationPopup, who: .unknown, characterFace: false, isItLastPage: false),
            Chat(text: "총소리!?", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "키렐 어찌할까요?", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false)
    ], choices: [
        Choice(text: "상황을 파악하기 위해서라도 가보죠.", likability: [], nextTextId: "120"),
        Choice(text: "도움을 요청하잖아요! 빨리 가요!", likability: [], nextTextId: "121")
    ], achievement: nil, choiceSkip: false),
    
        "119":BlockOfDayEpisode(chats: [
            Chat(text: "잠시 후", image: "", type: .sectionHeader, who: .unknown, characterFace: false, isItLastPage: false),
            Chat(text: "", image: "", type: .touchableImage, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "…크윽, 자…잠깐만.", image: "", type: .onlyText, who: .wolf, characterFace: false, isItLastPage: false),
            Chat(text: "뭘, 이제와서 그러나~", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "살려줘… 잘못했어 제발!!", image: "", type: .onlyText, who: .wolf, characterFace: false, isItLastPage: false),
            Chat(text: "", image: "", type: .animationPopup, who: .unknown, characterFace: false, isItLastPage: false),
            Chat(text: "상처 입은 남자가 죽었다.", image: "", type: .sectionHeader, who: .unknown, characterFace: false, isItLastPage: false),
            Chat(text: "늦었군. 이미 죽었어.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "이래서.. 시련이라는 건가.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "어라. 이번에는 또 누구야?", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "우릴 겨눴어! 눈치 챈 건가!?", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "쉿! 당신은 계속 숨어있어요.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "나는 발람이야.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "그쪽도 나와서 소개해야지.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "(아르고 총 장전 사진)", image: "", type: .animationPopup, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "나는 아르고다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "이야, 서로 총을 겨눌 상대가 생길 줄이야.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "근데 날 죽일 생각이 있긴 한 거야?", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "글쎄. 네 행동에 달렸겠지.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
            Chat(text: "발람인가 하는 살인마는 아르고에게 정신이 집중되었어.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "(돌멩이 사진)", image: "", type: .untouchableImage, who: .kirell, characterFace: false, isItLastPage: false),
            Chat(text: "지금이라면…….", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "(아니야, 기다려보자)", likability: [], nextTextId: "122"),
        Choice(text: "(몰래 접근해 돌멩이로 뒤통수를 내리치자.)", likability: [], nextTextId: "104")
    ], achievement: nil, choiceSkip: false),
    
       "120":BlockOfDayEpisode(chats: [
        Chat(text: "그리고 거기 숨어 있는 아가씨 이름은 뭐지?", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "너 따위에게 알려주고 싶지 않은데.", likability: [], nextTextId: "123"),
        Choice(text: "키렐이다. 기분 나쁠 정도로 감이 좋네.", likability: [], nextTextId: "124")
    ], achievement: nil, choiceSkip: false),
    
    
        "121":BlockOfDayEpisode(chats: [
            Chat(text: "알았어. 그럼 그냥 아름다운 아가씨라고 불러줄게.", image: "", type: .onlyText, who: .ballam, characterFace: true, isItLastPage: false),
            Chat(text: "키렐.", image: "", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "하하하, 부끄럼쟁이네.", image: "", type: .onlyText, who: .ballam, characterFace: true, isItLastPage: false),
            Chat(text: "그나저나 둘 다 너무 긴장한 거 아니야?", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "난 과제를 완료하고 싶은 거야.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "죽일 생각이 아니라고.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "일단 총 좀 내리고 생각하는 게 어떄?", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "그 과제가 사람을 죽이는 거 아닌가?", likability: [], nextTextId: "125"),
        Choice(text: "그 말을 어떻게 믿으라는 거지?", likability: [], nextTextId: "126")
    ], achievement: nil, choiceSkip: false),
    
        "122":BlockOfDayEpisode(chats: [
            Chat(text: "과분한 칭찬이야. 고마워~", image: "", type: .onlyText, who: .ballam, characterFace: true, isItLastPage: false),
            Chat(text: "그나저나 둘 다 너무 긴장한 거 아니야?", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "난 과제를 완료하고 싶은 거야.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "죽일 생각이 아니라고.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "일단 총 좀 내리고 생각하는 게 어떄?", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "그 과제가 사람을 죽이는 거 아닌가?", likability: [], nextTextId: "125"),
        Choice(text: "그 말을 어떻게 믿으라는 거지?", likability: [], nextTextId: "126")
    ], achievement: nil, choiceSkip: false),
    
        "123":BlockOfDayEpisode(chats: [
            Chat(text: "이야, 예리하네.", image: "", type: .onlyText, who: .ballam, characterFace: true, isItLastPage: false),
            Chat(text: "키렐이라고 했나? 너 마음에 든다.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "여하튼, 거기 아저씨는 아르고라고 했지?", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "총 든 사람끼리 얘기해보자고.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "지금 당장 싸우고 싶어?", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: ".......", image: "", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "원한다면.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "대화 참 짧네. 뭔 얘기를 못 하겠어.", image: "", type: .onlyText, who: .ballam, characterFace: true, isItLastPage: false)
    ], choices: [
        Choice(text: "한 판 붙어볼까?", likability: [], nextTextId: "127"),
        Choice(text: "조용히 물러날 수 없냐?", likability: [], nextTextId: "128")
    ], achievement: nil, choiceSkip: false),
    
        "124":BlockOfDayEpisode(chats: [
            Chat(text: "이런 이런, 내 첫인상이 너무 인상적이었나 보네.", image: "", type: .onlyText, who: .ballam, characterFace: true, isItLastPage: false),
            Chat(text: "그럼 그냥 믿지 마.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "여하튼, 거기 아저씨는 아르고라고 했지?", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "총 든 사람끼리 얘기해보자고.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: "지금 당장 싸우고 싶어?", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
            Chat(text: ".......", image: "", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "원한다면.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
            Chat(text: "대화 참 짧네. 뭔 얘기를 못 하겠어.", image: "", type: .onlyText, who: .ballam, characterFace: true, isItLastPage: false)
    ], choices: [
        Choice(text: "한 판 붙어볼까?", likability: [], nextTextId: "127"),
        Choice(text: "조용히 물러날 수 없냐?", likability: [], nextTextId: "128")
    ], achievement: nil, choiceSkip: false),
    
       "125":BlockOfDayEpisode(chats: [
        Chat(text: "좋은 자세야. 하지만 나도 바보는 아니야.", image: "", type: .onlyText, who: .ballam, characterFace: true, isItLastPage: false),
        Chat(text: "너희 둘 다 시체와 총 앞에서도 태연한 인간들이라고.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
        Chat(text: "이대로 싸우면 서로 무사하지 못할 게 뻔하지.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
        Chat(text: "싸움은 관두자고.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "현명한 판단이군.", likability: [], nextTextId: "129"),
        Choice(text: "그럼, 빨리 가버려.", likability: [], nextTextId: "129")
    ], achievement: nil, choiceSkip: false),
    
                        "126":BlockOfDayEpisode(chats: [
                            Chat(text: "아쉽게도 그래야겠네.", image: "", type: .onlyText, who: .ballam, characterFace: true, isItLastPage: false),
                            Chat(text: "너희 둘 다 시체와 총 앞에서도 태연한 인간들이라고.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
                            Chat(text: "이대로 싸우면 서로 무사하지 못할 게 뻔하지.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
                            Chat(text: "싸움은 관두자고.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false)
    ], choices: [
        Choice(text: "현명한 판단이군.", likability: [], nextTextId: "129"),
        Choice(text: "그럼, 빨리 가버려.", likability: [], nextTextId: "129")
    ], achievement: nil, choiceSkip: false),
    
                        "127":BlockOfDayEpisode(chats: [
                            Chat(text: "그나저나 앞으로 기대되는 상대들이네.", image: "", type: .onlyText, who: .ballam, characterFace: true, isItLastPage: false),
                            Chat(text: "다음에 또 보자고.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
                            Chat(text: "아마, 반드시 다시 보게 되겠네.", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
                            Chat(text: "그때까지 안녕~~", image: "", type: .onlyText, who: .ballam, characterFace: false, isItLastPage: false),
                            Chat(text: "발람이 떠났다.", image: "", type: .sectionHeader, who: .unknown, characterFace: false, isItLastPage: false),
                            Chat(text: "진짜로 갔군요.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false)
    ], choices: [
        Choice(text: "다른 이유가 있어서 잠시 물러난 게 아닐까요?", likability: [], nextTextId: "130"),
        Choice(text: "진짜로 우리가 위험하다고 생각한 걸까요?", likability: [], nextTextId: "130")
    ], achievement: nil, choiceSkip: false),
    
                        "128":BlockOfDayEpisode(chats: [
                            Chat(text: "어쩌면 저처럼 특별한 사정이 있는 총을 가져서 그럴 수도 있죠.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false)
    ], choices: [
        Choice(text: "아르고 당신처럼?", likability: [], nextTextId: "131"),
        Choice(text: "특별한 사정이라고요?", likability: [], nextTextId: "132")
    ], achievement: nil, choiceSkip: false),
    
                        "129":BlockOfDayEpisode(chats: [
                            Chat(text: "음, 제 실언을 날카롭게 잘 찌르는군요.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "정곡을 찔렸다면서 오히려 웃잖아?", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
                            Chat(text: "특이한 성격이네.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
                            Chat(text: "특별한 조건이 맞아야 작동되는 총일 겁니다.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "아마도 그의 과제와 연관이 있는 거겠죠.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
                            Chat(text: "그렇군. 사자의 나침반과 마찬가지로….", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "", image: "", type: .animationPopup, who: .kirell, characterFace: false, isItLastPage: false),
                            Chat(text: "엇!? 지금 나침반이 작동했어!", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "설마 이제야 나침반 바늘이 멈춘 겁니까?", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "…….", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "이런, 뭔가 눈치챈 기색이네.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "잘됐습니다. 이제 목적지로 갈 수 있겠군요.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "…….", image: "", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false)
    ], choices: [
        Choice(text: "당신도 갈 건가요?", likability: [], nextTextId: "133"),
        Choice(text: "발람을 막으려면 당신의 도움이 필요하겠네요.", likability: [], nextTextId: "134")
    ], achievement: nil, choiceSkip: false),
    
                        "130":BlockOfDayEpisode(chats: [
                            Chat(text: "특별한 조건이 맞아야 작동되는 총일 겁니다.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "아마도 그의 과제와 연관이 있는 거겠죠.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
                            Chat(text: "그렇군. 사자의 나침반과 마찬가지로….", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "", image: "", type: .animationPopup, who: .kirell, characterFace: false, isItLastPage: false),
                            Chat(text: "엇!? 지금 나침반이 작동했어!", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "설마 이제야 나침반 바늘이 멈춘 겁니까?", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "…….", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "이런, 뭔가 눈치챈 기색이네.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "잘됐습니다. 이제 목적지로 갈 수 있겠군요.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "…….", image: "", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false)
    ], choices: [
        Choice(text: "당신도 갈 건가요?", likability: [], nextTextId: "133"),
        Choice(text: "발람을 막으려면 당신의 도움이 필요하겠네요.", likability: [], nextTextId: "134")
    ], achievement: nil, choiceSkip: false),
    
                        "131":BlockOfDayEpisode(chats: [
                            Chat(text: "네, 당연히 함께하겠습니다.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "아무래도 당신의 도움이 필요할 거 같습니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
                            Chat(text: "………….", image: "", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "왜 날 필요로 할까?", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
                            Chat(text: "발람은 자신의 총을 보여주면서", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "사람을 죽이는 과제를 받았다고 얘기했어.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "어쩌면 아르고도….", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "가시죠, 키렐.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "그래도 지금은 함께 하는 수밖에 없어.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "Day 1 End", image: "", type: .sectionHeader, who: .unknown, characterFace: false, isItLastPage: false)
                        ], choices: [], achievement: nil, choiceSkip: false),
    
                        "132":BlockOfDayEpisode(chats: [
                            Chat(text: "기꺼이 도와드리죠.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "저 또한 당신을 필요로 합니다.", image: "", type: .onlyText, who: .argo, characterFace: false, isItLastPage: false),
                            Chat(text: "………….", image: "", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "왜 날 필요로 할까?", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
                            Chat(text: "발람은 자신의 총을 보여주면서", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "사람을 죽이는 과제를 받았다고 얘기했어.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "어쩌면 아르고도….", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "가시죠, 키렐.", image: "", type: .onlyText, who: .argo, characterFace: true, isItLastPage: false),
                            Chat(text: "그래도 지금은 함께 하는 수밖에 없어.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                            Chat(text: "Day 1 End", image: "", type: .sectionHeader, who: .unknown, characterFace: false, isItLastPage: false)
                        ], choices: [], achievement: nil, choiceSkip: false)])
