//
//  StoryInstance.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//
import Foundation
import UIKit




//selectStageVC 테이블뷰 테스트 하드코딩용 데이터. 나중에 삭제 혹은 위치 변경 예정


var prologueChapter: Episode = Episode(episodeID: "prologue", episodePlace: "현재", episodeYear: 2020, episodeKingYear: "현재 2020년", episodeShortDesciption: "누군가 나에게 내 하루를 바꿀 수 있는, 내 인생을 바꿀 수 있는 구원의 손길을 내밀어 준다면, 나는 그 손을....잡을 수 있을까?", episodeDesciption: "지루하고 따분한, 그저 우울하기만 한 내 인생은 변하긴 할까?\n이런 삶은 이제 그만하고 싶다.\n누군가 나에게 내 하루를 바꿀 수 있는, 내 인생을 바꿀 수 있는 구원의 손길을 내밀어 준다면,\n 나는 그 손을....잡을 수 있을까?", episodePlaceImage: "changdeokgung lllu image", episodeCoverImage: "changdeokgung image sample", isCleared: true, chatHistory: [], storyBlocks: [:], currentCharacterNote:
    [GameCharacter(name: "이단희", profileImage: "danhee angry face 1", backGroundImage: "leedanheeBackground", description: "내 곁에 아무도 없다는 게 이젠 익숙해. 이런 내 삶이 바뀔 수 있을까?", infomation: [],isLocked: false),
     GameCharacter(name: "휘령", profileImage: "hwiryeong basic face", backGroundImage: "hwiryeong illu 1x", description: "네가 나의 마지막 희망이다. 네가 가진 그 1초가 나를, 이 세상을 바꾸는 법. 부디 이번엔 꼭 성공하길...", infomation: [Infomation(infomationID: .hwiryeong1, isLocked: false, text: "조선이 생겨났을 때부터 존재했다."), Infomation(infomationID: .hwiryeong2, isLocked: false, text: "휘령이 곧 조선. 하지만 큰 사건들을 겪고 나서 그는 힘을 잃게 되었다. 그 힘을 찾기 위해서 내가 필요하다고 한다."), Infomation(infomationID: .hwiryeong3, isLocked: true, text: "휘령은 남자이다."), Infomation(infomationID: .hwiryeong5, isLocked: true, text: "휘령은 휘령이다.")],isLocked: false),
     GameCharacter(name: "투어 가이드", profileImage: "tour guide", backGroundImage: "", description: "", infomation: [],isLocked: false),
     GameCharacter(name: "선생님", profileImage: "teacher", backGroundImage: "cat", description: "선생님은 선생님이다. 선생님은 선생님이다. 선생님은 선생님이다. 선생님은 선생님이다. ", infomation: [Infomation(infomationID: .teacher1, isLocked: false, text: "선생님은 선생님이다."), Infomation(infomationID: .teacher1, isLocked: false, text: "선생님은 선생님이다."), Infomation(infomationID: .teacher1, isLocked: false, text: "선생님은 선생님이다."), Infomation(infomationID: .teacher1, isLocked: false, text: "선생님은 선생님이다.")],isLocked: false)],
    currentCaseNote: [],
    currentAlbumImages: [AlbumImage(id: .donhwamun_with_danhee, image: "donhwamun_with_danhee", title: "돈화문", description: "", isLocked: true),
                     AlbumImage(id: .drawing_geumcheongyo, image: "drawing_geumcheongyo", title: "금천교", description: "", isLocked: false),
                     AlbumImage(id: .drawing_injeongjeon, image: "drawing_injeongjeon", title: "인정전", description: "", isLocked: true),
                     AlbumImage(id: .necklace_in_hand, image: "necklace_in_hand", title: "휘령의 목걸이", description: "", isLocked: true),
                     AlbumImage(id: .prolog_danhee, image: "prologue image 4", title: "휘령의 목걸이", description: "", isLocked: true),
                     AlbumImage(id: .prolog_hwiryeong, image: "prologue image 4", title: "휘령의 목걸이", description: "", isLocked: true)],
    timelineCheckPoint: [
        
        [CheckPoint(id: .id201, name: "처음부터", storyBlockIndex: "012", isLocked: false),
         CheckPoint(id: .id202, name: "반란의 회의장", storyBlockIndex: "020", isLocked: false),
         CheckPoint(id: .id203, name: "김상궁과의 만남", storyBlockIndex: "001", isLocked: false)],
        
        [CheckPoint(id: .id211, name: "거짓말", storyBlockIndex: "065", isLocked: false)],
    
        [CheckPoint(id: .id221, name: "휘령과의 대화", storyBlockIndex: "000", isLocked: true)]
        ], currentStoryBlockIndex: "014")

