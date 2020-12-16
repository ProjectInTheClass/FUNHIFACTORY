//
//  StoryInstance.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import Foundation


import UIKit


let day1 = DayEpisode(history: .lastMemories , storyBlocks: [
    BlockOfDayEpisode(chats: [
        Chat(text: "으음, 카론이 있던 취조실이 아니잖아.", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "설마..", image: nil, type: .textPopup, who: .kirell, characterFace: true),
    ], choices: [
        Choice(text: "시련이 시작된건가?", likability: [], nextTextIndex: 1),
        Choice(text: "7일 중 첫 날이 시작된 건가?", likability: [], nextTextIndex: 1)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: nil, image: "", type: .untouchableImage, who: .kirell, characterFace: true),
        Chat(text: "사자의 나침반은 누군가 죽어야 작동이 된다고 했어.", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "일단은 사람을 찾아야 되겠군.", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "하지만.", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "막상 사람을 만나면 어떻게 대해야 할까?", image: nil, type: .textPopup, who: .kirell, characterFace: true)
    ], choices: [
        Choice(text: "동료로 대해야 할까?", likability: [], nextTextIndex: 2),
        Choice(text: "희생양으로 삼아야 할까?", likability: [], nextTextIndex: 2)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "아직은 모르겠군.", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "일단은 만나보고 판단하자.", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: nil, image: "", type: .touchableImage, who: .kirell, characterFace: false),
        Chat(text: "좀비라도 나올 거 같은 풍경이네.", image: "", type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "응?!", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "이런. 실례했습니다. ", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "본의 아니게 놀라게 했군요.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "저는 아르고입니다.", image: nil, type: .onlyText, who: .argo, characterFace: false)
    ], choices: [
        Choice(text: "그보다, 저에게 이렇게 조용히 접근할 필요가 있었나요? ", likability: [], nextTextIndex: 3),
        Choice(text: "으슥한 거리에서 발소리까지 죽이다니. 장난이 지나치네요.", likability: [], nextTextIndex: 4)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "다른 의도는 없었습니다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "저도 모르게 그렇게 행동한 거 같습니다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "기억은 안 나지만 생전의 습관인가 봅니다.", image: nil, type: .onlyText, who: .argo, characterFace: false)
    ], choices: [
        Choice(text: "키렐입니다. 상당히 특이한 습관을 가지고 계시군요.", likability: [], nextTextIndex: 5),
        Choice(text: "당신도 이름 외의 기억을 잃었군요. 저는 키렐입니다.", likability: [], nextTextIndex: 6)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "놀라게 할 생각은 없었습니다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "저도 모르게 그렇게 행동한 거 같습니다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "기억은 안 나지만 생전의 습관인가 봅니다.", image: nil, type: .onlyText, who: .argo, characterFace: false)
    ], choices: [
        Choice(text: "키렐입니다. 상당히 특이한 습관을 가지고 계시군요.", likability: [], nextTextIndex: 5),
        Choice(text: "당신도 이름 외의 기억을 잃었군요. 저는 키렐입니다.", likability: [], nextTextIndex: 6)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "죄송합니다. 앞으로 주의하겠습니다. ", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "그나저나 키렐, 당신도 시련 중인 망자 같은데,", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "이왕이면 함께하지 않겠습니까?", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "겉보기와 다르게 신사적인 중년이네.", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "사자의 나침반은 주변에 죽은 사람이 있어야 작동이 된다고 했어.", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "사람이 있는 편이 무조건 유리할 거야,", image: nil, type: .textPopup, who: .kirell, characterFace: false)
    ], choices: [
        Choice(text: "거절할 이유가 없군요. ", likability: [], nextTextIndex: 7),
        Choice(text: "그렇지 않아도 함께 할 사람이 필요했습니다.", likability: [], nextTextIndex: 7)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "이해해주셔서 다행입니다.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "그나저나 키렐, 당신도 시련 중인 망자 같은데,", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "이왕이면 함께하지 않겠습니까?", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "겉보기와 다르게 신사적인 중년이네.", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "사자의 나침반은 주변에 죽은 사람이 있어야 작동이 된다고 했어.", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "사람이 있는 편이 무조건 유리할 거야,", image: nil, type: .textPopup, who: .kirell, characterFace: false)
    ], choices: [
        Choice(text: "거절할 이유가 없군요. ", likability: [], nextTextIndex: 7),
        Choice(text: "그렇지 않아도 함께 할 사람이 필요했습니다.", likability: [], nextTextIndex: 7)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "흠…….", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "키렐, 그 말은 제가 동료가 되는 게 ", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "당신에게 무조건 유리하다는 뜻인가요?", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "윽?!", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "갑자기 아르고에게서 엄청난 압박감이 느껴지네.", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "이거, 답변에 주의해야겠어.", image: nil, type: .textPopup, who: .kirell, characterFace: false)
    ], choices: [
        Choice(text: "네. 부정하지 않습니다.", likability: [], nextTextIndex: 8),
        Choice(text: "아니요, 너무 반가워서 그만….", likability: [], nextTextIndex: 9)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "그렇군요.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "솔직히 말하죠.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: nil, image: "", type: .untouchableImage, who: .argo, characterFace: false),
        Chat(text: "키렐, 저는 총이 있습니다.", image: nil, type: .onlyText, who: .argo, characterFace: false)
    ], choices: [
        Choice(text: "협박할 셈인가요?", likability: [], nextTextIndex: 10),
        Choice(text: "드디어 본색을 드러내는 건가요?", likability: [], nextTextIndex: 11)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "으음, 사람을 반가워할 당신이", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "저를 처음 볼 땐 무척 놀라더군요.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "으윽, 이 사람 엄청 날카로워.", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "솔직히 말하죠.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: nil, image: "", type: .untouchableImage, who: .argo, characterFace: false),
        Chat(text: "키렐, 저는 총이 있습니다.", image: nil, type: .onlyText, who: .argo, characterFace: false)
    ], choices: [
        Choice(text: "협박할 셈인가요?", likability: [], nextTextIndex: 10),
        Choice(text: "드디어 본색을 드러내는 건가요?", likability: [], nextTextIndex: 11)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "협박할 용도로 꺼낸 것이 아닙니다.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "보다 진실된 얘기를 듣고 싶어", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "저부터 대등한 정보를 하나 꺼낸 것입니다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "분위기가 장난이 아니네.", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "앞으로 함꼐 할 동료로써 묻겠습니다.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "키렐, 당신의 과제는 무엇이죠?", image: nil, type: .onlyText, who: .argo, characterFace: false)
    ], choices: [
        Choice(text: "어떤 목표 지점에 도착하는 겁니다.", likability: [], nextTextIndex: 12),
        Choice(text: "나침반이 가리키는 방향에 도착하는 겁니다.", likability: [], nextTextIndex: 14)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        
        Chat(text: "확실하게 말해주시죠.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "목표 지점이 어디죠?", image: nil, type: .onlyText, who: .argo, characterFace: false)
        
    ], choices: [
        Choice(text: "그게, 저도 잘 모릅니다. ", likability: [], nextTextIndex: 13),
        Choice(text: "나침반이 가리키는 방향입니다. ", likability: [], nextTextIndex: 14)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "거짓말하지 마시죠.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "당신도 사신에게 힌트를 듣고 장비를 받았을 텐데요.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "키렐, 당신의 장비가 뭔지 보여주시겠습니까?", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: nil, image: "", type: .untouchableImage, who: .kirell, characterFace: true),
        Chat(text: "이 나침반입니까?", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "하지만 바늘이 빙빙 돌고 있지 않습니까?", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "이걸로 어떻게 목적지를 찾는다는 거죠?", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "으음, 사자의 나침반에 대해 말해도 될까?", image: nil, type: .textPopup, who: .kirell, characterFace: false)
    ], choices: [
        Choice(text: "가끔 멈추는 때가 있습니다.", likability: [], nextTextIndex: 15),
        Choice(text: "거기까지는, 말할 수 없습니다.", likability: [], nextTextIndex: 16)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: nil, image: "", type: .untouchableImage, who: .kirell, characterFace: true),
        Chat(text: "이 나침반입니까?", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "하지만 바늘이 빙빙 돌고 있지 않습니까?", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "이걸로 어떻게 목적지를 찾는다는 거죠?", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "으음, 사자의 나침반에 대해 말해도 될까?", image: nil, type: .textPopup, who: .kirell, characterFace: false)
    ], choices: [
        Choice(text: "가끔 멈추는 때가 있습니다.", likability: [], nextTextIndex: 15),
        Choice(text: "거기까지는, 말할 수 없습니다.", likability: [], nextTextIndex: 16)
        ], achievement: nil),
    
    
    BlockOfDayEpisode(chats: [
        Chat(text: "거짓말,", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "바늘이 언제 멈출니 모르는데", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "당신은 그 나침반을 보고 있지 않았습니다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "지금은 멈추지 않는다는 것을 알고 있는 것이죠.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "아니면 멈추는 조건을 알고 있다는 뜻.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "흠.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "본의 아니게 추궁을 해버렸군요.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "어쨌든 그 이상은 말하기 힘든 거 같군요.", image: nil, type: .onlyText, who: .argo, characterFace: false)
    ], choices: [
        Choice(text: "이 이상 물어볼 거면 그냥 헤어지죠.", likability: [], nextTextIndex: 17),
        Choice(text: "아직은 당신을 믿을 수 없으니까요.", likability: [], nextTextIndex: 18)
        ], achievement: nil),
    
    
    BlockOfDayEpisode(chats: [
        Chat(text: "흠.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "본의 아니게 추궁을 해버렸군요.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "어쨌든 그 이상은 말하기 힘든 거 같군요.", image: nil, type: .onlyText, who: .argo, characterFace: false)
    ], choices: [
        Choice(text: "이 이상 물어볼 거면 그냥 헤어지죠.", likability: [], nextTextIndex: 17),
        Choice(text: "아직은 당신을 믿을 수 없으니까요.", likability: [], nextTextIndex: 18)
        ], achievement: nil),
    
    
    BlockOfDayEpisode(chats: [
        Chat(text: "죄송합니다, 본의 아니게 기분을 상하게 했군요.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "당신과 마찬가지로 저에게도 비밀이 있습니다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "함께 협력할 생각이라면 서로 비밀을 가진 채로 타협합시다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "지금은 어색해도 언젠가 서로 믿고 아끼는 관계가 된다면,", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "그때 털어놓는 것이 좋을 것 같습니다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "저 성격과 저 얼굴을 가지고 아끼는 관계가 되자고 말하니….", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "안 어울려. 수상할 정도로.", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "으아아아아아아!!", image: nil, type: .onlyText, who: .unknown, characterFace: true),
        Chat(text: "살려줘!!", image: nil, type: .onlyText, who: .unknown, characterFace: false),
        Chat(text: nil, image: "", type: .untouchableImage, who: .unknown, characterFace: false),
        Chat(text: "총소리!?", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "키렐 어찌할까요?", image: nil, type: .onlyText, who: .argo, characterFace: true)
    ], choices: [
        Choice(text: "상황을 파악하기 위해서라도 가보죠.", likability: [], nextTextIndex: 19),
        Choice(text: "도움을 요청하잖아요! 빨리 가요!", likability: [], nextTextIndex: 20)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "이해합니다.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "당신과 마찬가지로 저에게도 비밀이 있습니다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "함께 협력할 생각이라면 서로 비밀을 가진 채로 타협합시다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "지금은 어색해도 언젠가 서로 믿고 아끼는 관계가 된다면,", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "그때 털어놓는 것이 좋을 것 같습니다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "저 성격과 저 얼굴을 가지고 아끼는 관계가 되자고 말하니….", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "안 어울려. 수상할 정도로.", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "으아아아아아아!!", image: nil, type: .onlyText, who: .unknown, characterFace: true),
        Chat(text: "살려줘!!", image: nil, type: .onlyText, who: .unknown, characterFace: false),
        Chat(text: nil, image: "", type: .animationPopup, who: .unknown, characterFace: false),
        Chat(text: "총소리!?", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "키렐 어찌할까요?", image: nil, type: .onlyText, who: .argo, characterFace: true)
    ], choices: [
        Choice(text: "상황을 파악하기 위해서라도 가보죠.", likability: [], nextTextIndex: 19),
        Choice(text: "도움을 요청하잖아요! 빨리 가요!", likability: [], nextTextIndex: 20)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "잠시 후", image: nil, type: .sectionHeader, who: .unknown, characterFace: false),
        Chat(text: nil, image: nil, type: .touchableImage, who: .kirell, characterFace: false),
        Chat(text: "…크윽, 자…잠깐만.", image: nil, type: .onlyText, who: .wolf, characterFace: false),
        Chat(text: "뭘, 이제와서 그러나~", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "살려줘… 잘못했어 제발!!", image: nil, type: .onlyText, who: .wolf, characterFace: false),
        Chat(text: nil, image: "", type: .animationPopup, who: .unknown, characterFace: false),
        Chat(text: "상처 입은 남자가 죽었다.", image: nil, type: .sectionHeader, who: .unknown, characterFace: false),
        Chat(text: "늦었군. 이미 죽었어.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "이래서.. 시련이라는 건가.", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "어라. 이번에는 또 누구야?", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: nil, image: "", type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "우릴 겨눴어! 눈치 챈 건가!?", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "쉿! 당신은 계속 숨어있어요.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "나는 발람이야.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "그쪽도 나와서 소개해야지.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "(아르고 총 장전 사진)", image: nil, type: .animationPopup, who: .argo, characterFace: false),
        Chat(text: "나는 아르고다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "이야, 서로 총을 겨눌 상대가 생길 줄이야.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "근데 날 죽일 생각이 있긴 한 거야?", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "글쎄. 네 행동에 달렸겠지.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "발람인가 하는 살인마는 아르고에게 정신이 집중되었어.", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "(돌멩이 사진)", image: nil, type: .untouchableImage, who: .kirell, characterFace: false),
        Chat(text: "지금이라면…….", image: nil, type: .textPopup, who: .kirell, characterFace: false)
    ], choices: [
        Choice(text: "(아니야, 기다려보자)", likability: [], nextTextIndex: 21),
        Choice(text: "(몰래 접근해 돌멩이로 뒤통수를 내리치자.)", likability: [], nextTextIndex: 3)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "그리고 거기 숨어 있는 아가씨 이름은 뭐지?", image: nil, type: .onlyText, who: .ballam, characterFace: false)
    ], choices: [
        Choice(text: "너 따위에게 알려주고 싶지 않은데.", likability: [], nextTextIndex: 22),
        Choice(text: "키렐이다. 기분 나쁠 정도로 감이 좋네.", likability: [], nextTextIndex: 23)
        ], achievement: nil),
    
    
    BlockOfDayEpisode(chats: [
        Chat(text: "알았어. 그럼 그냥 아름다운 아가씨라고 불러줄게.", image: nil, type: .onlyText, who: .ballam, characterFace: true),
        Chat(text: "키렐.", image: nil, type: .onlyText, who: .kirell, characterFace: true),
        Chat(text: "하하하, 부끄럼쟁이네.", image: nil, type: .onlyText, who: .ballam, characterFace: true),
        Chat(text: "그나저나 둘 다 너무 긴장한 거 아니야?", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "난 과제를 완료하고 싶은 거야.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "죽일 생각이 아니라고.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "일단 총 좀 내리고 생각하는 게 어떄?", image: nil, type: .onlyText, who: .ballam, characterFace: false)
    ], choices: [
        Choice(text: "그 과제가 사람을 죽이는 거 아닌가?", likability: [], nextTextIndex: 24),
        Choice(text: "그 말을 어떻게 믿으라는 거지?", likability: [], nextTextIndex: 25)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "과분한 칭찬이야. 고마워~", image: nil, type: .onlyText, who: .ballam, characterFace: true),
        Chat(text: "그나저나 둘 다 너무 긴장한 거 아니야?", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "난 과제를 완료하고 싶은 거야.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "죽일 생각이 아니라고.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "일단 총 좀 내리고 생각하는 게 어떄?", image: nil, type: .onlyText, who: .ballam, characterFace: false)
    ], choices: [
        Choice(text: "그 과제가 사람을 죽이는 거 아닌가?", likability: [], nextTextIndex: 24),
        Choice(text: "그 말을 어떻게 믿으라는 거지?", likability: [], nextTextIndex: 25)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "이야, 예리하네.", image: nil, type: .onlyText, who: .ballam, characterFace: true),
        Chat(text: "키렐이라고 했나? 너 마음에 든다.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "여하튼, 거기 아저씨는 아르고라고 했지?", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "총 든 사람끼리 얘기해보자고.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "지금 당장 싸우고 싶어?", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: ".......", image: nil, type: .onlyText, who: .kirell, characterFace: true),
        Chat(text: "원한다면.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "대화 참 짧네. 뭔 얘기를 못 하겠어.", image: nil, type: .onlyText, who: .ballam, characterFace: true)
    ], choices: [
        Choice(text: "한 판 붙어볼까?", likability: [], nextTextIndex: 26),
        Choice(text: "조용히 물러날 수 없냐?", likability: [], nextTextIndex: 27)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "이런 이런, 내 첫인상이 너무 인상적이었나 보네.", image: nil, type: .onlyText, who: .ballam, characterFace: true),
        Chat(text: "그럼 그냥 믿지 마.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "여하튼, 거기 아저씨는 아르고라고 했지?", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "총 든 사람끼리 얘기해보자고.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "지금 당장 싸우고 싶어?", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: ".......", image: nil, type: .onlyText, who: .kirell, characterFace: true),
        Chat(text: "원한다면.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "대화 참 짧네. 뭔 얘기를 못 하겠어.", image: nil, type: .onlyText, who: .ballam, characterFace: true)
    ], choices: [
        Choice(text: "한 판 붙어볼까?", likability: [], nextTextIndex: 26),
        Choice(text: "조용히 물러날 수 없냐?", likability: [], nextTextIndex: 27)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "좋은 자세야. 하지만 나도 바보는 아니야.", image: nil, type: .onlyText, who: .ballam, characterFace: true),
        Chat(text: "너희 둘 다 시체와 총 앞에서도 태연한 인간들이라고.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "이대로 싸우면 서로 무사하지 못할 게 뻔하지.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "싸움은 관두자고.", image: nil, type: .onlyText, who: .ballam, characterFace: false)
    ], choices: [
        Choice(text: "현명한 판단이군.", likability: [], nextTextIndex: 28),
        Choice(text: "그럼, 빨리 가버려.", likability: [], nextTextIndex: 28)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "아쉽게도 그래야겠네.", image: nil, type: .onlyText, who: .ballam, characterFace: true),
        Chat(text: "너희 둘 다 시체와 총 앞에서도 태연한 인간들이라고.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "이대로 싸우면 서로 무사하지 못할 게 뻔하지.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "싸움은 관두자고.", image: nil, type: .onlyText, who: .ballam, characterFace: false)
    ], choices: [
        Choice(text: "현명한 판단이군.", likability: [], nextTextIndex: 28),
        Choice(text: "그럼, 빨리 가버려.", likability: [], nextTextIndex: 28)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "그나저나 앞으로 기대되는 상대들이네.", image: nil, type: .onlyText, who: .ballam, characterFace: true),
        Chat(text: "다음에 또 보자고.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "아마, 반드시 다시 보게 되겠네.", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "그때까지 안녕~~", image: nil, type: .onlyText, who: .ballam, characterFace: false),
        Chat(text: "발람이 떠났다.", image: nil, type: .sectionHeader, who: .unknown, characterFace: false),
        Chat(text: "진짜로 갔군요.", image: nil, type: .onlyText, who: .argo, characterFace: true)
    ], choices: [
        Choice(text: "다른 이유가 있어서 잠시 물러난 게 아닐까요?", likability: [], nextTextIndex: 29),
        Choice(text: "진짜로 우리가 위험하다고 생각한 걸까요?", likability: [], nextTextIndex: 29)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "어쩌면 저처럼 특별한 사정이 있는 총을 가져서 그럴 수도 있죠.", image: nil, type: .onlyText, who: .argo, characterFace: true)
    ], choices: [
        Choice(text: "아르고 당신처럼?", likability: [], nextTextIndex: 30),
        Choice(text: "특별한 사정이라고요?", likability: [], nextTextIndex: 31)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "음, 제 실언을 날카롭게 잘 찌르는군요.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "정곡을 찔렸다면서 오히려 웃잖아?", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "특이한 성격이네.", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "특별한 조건이 맞아야 작동되는 총일 겁니다.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "아마도 그의 과제와 연관이 있는 거겠죠.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "그렇군. 사자의 나침반과 마찬가지로….", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: nil, image: "", type: .animationPopup, who: .kirell, characterFace: false),
        Chat(text: "엇!? 지금 나침반이 작동했어!", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "설마 이제야 나침반 바늘이 멈춘 겁니까?", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "…….", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "이런, 뭔가 눈치챈 기색이네.", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "잘됐습니다. 이제 목적지로 갈 수 있겠군요.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "…….", image: nil, type: .onlyText, who: .kirell, characterFace: true)
    ], choices: [
        Choice(text: "당신도 갈 건가요?", likability: [], nextTextIndex: 32),
        Choice(text: "발람을 막으려면 당신의 도움이 필요하겠네요.", likability: [], nextTextIndex: 33)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "특별한 조건이 맞아야 작동되는 총일 겁니다.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "아마도 그의 과제와 연관이 있는 거겠죠.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "그렇군. 사자의 나침반과 마찬가지로….", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: nil, image: "", type: .animationPopup, who: .kirell, characterFace: false),
        Chat(text: "엇!? 지금 나침반이 작동했어!", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "설마 이제야 나침반 바늘이 멈춘 겁니까?", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "…….", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "이런, 뭔가 눈치챈 기색이네.", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "잘됐습니다. 이제 목적지로 갈 수 있겠군요.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "…….", image: nil, type: .onlyText, who: .kirell, characterFace: true)
    ], choices: [
        Choice(text: "당신도 갈 건가요?", likability: [], nextTextIndex: 32),
        Choice(text: "발람을 막으려면 당신의 도움이 필요하겠네요.", likability: [], nextTextIndex: 33)
        ], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "네, 당연히 함께하겠습니다.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "아무래도 당신의 도움이 필요할 거 같습니다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "………….", image: nil, type: .onlyText, who: .kirell, characterFace: true),
        Chat(text: "왜 날 필요로 할까?", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "발람은 자신의 총을 보여주면서", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "사람을 죽이는 과제를 받았다고 얘기했어.", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "어쩌면 아르고도….", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "가시죠, 키렐.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "그래도 지금은 함께 하는 수밖에 없어.", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "Day 1 End", image: nil, type: .sectionHeader, who: .unknown, characterFace: false)
    ], choices: [], achievement: nil),
    
    BlockOfDayEpisode(chats: [
        Chat(text: "기꺼이 도와드리죠.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "저 또한 당신을 필요로 합니다.", image: nil, type: .onlyText, who: .argo, characterFace: false),
        Chat(text: "………….", image: nil, type: .onlyText, who: .kirell, characterFace: true),
        Chat(text: "왜 날 필요로 할까?", image: nil, type: .textPopup, who: .kirell, characterFace: false),
        Chat(text: "발람은 자신의 총을 보여주면서", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "사람을 죽이는 과제를 받았다고 얘기했어.", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "어쩌면 아르고도….", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "가시죠, 키렐.", image: nil, type: .onlyText, who: .argo, characterFace: true),
        Chat(text: "그래도 지금은 함께 하는 수밖에 없어.", image: nil, type: .textPopup, who: .kirell, characterFace: true),
        Chat(text: "Day 1 End", image: nil, type: .sectionHeader, who: .unknown, characterFace: false)
    ], choices: [], achievement: nil)
   
    
   
])



