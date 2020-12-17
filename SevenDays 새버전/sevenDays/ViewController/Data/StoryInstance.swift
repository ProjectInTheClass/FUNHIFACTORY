//
//  StoryInstance.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import Foundation

var indexNumber = 0
var currentChatArray : [Chat] = []

let day0 = DayEpisode(startEpisode: "001", chapter: Chapter(chapterNumber: 0, chapterName: "사자의 심문", chapterInfo: "당신의 선택 하나하나가 이후의 운명을 바꿔나갈 것이다.", chapterImage: "chapterCover0"), history: .theTestBegins, storyBlocks: [
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
                         Choice(text: "아…? 네… 그러세요….", likability: [], nextTextId: "005"),
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
                                [Chat(text: "", image: "karonBook", type: .untouchableImage, who: .karon, characterFace: false, isItLastPage: false),
                                 Chat(text: "어디보자. 방금의 문답으로도", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "현실의 당신은 정이 많은 사람이라 할 수 있겠군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                        Chat(text: "당신의 죽음에 슬퍼할 사람이 많을 거 같습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "비어있음", likability: [], nextTextId: "035"),
                        Choice(text: "비어있음", likability: [], nextTextId: "035")], achievement: nil, choiceSkip: true),
    "023":BlockOfDayEpisode(chats: //첫번째 질문, 문답 2, 22
                                [Chat(text: "", image: "karonBook", type: .untouchableImage, who: .karon, characterFace: false, isItLastPage: false),
                                 Chat(text: "어디보자. 방금의 문답으로도", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "현실에 대한 미련이 남아있는\n사람이라 할 수 있겠군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "미련만큼 부활에 대한 의지를 보여주실 거라고 믿습니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                        Chat(text: "[카론은 책에다 무언가를 기록했다.]", image: "", type: .sectionHeader, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "비어있음", likability: [], nextTextId: "035"),
                        Choice(text: "비어있음", likability: [], nextTextId: "035")], achievement: nil, choiceSkip: true),
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
                                [Chat(text: "그렇다면 이 자리에 있는 것이", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                 Chat(text: "매우 안타까운 일일 수도\n있겠군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)],
                       choices: [
                        Choice(text: "", likability: [], nextTextId: "023"),
                        Choice(text: "", likability: [], nextTextId: "023")], achievement: nil, choiceSkip: true),
    "035":BlockOfDayEpisode(chats: [Chat(text: "자, 두번째 주제의 질문입니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "당신 앞에 작은 동물이 있습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "그것이 무엇이라고 생각됩니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "개라고 생각해.", likability: [], nextTextId: "036"),
                               Choice(text: "고양이.", likability: [], nextTextId: "045")], achievement: nil, choiceSkip: false),
    "036":BlockOfDayEpisode(chats: [Chat(text: "", image: "dog", type: .untouchableImage, who: .kirell, characterFace: true, isItLastPage: false),
                             Chat(text: "개가 어째서 당신 앞에 있을까요?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false)], choices: [
                               Choice(text: "나를 공격하기 위해서 아닐까?", likability: [], nextTextId: "037"),
                               Choice(text: "나를 마중 나왔겠지.", likability: [], nextTextId: "042")], achievement: nil, choiceSkip: false),
    "037":BlockOfDayEpisode(chats: [Chat(text: "물거나 짖는다는 말이군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "왜 당신을 공격하려 들까요?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "남의 집을 침입했으니까.", likability: [], nextTextId: "038"),
                               Choice(text: "왠지 개들은 나를 싫어하더라고.", likability: [], nextTextId: "041")], achievement: nil, choiceSkip: false),
    "038":BlockOfDayEpisode(chats: [Chat(text: "재미있는 답변이군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "살아 있을 때의 직업이 궁금해집니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true),
                             ], choices: [
                               Choice(text: "좋아.", likability: [], nextTextId: "040"),
                               Choice(text: "싫어.", likability: [], nextTextId: "040")], achievement: nil, choiceSkip: false),
    "039":BlockOfDayEpisode(chats: [Chat(text: "흐음, 그렇습니까?", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "좋은 참고가 되었습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "", image: "karonBook", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "잠시 정리 좀 하겠습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "흐음, 감성적인 면이 엿보이는군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "그만큼 다른 사람의 아픔과 행복에", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "공감할 수 있는 분이라", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "생각됩니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "054"),
                               Choice(text: "", likability: [], nextTextId: "054")], achievement: nil, choiceSkip: true),
    "040":BlockOfDayEpisode(chats: [Chat(text: "흐음, 그렇습니까?", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                    Chat(text: "좋은 참고가 되었습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                    Chat(text: "", image: "karonBook", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                    Chat(text: "잠시 정리 좀 하겠습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                    Chat(text: "역시나 비교적 감정을 잘 조절하는군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                    Chat(text: "그 침착함으로 사사로운 감정에 이끌리지 않고", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                    Chat(text: "선택을 하실 수 있는 분이라 생각됩니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "054"),
                               Choice(text: "", likability: [], nextTextId: "054")], achievement: nil, choiceSkip: true),
    "041":BlockOfDayEpisode(chats: [Chat(text: "개에 대한 트라우마라도 있나 보군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "아니면.......", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "개들의 성격이나 습성이 싫을 수도 있겠군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "052"),
                               Choice(text: "", likability: [], nextTextId: "052")], achievement: nil, choiceSkip: false),
    "042":BlockOfDayEpisode(chats: [Chat(text: "기특한 개군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "이 개에게 어떻게 하시겠습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "쓰다듬어 줘야지.", likability: [], nextTextId: "043"),
                               Choice(text: "개 무시.", likability: [], nextTextId: "044")], achievement: nil, choiceSkip: false),
    "043":BlockOfDayEpisode(chats: [Chat(text: "개가 기분 좋아하는 모습이 눈에 선하군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "앞으로도 기쁘게 마중 나올 것 같습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "052"),
                               Choice(text: "", likability: [], nextTextId: "052")], achievement: nil, choiceSkip: true),
    "044":BlockOfDayEpisode(chats: [Chat(text: "후후, 재미있는 답변이군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "어쨌든 당신이 무시에도 불구하고\n그 개는 열심히 ", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "꼬리를 흔들겠죠.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "052"),
                               Choice(text: "", likability: [], nextTextId: "052")], achievement: nil, choiceSkip: true),
    "045":BlockOfDayEpisode(chats: [Chat(text: "", image: "cat", type: .untouchableImage, who: .kirell, characterFace: true, isItLastPage: false),
                             Chat(text: "그 귀엽고 도도한 생물이", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "왜 당신 앞에 있을까요?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "내가 쫓아온 걸지도...", likability: [], nextTextId: "046"),
                               Choice(text: "지나가던 길이겠지.", likability: [], nextTextId: "048")], achievement: nil, choiceSkip: false),
    "046":BlockOfDayEpisode(chats: [
                            Chat(text: "따로 쫓아갈 이유라도 있습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "달리 이유가 있나? 귀엽잖아.", likability: [], nextTextId: "052"),
                               Choice(text: "못 된 도둑고양이라서.", likability: [], nextTextId: "023")], achievement: nil, choiceSkip: false),
    "047":BlockOfDayEpisode(chats: [Chat(text: "허허, 너무도 당연한 사실을/n물어봤군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "053"),
                               Choice(text: "", likability: [], nextTextId: "053")], achievement: nil, choiceSkip: false),
    "048":BlockOfDayEpisode(chats: [
                             Chat(text: "왜 굳이 당신 앞을 지나가고 있을까요?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "고양이가 누굴 신경 쓰겠어? 그냥 제 갈 길 가는 중이겠지.", likability: [], nextTextId: "049"),
                               Choice(text: "나에게 뭔가 어필하려는 거 아닐까.", likability: [], nextTextId: "050")], achievement: nil, choiceSkip: false),
    "049":BlockOfDayEpisode(chats: [Chat(text: "귀족같이 도도한 고양이군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "걷는 자태까지 궁금해지는데요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "053"),
                               Choice(text: "", likability: [], nextTextId: "053")], achievement: nil, choiceSkip: false),
    "050":BlockOfDayEpisode(chats: [Chat(text: "그러니까. 애교를 부린다는 말씀?", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "꼬리 끝을 살랑살랑 흔들고 있을 거 같군요. 허허.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "053"),
                               Choice(text: "", likability: [], nextTextId: "053")], achievement: nil, choiceSkip: false),
    "051":BlockOfDayEpisode(chats: [Chat(text: "그런 습성도 나름의 매력이긴 합니다만", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "그 점을 안 좋게 보는 사람도 분명 있겠죠.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "053"),
                               Choice(text: "", likability: [], nextTextId: "053")], achievement: nil, choiceSkip: false),
    "052":BlockOfDayEpisode(chats: [Chat(text: "그나저나 키렐.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                    Chat(text: "당신은 개를 좋아합니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "좋아.", likability: [], nextTextId: "039"),
                               Choice(text: "싫어.", likability: [], nextTextId: "040")], achievement: nil, choiceSkip: false),
    "053":BlockOfDayEpisode(chats: [Chat(text: "그나저나 키렐.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "당신은 고양이를 좋아합니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                Choice(text: "좋아.", likability: [], nextTextId: "039"),
                                Choice(text: "싫어.", likability: [], nextTextId: "040")], achievement: nil, choiceSkip: false),
                        "054":BlockOfDayEpisode(chats: [
                                                     Chat(text: "세 번째 주제의 질문입니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "부활을 하면 먼저 무엇부터 하겠습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "죽은 이유를 밝혀내겠어.", likability: [], nextTextId: "055"),
                                                       Choice(text: "행복하게 살려고 노력해야지.", likability: [], nextTextId: "061")], achievement: nil, choiceSkip: false),
                            "055":BlockOfDayEpisode(chats: [Chat(text: "긴장감을 높이는 답변이군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                                     Chat(text: "이유가 무엇입니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "다시 죽지 않기 위해.", likability: [], nextTextId: "056"),
                                                       Choice(text: "당연히 복수를 위해서.", likability: [], nextTextId: "059")], achievement: nil, choiceSkip: false),
                            "056":BlockOfDayEpisode(chats: [Chat(text: "호오, 왜 또 죽을 거라고 생각하는지.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                                     Chat(text: "저는 그게 궁금한데요", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "원한이 많을 것 같아.", likability: [], nextTextId: "057"),
                                                       Choice(text: "내 주변에 위험요소가 많을 것 같아.", likability: [], nextTextId: "058")], achievement: nil, choiceSkip: false),
                            "057":BlockOfDayEpisode(chats: [Chat(text: "대체 얼마나 험하게 살아온 겁니까.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                                     Chat(text: "부디 흉악범이 아니었으면 합니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "", likability: [], nextTextId: "068"),
                                                       Choice(text: "", likability: [], nextTextId: "068")], achievement: nil, choiceSkip: false),
                            "058":BlockOfDayEpisode(chats: [Chat(text: "사건 사고가 끊이지 않는 곳에 살았나 보군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                                     Chat(text: "부활하는 장소가 무너진 건물 더미가 아니었으면 ", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "좋겠습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "", likability: [], nextTextId: "068"),
                                                       Choice(text: "", likability: [], nextTextId: "068")], achievement: nil, choiceSkip: false),
                            "059":BlockOfDayEpisode(chats: [Chat(text: "복수라..", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                                     Chat(text: "복수에 대해 뭐라고 할 생각은 없습니다만,", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "복수를 하고 나면 무엇을 하실지가 궁금하군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "생각해 본 적 없어.", likability: [], nextTextId: "068"),
                                                       Choice(text: "행복하게 살려고 노력해야지.", likability: [], nextTextId: "061")], achievement: nil, choiceSkip: false),
                            "060":BlockOfDayEpisode(chats: [Chat(text: "그 답변은,", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                                     Chat(text: "지금은 복수만을 생각한다고 ", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "이해해도 되겠군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "", likability: [], nextTextId: "068"),
                                                       Choice(text: "", likability: [], nextTextId: "068")], achievement: nil, choiceSkip: false),
                            "061":BlockOfDayEpisode(chats: [Chat(text: "호오, 행복이라.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                                     Chat(text: "헌데, 당신이 생각하는 행복은 무엇입니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "평범한 생활을 하는 것이랄까?", likability: [], nextTextId: "062"),
                                                       Choice(text: "정했던 목표를 처리하는 것이랄까?", likability: [], nextTextId: "065")], achievement: nil, choiceSkip: false),
                            "062":BlockOfDayEpisode(chats: [
                                                     Chat(text: "그럼, 당신에게는 무엇이 평범한 삶이죠?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "가정을 갖고 사랑하는 가족을 위해 사는 것.", likability: [], nextTextId: "063"),
                                                       Choice(text: "사고로 죽지 않고 정해진 수명만큼 사는 것.", likability: [], nextTextId: "064")], achievement: nil, choiceSkip: false),
                            "063":BlockOfDayEpisode(chats: [Chat(text: "허허허.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                                     Chat(text: "정말로 평범하고 따뜻하군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "", likability: [], nextTextId: "023"),
                                                       Choice(text: "", likability: [], nextTextId: "023")], achievement: nil, choiceSkip: false),
                            "064":BlockOfDayEpisode(chats: [
                                                     Chat(text: "허허허.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "정말로 평범하고 무난하군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "", likability: [], nextTextId: "023"),
                                                       Choice(text: "", likability: [], nextTextId: "023")], achievement: nil, choiceSkip: false),
                            "065":BlockOfDayEpisode(chats: [Chat(text: "혹시...", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                                     Chat(text: "생각하고 있는 목표가 있습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "당연히 복수지.", likability: [], nextTextId: "059"),
                                                       Choice(text: "이제부터 찾아야겠지.", likability: [], nextTextId: "067")], achievement: nil, choiceSkip: false),
                            "066":BlockOfDayEpisode(chats: [Chat(text: "인생의 목표가 아니라", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                                     Chat(text: "제거할 목표였습니까!?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "허허, 이건 또.......", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "", likability: [], nextTextId: "068"),
                                                       Choice(text: "", likability: [], nextTextId: "068")], achievement: nil, choiceSkip: false),
                            "067":BlockOfDayEpisode(chats: [Chat(text: "인생의 목표는 이루는 것도 쉽지 않지만", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                                     Chat(text: "찾는 것도 어렵죠. 이해합니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "", likability: [], nextTextId: "069"),
                                                       Choice(text: "", likability: [], nextTextId: "069")], achievement: nil, choiceSkip: false),
                            "068":BlockOfDayEpisode(chats: [Chat(text: "", image: "karonBook", type: .untouchableImage, who: .karon, characterFace: true, isItLastPage: false),
                                                     Chat(text: "어쨌든, 이번에도 흥미로운 답변이었습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "일을 하기 전에 주변 정리부터 하실 분이군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "미래를 위해서는 과거를 잘 정리하는 것도", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "중요하죠.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "그나저나 부활하자마자 할 일이 많으실 거", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "같습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "", likability: [], nextTextId: "070"),
                                                       Choice(text: "", likability: [], nextTextId: "070")], achievement: nil, choiceSkip: false),
                            "069":BlockOfDayEpisode(chats: [Chat(text: "", image: "karonBook", type: .untouchableImage, who: .karon, characterFace: true, isItLastPage: false),
                                                                    Chat(text: "어쨌든, 이번에도 흥미로운 답변이었습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),Chat(text: "", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "부활시키는 보람이 있는 분이군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                                     Chat(text: "어디서든 새로운 삶을 개척하실 거 같습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                                                       Choice(text: "", likability: [], nextTextId: "070"),
                                                       Choice(text: "", likability: [], nextTextId: "070")], achievement: nil, choiceSkip: false),
    "070":BlockOfDayEpisode(chats: [Chat(text: "[카론은 책에다가 무언가를 기록했다.]", image: "", type: .sectionHeader, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "이제 마지막 주제의 질문입니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "키렐.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "시련과 마주할 각오가 되셨습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "당연하지.", likability: [], nextTextId: "071"),
                               Choice(text: "솔직히 두려워.", likability: [], nextTextId: "078")], achievement: nil, choiceSkip: false),
    "071":BlockOfDayEpisode(chats: [Chat(text: "그렇다면", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "부활을 위해 사람을 죽일 수도 있습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "... 설마 그렇게까지 해야 되는 건가?", likability: [], nextTextId: "072"),
                               Choice(text: "필요하다면.", likability: [], nextTextId: "075")], achievement: nil, choiceSkip: false),
    "072":BlockOfDayEpisode(chats: [Chat(text: "이 시련은 과정을 따지지 않습니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "결과를 위해서라면 무엇이든 해도 됩니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "그러니, 부활을 위해 사람을 죽일 수 있습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "남을 희생시키면서까지 부활하고 싶지는 않은데.", likability: [], nextTextId: "073"),
                               Choice(text: "정 필요하다면.", likability: [], nextTextId: "074")], achievement: nil, choiceSkip: false),
    "073":BlockOfDayEpisode(chats: [Chat(text: "좋은 마음가짐입니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "하지만", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "앞으로 그 마음가짐을 시험받게 될 겁니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "088"),
                               Choice(text: "", likability: [], nextTextId: "088")], achievement: nil, choiceSkip: true),
    "074":BlockOfDayEpisode(chats: [Chat(text: "막상 각오를 확인하니 부담이 되었나 보군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "그래도 시련의 무게감을 비로소 이해하신 거", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "같군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "088"),
                               Choice(text: "", likability: [], nextTextId: "088")], achievement: nil, choiceSkip: true),
    "075":BlockOfDayEpisode(chats: [Chat(text: "정말 각오가 대단하군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "당신 때문에 한 두 명이 아니라 여러 사람이", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "고통스러워한다고 해도 마찬가지입니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "당연한 거 아닌가?", likability: [], nextTextId: "076"),
                               Choice(text: "그렇게 확대해서 생각하고 싶지는 않은데....", likability: [], nextTextId: "077")], achievement: nil, choiceSkip: false),
    "076":BlockOfDayEpisode(chats: [Chat(text: "이런 이런 어리석은 질문이었군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "당신의 확고한 각오를 미쳐 몰라보았습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "087"),
                               Choice(text: "", likability: [], nextTextId: "087")], achievement: nil, choiceSkip: true),
    "077":BlockOfDayEpisode(chats: [Chat(text: "제가 너무 무리한 답변을 요구했군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "본의 아니게 당신의 망설임을 확인시킨 거", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "같습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "087"),
                               Choice(text: "", likability: [], nextTextId: "087")], achievement: nil, choiceSkip: true),
    "078":BlockOfDayEpisode(chats: [
                             Chat(text: "구체적으로 무엇이 두려운지 말해줄 수 있습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "목표만을 향해 돌진해나가는 나 자신이 두려워.", likability: [], nextTextId: "079"),
                               Choice(text: "앞으로 닥칠 시련들이 두려워.", likability: [], nextTextId: "080")], achievement: nil, choiceSkip: false),
    "079":BlockOfDayEpisode(chats: [Chat(text: "이건 또 의외군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "오히려 자기 자신이 폭주할까 두렵다니.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "075"),
                               Choice(text: "", likability: [], nextTextId: "075")], achievement: nil, choiceSkip: true),
    "080":BlockOfDayEpisode(chats: [
                             Chat(text: "어떤 시련이 될 거 같습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "나 자신의 극복이 아닐까.", likability: [], nextTextId: "081"),
                               Choice(text: "다른 이와의 경쟁.", likability: [], nextTextId: "084")], achievement: nil, choiceSkip: false),
    "081":BlockOfDayEpisode(chats: [Chat(text: "자신의 어떤 부분을 극복해야 한다고 ", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "생각하십니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "사악함.", likability: [], nextTextId: "082"),
                               Choice(text: "나약함.", likability: [], nextTextId: "083")], achievement: nil, choiceSkip: false),
    "082":BlockOfDayEpisode(chats: [Chat(text: "누구나 알게 모르게 사악함을 품고 있죠.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "새삼 그걸 인식하셨군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "087"),
                               Choice(text: "", likability: [], nextTextId: "087")], achievement: nil, choiceSkip: true),
    "083":BlockOfDayEpisode(chats: [Chat(text: "인간은 그것을 극복하면서 성장하죠.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "후후, 당신의 성장도 기대하겠습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "087"),
                               Choice(text: "", likability: [], nextTextId: "087")], achievement: nil, choiceSkip: true),
    "084":BlockOfDayEpisode(chats: [Chat(text: "이 시련에 승자와 패자가 있다고 생각하는군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "그럼 당신이 생각하는 승리는 무엇입니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "모든 경쟁자를 누르고 높은 곳에 올라 서는 것.", likability: [], nextTextId: "085"),
                               Choice(text: "모두에게 축복받고 인정받는 거야.", likability: [], nextTextId: "086")], achievement: nil, choiceSkip: false),
    "085":BlockOfDayEpisode(chats: [Chat(text: "마치 트로피를 쟁취한 챔피언 같군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "허허, 매우 도전적인 생각이군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "088"),
                               Choice(text: "", likability: [], nextTextId: "088")], achievement: nil, choiceSkip: true),
    "086":BlockOfDayEpisode(chats: [Chat(text: "그야말로 아름다운 승리군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "저도 이런 승리가 있다면 꼭 보고 싶군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "088"),
                               Choice(text: "", likability: [], nextTextId: "088")], achievement: nil, choiceSkip: true),
    "087":BlockOfDayEpisode(chats: [Chat(text: "", image: "karonBook", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "어디 보자, 마지막 질문은 각오를 물어본 것입니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "헌데, 각오에 앞서 신중함부터 보여주시는군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "그 신중함 만큼의 현명함도 기대됩니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "이 시련에 담긴 의미가 무엇인지", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "항상 고민하고 생각하길 바랍니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "[카론은 책에다가 무언가를 기록했다.]", image: "", type: .sectionHeader, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "089"),
                               Choice(text: "", likability: [], nextTextId: "089")], achievement: nil, choiceSkip: true),
    "088":BlockOfDayEpisode(chats: [Chat(text: "", image: "karonBook", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                                    Chat(text: "어디 보자, 마지막 질문은 각오를 물어본 것입니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                    Chat(text: "생각대로, 상당한 자신감을 보여주는군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                    Chat(text: "집중했을 때의 추진력 또한 상당한 분 같습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                    Chat(text: "저는 과정을 보지 않습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                    Chat(text: "결과만 볼 것입니다", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                    Chat(text: "원하는 대로 달려보십시오.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                                    Chat(text: "[카론은 책에다가 무언가를 기록했다.]", image: "", type: .sectionHeader, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "089"),
                               Choice(text: "", likability: [], nextTextId: "089")], achievement: nil, choiceSkip: true),
    "089":BlockOfDayEpisode(chats: [Chat(text: "자아 최후의 질문까지 끝났습니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "이제 자신을 조금 아시겠습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "당신은 차분하고 계산적인 분 같습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "어떤 계획을 가지고 시련을 극복할지", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "주의 깊게 지켜봐야 할 거 같군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "쳇, 멋대로 평가하기는....", likability: [], nextTextId: "090"),
                               Choice(text: "내가 그런 인간이라 이거지.", likability: [], nextTextId: "090")], achievement: nil, choiceSkip: false),
    "090":BlockOfDayEpisode(chats: [Chat(text: "자신이 누군지 조금 감이 오시는 모양이군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "자, 부활 과제에 대해 얘기할 차례군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "우선 이것을 받으십시오.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "[사자의 나침반을 습득했다.]", image: "", type: .sectionHeader, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "", image: "deadManCompass", type: .untouchableImage, who: .kirell, characterFace: false, isItLastPage: false),
                             Chat(text: "당신의 과제는", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "이 나침반이 향하는 장소들에 가는 겁니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "기한은 7일입니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false)], choices: [
                               Choice(text: "간단하네, 겨우 그뿐?", likability: [], nextTextId: "091"),
                               Choice(text: "그곳에 부활의 문이라도 있는 건가?", likability: [], nextTextId: "091")], achievement: nil, choiceSkip: false),
    "091":BlockOfDayEpisode(chats: [Chat(text: "글쎄요. 저도 자세히 얘기할 수는 없습니다만.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "나침반이 가리키는 장소에 도착하면", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "무언가 의미 있는 일이 일어나는 것만은", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "확실합니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "카론이 준 나침반의 바늘은 아까부터 계속 돌고 있는데.", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
                             Chat(text: "후후, 질문이 있는 거 같군요.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "이 나침반 고장 났잖아.", likability: [], nextTextId: "092"),
                               Choice(text: "회전하는 바늘 따라 춤이라도 춰야 하나?\n뭐야 이거?", likability: [], nextTextId: "092")], achievement: nil, choiceSkip: false),
    "092":BlockOfDayEpisode(chats: [Chat(text: "그 바늘은 주변에 누군가가 죽어야 멈춥니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "그래서 사자의 나침반이라 불리는 겁니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "누군가 죽어야 목적지를 가리킨다고?", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "잠깐, 그럼 누군가 죽고 죽이는 시련이라는 거잖아!", likability: [], nextTextId: "093"),
                               Choice(text: "나 말고 다른 사람도 부활 시련을 받는다는 뜻인가?", likability: [], nextTextId: "094")], achievement: nil, choiceSkip: false),
    "093":BlockOfDayEpisode(chats: [Chat(text: "이것은 기회입니다. 강요가 아닙니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "이 기회가 싫다면, 죽음을 받아들이시면 됩니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: ".......", image: "", type: .onlyText, who: .kirell, characterFace: false, isItLastPage: false),
                             Chat(text: "기회를 받아들이는 것으로 알고 계속", image: "", type: .onlyText, who: .kirell, characterFace: false, isItLastPage: false),
                             Chat(text: "설명하겠습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "095"),
                               Choice(text: "", likability: [], nextTextId: "095")], achievement: nil, choiceSkip: true),
    "094":BlockOfDayEpisode(chats: [
                             Chat(text: "네 맞습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "095"),
                               Choice(text: "", likability: [], nextTextId: "095")], achievement: nil, choiceSkip: true),
    "095":BlockOfDayEpisode(chats: [Chat(text: "시련을 시작하면", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "비슷한 시기에 사고를 당했거나", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "뭔가의 인연이 있는 분들을 만나게 될 것입니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "그분들과 함께 시련을 겪어야 합니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "설마 그들과 싸워야 하나?", likability: [], nextTextId: "096"),
                               Choice(text: "부활에 인원 제한이라도 있는 건 아니지?", likability: [], nextTextId: "096")], achievement: nil, choiceSkip: false),
    "096":BlockOfDayEpisode(chats: [Chat(text: "제한도 없고 규칙도 없습니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "협력을 하든, 경쟁을 하든 상관없\n습니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "저는 과제의 완료만을 볼 테니", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "각자에게 주어진 과제만 완료하면\n됩니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "다만, 다른 분들은 다른 과제를 가지고 있다는\n점만은 주의하셔야 될 겁니다.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "나와는 다른 과제를 가지고 시련에 참가하는 사람들이 있고", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: false),
                             Chat(text: "이 나침반은 그 사람들이 죽어야 작동한다 이거지. 게다가 기한은 7일이라....", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                             Chat(text: "준비가 되셨습니까?", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "이제 제가 드릴 충고는 하나밖에 없군요.", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
                             Chat(text: "행운을 빕니다.", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
                             Chat(text: "뭐야, 갑자기 세상이 뒤틀리고 있어!?", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
                             Chat(text: "엇!? 누가 날 잡아.... 아아아아!!!", image: "", type: .textPopup, who: .kirell, characterFace: false, isItLastPage: true)], choices: [
                               Choice(text: "", likability: [], nextTextId: "End"),
                               Choice(text: "", likability: [], nextTextId: "End")], achievement: nil, choiceSkip: false)
])

/*
 ,
"000":BlockOfDayEpisode(chats: [Chat(text: "", image: "", type: .onlyText, who: .karon, characterFace: true, isItLastPage: false),
Chat(text: "", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: false),
Chat(text: "", image: "", type: .onlyText, who: .karon, characterFace: false, isItLastPage: true)], choices: [
 Choice(text: "", likability: [], nextTextId: "023"),
 Choice(text: "", likability: [], nextTextId: "023")], achievement: nil, choiceSkip: false)
 */


let day1 = DayEpisode(startEpisode: "101", chapter: Chapter(chapterNumber: 1, chapterName: "첫 동료", chapterInfo: "", chapterImage: "chapter1Cover"), history: .lastMemories , storyBlocks: [
        "101":BlockOfDayEpisode(chats: [
            Chat(text: "으음, 카론이 있던 취조실이 아니잖아.", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
            Chat(text: "설마..", image: "", type: .textPopup, who: .kirell, characterFace: true, isItLastPage: false),
    ], choices: [
        Choice(text: "시련이 시작된건가?", likability: [], nextTextId: "102"),
        Choice(text: "7일 중 첫 날이 시작된 건가?", likability: [], nextTextId: "102")
    ], achievement: nil, choiceSkip: false),
    
        "102":BlockOfDayEpisode(chats: [
            Chat(text: "", image: "compass", type: .untouchableImage, who: .kirell, characterFace: true, isItLastPage: false),
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
                        ], choices: [Choice(text: "", likability: [], nextTextId: "End")], achievement: nil, choiceSkip: false),
    
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
                        ], choices: [Choice(text: "", likability: [], nextTextId: "End")], achievement: nil, choiceSkip: false)])
