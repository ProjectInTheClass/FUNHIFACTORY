//
//  StoryInstance.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//
import Foundation
import UIKit




//selectStageVC 테이블뷰 테스트 하드코딩용 데이터. 나중에 삭제 혹은 위치 변경 예정


var prologueChapter: Episode = Episode(episodeID: "prologue", episodePlace: "현재", episodeYear: 2039, episodeKingYear: "현재 2039년", episodeShortDesciption: "지루하고 따분한, 그저 우울하기만 한\n이런 삶은 이제 그만하고 싶다.\n누군가 나에게 내 하루를 바꿀 수 있는, 내 인생을 바꿀 수 있는\n구원의 손길을 내밀어 준다면,\n나는 그 손을....잡을 수 있을까?", episodeDesciption: "지루하고 따분한, 그저 우울하기만 한\n이런 삶은 이제 그만하고 싶다.\n\n누군가 나에게 내 하루를 바꿀 수 있는,\n내 인생을 바꿀 수 있는\n구원의 손길을 내밀어 준다면,\n나는 그 손을.... 잡을 수 있을까?", episodePlaceImage: "donhwamun illust", episodeCoverImage: "donhwamun background image", chatHistory: [], storyBlocks: [:], currentCharacterNote:
                                        
    [GameCharacter(name: "이단희", profileImage: "prolog danhee", backGroundImage: "prolog danhee_background", description: "내 곁에 아무도 없다는 게 이젠 익숙해.\n이런 내 삶이 바뀔 수 있을까?", infomation: [],isLocked: false),
     
     GameCharacter(name: "휘령", profileImage: "hwiryeong", backGroundImage: "prolog hwiryeong_background", description: "네가 나의 마지막 희망이다.\n네가 가진 그 1초가 나를,\n이 세상을 바꾸는 법.\n부디 이번엔 꼭 성공하길...", infomation: [
                    Infomation(infomationID: .hwiryeong1, isLocked: false, text: "조선이 생겨났을 때부터 존재했다고 한다. "),
                    Infomation(infomationID: .hwiryeong2, isLocked: false, text: "휘령이 곧 조선. 하지만 큰 사건들을 겪고 나서 그는 힘을 잃게 되었다. 그 힘을 찾기 위해서는 내가 필요하다고 하는데... "),
                    Infomation(infomationID: .hwiryeong3, isLocked: false, text: "그 대가로 내 소원을 들어주겠다고 하니.. 어떻게 해야 할까?")
        
                   ],isLocked: false),
     
     GameCharacter(name: "투어 가이드", profileImage: "guide", backGroundImage: "", description: "오늘 하루동안 저와 창덕궁 투어를\n함께하게 되어 반가워요!", infomation: [
                    Infomation(infomationID: .teacher1, isLocked: false, text: "우리 반이 현장체험학습으로 간 창덕궁에서 가이드를 맡은 사람이다."),
                    Infomation(infomationID: .teacher1, isLocked: false, text: "창덕궁에 대해 꽤나 애정이 있는 것처럼 보인다.")
     ],isLocked: false),
     
     GameCharacter(name: "선생님", profileImage: "teacher", backGroundImage: "", description: "거기 너! 마음대로 돌아다니지 말랬지!!", infomation: [
                    Infomation(infomationID: .teacher1, isLocked: false, text: "우리 반 담임 선생님이다."),
                    Infomation(infomationID: .teacher1, isLocked: false, text: "내가 도망친 걸 들키면 엄청 화낼 텐데..")
     ],isLocked: false)],
                                       
    currentCaseNote: [],
    currentAlbumImages: [AlbumImage(id: .donhwamun_with_danhee, image: "donhwamun_with_danhee", title: "돈화문 앞 혼자인 나", description: "언제나 그랬듯이\n나는 친구도 없이 혼자 서 있다.\n\n이렇게 반복되는 외로움에\n이제는 무뎌질 만도 한데,\n아직도 처음 마주한 것처럼 아프다.\n이곳에서 벗어나고 싶어.", isLocked: false),
                     AlbumImage(id: .drawing_geumcheongyo, image: "drawing_geumcheongyo", title: "금천교 앞에서", description: "생각보다 나무와 꽃이 많네.\n\n이 장면을 안 담아두면 나중에 후회할 것 같아.", isLocked: false),
                     AlbumImage(id: .drawing_injeongjeon, image: "drawing_injeongjeon", title: "내 상상 속 인정전", description: "옛날에는 어떤 모습으로 있었을까?\n궁금하다.\n\n내 상상으로 그려볼래.", isLocked: false),
                     AlbumImage(id: .necklace_in_hand, image: "necklace_in_hand", title: "휘령의 목걸이", description: "휘령의 힘을 담는 목걸이...\n\n내가 잘 해낼 수 있을까?", isLocked: false),
                     AlbumImage(id: .prolog_danhee, image: "prolog_danhee", title: "나와 루스", description: "내가 세상에서 제일 사랑하는 나의 유일한 가족", isLocked: false),
                     AlbumImage(id: .prolog_hwiryeong, image: "prolog_hwiryeong", title: "휘령", description: "너를 줄곧 기다리고 있었어!\n네가 내 유일한 희망이야.\n부디 나를 도와줘.", isLocked: false)],
    timelineCheckPoint: [
        
        [CheckPoint(id: .checkPoint_0_0_1, name: "처음부터", storyBlockIndex: "001", isLocked: false),
         CheckPoint(id: .checkPoint_0_0_2, name: "휘령과의 만남", storyBlockIndex: "016", isLocked: false),
         CheckPoint(id: .checkPoint_0_0_3, name: "소원", storyBlockIndex: "042", isLocked: false)]
        
        ], currentStoryBlockIndex: "087")