//selectStageVC 테이블뷰 테스트 하드코딩용 데이터. 나중에 삭제 혹은 위치 변경 예정

var chapter1 = Episode(episodeID: "1592", episodePlace: "인정전", episodeYear: 1592, episodeKingYear: "선조 25년", episodeShortDesciption: "우리나라의 뼈아픈 역사 중 하나다. ",episodeDesciption: "임진왜란 때 대부분의 궁궐이 화재로 인해 소실되었다.", episodePlaceImage: "Donhwamun image", episodeCoverImage: "changdeokgung image sample", isCleared: true, chatHistory: [], storyBlocks: [:],
currentCharacterNote: [
    GameCharacter(name: "단희",profileImage: "heeryeongBackgroundImage",backGroundImage: "",description: "인물 설명",infomation: [Infomation(infomationID: .hwiryeong1, isLocked: false, text: "휘령 정보 1"),Infomation(infomationID: .hwiryeong2, isLocked: true, text: "휘령 정보 2"),Infomation(infomationID: .hwiryeong3, isLocked: false, text: "휘령 정보 3"),Infomation(infomationID: .hwiryeong4, isLocked: true, text: "휘령 정보 4"),Infomation(infomationID: .hwiryeong5, isLocked: true, text: "휘령 정보 5 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화")], isLocked: false)],
currentCaseNote: [NoteCase(id: .case201, title: "[인조반정]", shortDescription: "1623년 4월 11일에 일어난 사건이다.", longDescription: "1623년 4월 11일에 일어난 사건이다. 조선의 3대 반정 중 하나로, 서인 세력이 광해군과 대북파를 몰아내고 인조인 능양군을 왕위에 앉혔다.", isLocked: false)], currentAlbumImages: [], timelineCheckPoint: [], currentStoryBlockIndex: "002")