//selectStageVC 테이블뷰 테스트 하드코딩용 데이터. 나중에 삭제 혹은 위치 변경 예정

var chapter1 = Episode(episodeID: "1592", episodePlace: "선정전", episodeYear: 1592, episodeKingYear: "선조 25년", episodeShortDesciption: "우리나라의 뼈아픈 역사 중 하나다. ",episodeDesciption: "임진왜란 때 대부분의 궁궐이 화재로 인해 소실되었다.", episodePlaceImage: "seonjeongjeon illust", episodeCoverImage: "changdeokgung image sample", chatHistory: [], storyBlocks: [:],
currentCharacterNote: [],
currentCaseNote: [], currentAlbumImages: [], timelineCheckPoint: [], currentStoryBlockIndex: "002")


var chapter2 = Episode(episodeID: "1623", episodePlace: "돈화문", episodeYear: 1623, episodeKingYear: "광해 15년", episodeShortDesciption: "반란으로 왕이 바뀐 사건이다.\n인조가 광해를 끌어내리고 왕 위에\n오르던 과정에서 인정전을 제외한\n모든 건물이 불에 타 버렸다.\n반란이 성공하지 못하도록 하는 것이\n이 사건의 실마리가 될 것이다.", episodeDesciption: "나는 현실로 돌아가야만 하는 사람이다.\n그런데 왜 자꾸 다른 마음을 품게 되는 거냐고!\n역사가 똑같이 흘러가게 내버려 두어서는 안 돼.\n정신 차리자 단희야!!\n내가 할 선택은.....", episodePlaceImage: "donhwamun illust", episodeCoverImage: "donhwamun background image", chatHistory: [],storyBlocks: [:], currentCharacterNote: [
    
    GameCharacter(name: "이단희", profileImage: "danhee2", backGroundImage: "case 2 danhee_background", description: "내가 부잣집 양반의 개인 사병이라고?\n내가 모시는 양반이 반역의 주요 인물이라니...\n들키지 않고 방해할 수 있을까?", infomation: [], isLocked: false),
    
    GameCharacter(name: "이귀", profileImage: "igwi", backGroundImage: "", description: "내가 전하를 직접 만나 설득해봐야겠어.", infomation: [
        Infomation(infomationID: .leegyi1, isLocked: false, text: "1616년에 역모 사건에 관련되어 이천에 유배되었다가 1619년 유배에서 풀려났다."),
        Infomation(infomationID: .leegyi2, isLocked: false, text: "이런 상황에서 반역이 먼저 계획되고 있었고, 이후 이 계획에 참여하게 되었다.")
    ],isLocked: false),
    
    GameCharacter(name: "김자점", profileImage: "kimman", backGroundImage: "", description: "반역이 절대 들켜서는 안 돼.\n전하의 눈과 귀를 막아야겠어.", infomation: [
        Infomation(infomationID: .kimjajeom1, isLocked: false, text: "개인 사병을 지니고 있고, 그 중 한 명이 주인공이다."),
        Infomation(infomationID: .kimjajeom2, isLocked: false, text: "이귀와 함께 역모 사건에 연루되어 곤경에 처했었다."),
        Infomation(infomationID: .kimjajeom3, isLocked: false, text: "김상궁에게 뇌물을 주며 반역의 소문을 잠재우려 했다.")
    ],isLocked: false),
    
    GameCharacter(name: "김상궁", profileImage: "kimwoman", backGroundImage: "", description: "돈이 최고지~\n왕은 나를 제일 사랑하신다고.\n내가 없으면 이 나라는 돌아가지 않아.", infomation: [
        Infomation(infomationID: .kimsanggung1, isLocked: false, text: "조선 중기 광해군 시절의 상궁이다."),
        Infomation(infomationID: .kimsanggung2, isLocked: false, text: "광해군의 아내인 중전 유씨의 신임을 얻어 왕의 곁에서 모실 수 있는 기회를 얻었다."),
        Infomation(infomationID: .kimsanggung3, isLocked: false, text: "뛰어난 미모를 가지고 있지는 않았다."),
        Infomation(infomationID: .kimsanggung4, isLocked: false, text: "그녀의 총명함에 사로잡혀 광해군이 그녀를 매우 아꼈다."),
        Infomation(infomationID: .kimsanggung5, isLocked: false, text: "후궁이 되는 것을 거부하여 계속 상궁의 신분을 유지하였다. 그 덕에 자유롭게 궐 밖으로 돌아다닐 수 있어 다양한 정보를 확보할 수 있었다."),
        Infomation(infomationID: .kimsanggung6, isLocked: false, text: "광해군이 그녀를 아끼고 신뢰를 하면서 후궁보다 권세가 더 높았다."),],isLocked: false),
    
    GameCharacter(name: "가난한 평민", profileImage: "poorman", backGroundImage: "", description: "거기 누구요?!\n이곳엔 더 이상 가져갈 것도 없으니\n썩 물러가시오!", infomation: [
        Infomation(infomationID: .kimjajeom2, isLocked: false, text: "마을 끝자락에 위치한 가난한 사람들끼리 뭉쳐있는 곳에 살고 있는 사람이다."),
        Infomation(infomationID: .kimjajeom2, isLocked: false, text: "생각보다 경계심이 있네.")],isLocked: false),
        
    GameCharacter(name: "능양군", profileImage: "injo", backGroundImage: "", description: "내가.. 내가 곧 이 나라의 왕이 될 것이다!", infomation: [
        Infomation(infomationID: .kimjajeom1, isLocked: false, text: "그의 본명은 이종이다."),
        Infomation(infomationID: .kimjajeom1, isLocked: false, text: "집안의 풍비박산으로 복수심을 다졌다."),
        Infomation(infomationID: .kimjajeom2, isLocked: false, text: "인조반정을 일으켜 훗날 조선시대 제16대 왕 인조가 된다.")
    ],isLocked: false)
    
   

], currentCaseNote: [
    NoteCase(id: .gwanghae, title: "광해군", shortDescription: "1623년 4월 11일에 일어난 사건이다.", longDescription: "조선의 제15대 왕이다.\n\n광해군이 서자이며 둘째 아들이라는 이유로 영창대군을 후사로 삼을 것을 주장하는 소북파과 광해군을 지지하는 대북파 사이에 분쟁이 확대되었다.", isLocked: false),
    
    NoteCase(id: .king_gwanghae, title: "‘왕’ 광해군", shortDescription: "1623년 4월 11일에 일어난 사건이다.", longDescription: "광해군은 임진왜란 때 의병을 이끌기도 하고, 적극적으로 임진왜란에 참여했다.\n\n그러던 와중 선조가 죽고, 광해군이 즉위했다.광해군이 왕위로 있던 15년간 대북파가 정권을 잡게 되었다.\n즉위 후 임진왜란 전후 복구에 힘을 쓰고, 후금과 명나라 사이에서 중립외교를 실시하는 외교 정책, 대동법 실시 등 다양한 정책을 실시했다고 한다.", isLocked: false),
    
    NoteCase(id: .gwanghae, title: "'폭군’ 광해군", shortDescription: "1623년 4월 11일에 일어난 사건이다.", longDescription: "광해군은 그의 형인 임해군과 이복 동생인 영창대군을 죽이고, 영창대군의 어머니인 인목왕후를 폐위시키는 등의 사건들로 인해 그의 반대 세력에 의해 폐위당했다고 한다.\n\n인조반정 당일 광해군은 후원에서 술을 마시고 있었다고 하니... 대범한 건지 매우 놀랍네.", isLocked: false),
    
    NoteCase(id: .injo_revolt_background, title: "인조반정의 배경", shortDescription: "1623년 4월 11일에 일어난 사건이다.", longDescription: "광해군은 즉위 이후 자신의 왕위를 위협할 수 있는 형 임해군과 유일한 적통인 영창대군을 경계하였다.\n\n형 임해군이 법을 어겼다는 죄목으로 귀양을 보냈고, 그곳에서 그는 살해당했다.\n광해군을 따르던 대북파가 영창대군과 그의 세력들을 제거하기 위해 계축옥사라는 사건을 일으켜 영창대군을 강화에 가두었다고 한다. 그리고 영창대군마저 살해당했다니..\n그러고는 영창대군의 어머니인 대비 김씨의 존호를 폐하기도 하며 명예를 실추시켰다.\n\n이런 광해군의 사건들이 그의 반대 세력들에게 반역의 구실을 주게 된 것이다.", isLocked: false),
    
    NoteCase(id: .injo_revolt_day, title: "인조반정 당일", shortDescription: "1623년 4월 11일에 일어난 사건이다.", longDescription: "1623년 4월 11일에 일어난 사건이다.\n\n조선의 3대 반정 중 하나로, 서인 세력이 광해군과 대북파를 몰아내고 능양군을 왕위에 앉혔다.\n\n인조반정 당일 창덕궁 후원에서 연회를 벌이던 광해군은 뒤늦게 도망쳤지만 곧 체포되었다.", isLocked: false),
    
    NoteCase(id: .injo_revolt_after, title: "인조반정 그 후", shortDescription: "1623년 4월 11일에 일어난 사건이다.", longDescription: "그 후 광해군은 왕위를 박탈당하고, 강화로 귀양보내졌다. 그를 따르던 세력들은 모두 죽거나 귀양보내졌다고 한다.\n\n반면에, 반정에 공을 세운 사람들은 벼슬을 얻었다고 한다.\n벼슬을 위해 반정을 일으킨 건가...", isLocked: false),],

currentAlbumImages: [
    
        AlbumImage(id: .conference_hall, image: "conference_hall", title: "반란의 회의장", description: "내 앞에 있는 사람들은\n회의를 하는 것처럼 보인다.\n\n그런데 그 내용이...\n반정을 일으킨다는 것이라니.\n\n내가 반역자의 한 명이 될 수도 있다는 건가?", isLocked: false),
        AlbumImage(id: .bribe, image: "bribe", title: "뇌물", description: "나도 모르게 뇌물을 전해버렸어...\n이걸 전해주면 이번 사건은\n틀림없이 실패할 텐데.", isLocked: false),
        AlbumImage(id: .huijeongdang_fire, image: "huijeongdang_fire", title: "불타는 희정당", description: "불길이 건물을 덮치고 그에도 부족했는지\n하늘까지 온통 검게 변했다.\n\n내가.... 내가 막았으면 됐는데...\n도대체 내가 무슨 짓을 한 거야?", isLocked: false),
        AlbumImage(id: .huwon_garden_fire, image: "huwon_garden_fire", title: "후원의 화재", description: "분명... 분명 좀 전까지만 해도\n황홀한 풍경이었는데....\n\n이 모습도 어떻게 보면\n황홀한 광경이라고 할 수 있을까..\n\n다시 시간을 돌려서 이 모습을 구하고 싶어.", isLocked: false),
        AlbumImage(id: .revolt_image, image: "revolt_image", title: "반란의 시작점", description: "내 옆에는 많은 군사들이 있고,\n나는 지금 돈화문 앞이다.\n\n“다들 정신 똑바로 차리거라!!\n이 문만 지나가면 우리의 세상이 오는 것이니!”\n\n무섭게도 소리 지르는 군사들을 보니\n등골이 서름해지면서 실감이 났다.\n\n아, 내가 인조반정 날에 왔구나.", isLocked: false)],

timelineCheckPoint: [
        [CheckPoint(id: .checkPoint_2_0_1, name: "처음부터", storyBlockIndex: "001", isLocked: false),
         CheckPoint(id: .checkPoint_2_0_2, name: "반란을 도모하는 회의장", storyBlockIndex: "046", isLocked: false),
         CheckPoint(id: .checkPoint_2_0_3, name: "김상궁과의 만남", storyBlockIndex: "104", isLocked: false)],
    
        [CheckPoint(id: .checkPoint_2_1_1, name: "첫 번째 거짓말", storyBlockIndex: "132", isLocked: false),
         CheckPoint(id: .checkPoint_2_1_2, name: "두 번째 거짓말", storyBlockIndex: "137", isLocked: false),
         CheckPoint(id: .checkPoint_2_1_3, name: "세 번째 거짓말", storyBlockIndex: "149", isLocked: false)],
    
        [CheckPoint(id: .checkPoint_2_2_1, name: "휘령의 호통", storyBlockIndex: "219", isLocked: false),
         CheckPoint(id: .checkPoint_2_2_2, name: "백문이 불여일견", storyBlockIndex: "239", isLocked: false),
         CheckPoint(id: .checkPoint_2_2_3, name: "또 한 번의 기회", storyBlockIndex: "254", isLocked: false)]
        ], currentStoryBlockIndex: "001")


var chapter3 = Episode(episodeID: "1803", episodePlace: "인정전", episodeYear: 1803, episodeKingYear: "순조 3년", episodeShortDesciption: "왕의 나이가 너무 어려 대비가 대신 정치를 했다. 그 과정에서 한쪽 세력에만 힘을 실게 되고, 종교의 자유를 억압하게 되었다. 복수심을 가지고 있는 자가 이번 사건의 범인일지도.", episodeDesciption: "대한독립 만세",episodePlaceImage: "injeongjeon illust", episodeCoverImage: "changdeokgung image sample",  chatHistory: [],storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [], timelineCheckPoint: [], currentStoryBlockIndex: "")

var chapter4 = Episode(episodeID: "1918", episodePlace: "대조전", episodeYear: 1918, episodeKingYear: "순종 11년", episodeShortDesciption: "", episodeDesciption: "7월 28일임",episodePlaceImage: "daejojeon illust", episodeCoverImage: "changdeokgung image sample", chatHistory: [], storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [], timelineCheckPoint: [], currentStoryBlockIndex: "")

var endingChapter = Episode(episodeID: "ending", episodePlace: "엔딩", episodeYear: 2020, episodeKingYear: "엔딩 에피소드입니다.\n\n(샘플 텍스트입니다)", episodeShortDesciption: "", episodeDesciption: "", episodePlaceImage: "", episodeCoverImage: "", chatHistory: [], storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [], timelineCheckPoint: [], currentStoryBlockIndex: "" )

let extraCharacters : [GameCharacter] = [
    GameCharacter(name: "모두", profileImage: "everyone", backGroundImage: "", description: "", infomation: [], isLocked: false),
    GameCharacter(name: "반란군 1", profileImage: "extra1", backGroundImage: "", description: "", infomation: [], isLocked: false),
    GameCharacter(name: "반란군 2", profileImage: "extra2", backGroundImage: "", description: "", infomation: [], isLocked: false),
    GameCharacter(name: "반란군 3", profileImage: "extra3", backGroundImage: "", description: "", infomation: [], isLocked: false),
    GameCharacter(name: "군사 대장", profileImage: "extra4", backGroundImage: "", description: "", infomation: [], isLocked: false)]