var chapter2 = Episode(episodeID: "1623", episodePlace: "돈화문", episodeYear: 1623, episodeKingYear: "광해 15년", episodeShortDesciption: "반란으로 왕이 바뀐 사건이다. 인조가 광해를 끌어내리고 왕 위에 오르던 과정에서 인정전을 제외한 모든 건물이 불에 타 버렸다. 반란이 성공하지 못하도록 하는 것이 이 사건의 실마리가 될 것이다.", episodeDesciption: "나는 현실로 돌아가야만 하는 사람이다.\n그런데 왜 자꾸 다른 마음을 품게 되는 거냐고!\n역사가 똑같이 흘러가게 냅두어서는 안 돼.\n안 되는 걸 너무 잘 아는데...\n정신 차리자.\n내가 할 선택은.....", episodePlaceImage: "Seonjeongjeon image", episodeCoverImage: "changdeokgung image sample", isCleared: true, chatHistory: [],storyBlocks: [:], currentCharacterNote: [
    
    GameCharacter(name: "주인공", profileImage: "", backGroundImage: "", description: "내가 부잣집 양반의 개인 사병이라고? 내가 모시는 양반이 반역자의 주요 인물이라니...들키지 않고 방해할 수 있을까?", infomation: [],isLocked: false),
    GameCharacter(name: "이귀", profileImage: "", backGroundImage: "", description: "", infomation: [
        Infomation(infomationID: .leegyi1, isLocked: true, text: "1616년에 역모 사건에 관련되어 이천에 유배되었다가 1619년 유배에서 풀려났다."),
        Infomation(infomationID: .leegyi2, isLocked: false, text: "이런 상황에서 반역이 먼저 계획되고 있었고, 이후 이 계획에 참여하게 되었다.")
    ],isLocked: false),
    GameCharacter(name: "김자점", profileImage: "", backGroundImage: "", description: "", infomation: [
        Infomation(infomationID: .kimjajeom1, isLocked: false, text: "개인 사병을 지니고 있고, 그 중 한 명이 주인공이다."),
        Infomation(infomationID: .kimjajeom2, isLocked: false, text: "이귀와 함께 역모 사건에 연루되어 곤경에 처했었다."),
        Infomation(infomationID: .kimjajeom3, isLocked: false, text: "김상궁에게 뇌물을 주며 반역의 소문을 잠재우려 했다.")
    ],isLocked: false),
    GameCharacter(name: "김상궁", profileImage: "", backGroundImage: "", description: "", infomation: [
        Infomation(infomationID: .kimsanggung1, isLocked: false, text: "조선 중기 광해군 시절의 상궁이다."),
        Infomation(infomationID: .kimsanggung2, isLocked: false, text: "광해군의 아내인 중전 유씨의 신임을 얻어 왕의 곁에서 모실 수 있는 기회를 얻었다."),
        Infomation(infomationID: .kimsanggung3, isLocked: false, text: "뛰어난 미모를 가지고 있지는 않았다."),
        Infomation(infomationID: .kimsanggung4, isLocked: false, text: "그녀의 총명함에 사로잡혀 광해군이 그녀를 매우 아꼈다."),
        Infomation(infomationID: .kimsanggung5, isLocked: false, text: "후궁이 되는 것을 거부하여 계속 상궁의 신분을 유지하였다. 그 덕에 자유롭게 궐 밖으로 돌아다닐 수 있어 다양한 정보를 확보할 수 있었다."),
        Infomation(infomationID: .kimsanggung6, isLocked: false, text: "광해군이 그녀를 아끼고 신뢰를 하면서 후궁보다 권세가 더 높았다.")
    ],isLocked: false)
], currentCaseNote: [NoteCase(id: .case201, title: "[인조반정]", shortDescription: "1623년 4월 11일에 일어난 사건이다.", longDescription: "1623년 4월 11일에 일어난 사건이다. 조선의 3대 반정 중 하나로, 서인 세력이 광해군과 대북파를 몰아내고 인조인 능양군을 왕위에 앉혔다.", isLocked: false) ],
currentAlbumImages: [
        AlbumImage(id: .conference_hall, image: "", title: "반란의 회의장", description: "내 앞에 있는 사람들은 회의를 하는 것처럼 보인다. 그런데 그 내용이...반정을 일으킨다는 것이라니. 내가 반역자의 한 명이 될 수도 있다는 건가?", isLocked: false),
        AlbumImage(id: .bribe, image: "", title: "뇌물", description: "나도 모르게 뇌물을 전해버렸어...이걸 전해주면 이번 사건은 틀림없이 실패할 텐데.", isLocked: false),
        AlbumImage(id: .huijeongdang_fire, image: "", title: "불타는 희정당", description: "불길이 건물을 덮치고 그에도 부족했는지 하늘까지 온통 검게 변했다. 내가....내가 막았으면 됐는데... 도대체 내가 무슨 짓을 한 거야? 분명...분명 좀 전까지만 해도 황홀한 풍경이었는데... 이 모습도 어떻게 보면 황홀한 광경이라고 할 수 있을까..", isLocked: true),
        AlbumImage(id: .huijeongdang_fire, image: "", title: "후원의 화재", description: "", isLocked: true)],
timelineCheckPoint: [
        [CheckPoint(id: .id201, name: "처음부터", storyBlockIndex: "000", isLocked: false),
         CheckPoint(id: .id202, name: "반란의 회의장", storyBlockIndex: "000", isLocked: false),
         CheckPoint(id: .id203, name: "김상궁과의 만남", storyBlockIndex: "000", isLocked: false)],
        [CheckPoint(id: .id211, name: "거짓말", storyBlockIndex: "000", isLocked: true)],
        [CheckPoint(id: .id221, name: "휘령과의 대화", storyBlockIndex: "000", isLocked: true)]
        ], currentStoryBlockIndex: "000")


var chapter3 = Episode(episodeID: "1919", episodePlace: "선정전", episodeYear: 1803, episodeKingYear: "순조 3년", episodeShortDesciption: "왕의 나이가 너무 어려 대비가 대신 정치를 했다. 그 과정에서 한쪽 세력에만 힘을 실게 되고, 종교의 자유를 억압하게 되었다. 복수심을 가지고 있는 자가 이번 사건의 범인일지도.", episodeDesciption: "대한독립 만세",episodePlaceImage: "Daejojeon image", episodeCoverImage: "changdeokgung image sample", isCleared: false, chatHistory: [],storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [], timelineCheckPoint: [], currentStoryBlockIndex: "")

var chapter4 = Episode(episodeID: "2003", episodePlace: "대조전", episodeYear: 1918, episodeKingYear: "순종 11년", episodeShortDesciption: "", episodeDesciption: "7월 28일임",episodePlaceImage: "Injeongjeon image", episodeCoverImage: "changdeokgung image sample", isCleared: false, chatHistory: [], storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [], timelineCheckPoint: [], currentStoryBlockIndex: "")

var endingChapter = Episode(episodeID: "ending", episodePlace: "엔딩", episodeYear: 2020, episodeKingYear: "엔딩 에피소드입니다.\n\n(샘플 텍스트입니다)", episodeShortDesciption: "", episodeDesciption: "", episodePlaceImage: "", episodeCoverImage: "", isCleared: false, chatHistory: [], storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [], timelineCheckPoint: [], currentStoryBlockIndex: "" )
