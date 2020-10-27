//
//  DataModel.swift
//  FUNHIPROTOTYPE
//
//  Created by 최서연 on 2020/10/12.
//

import Foundation

//개별 페이지 안의 선택지.
// 퀘스트 식별자. 자세한 내용은 Quest struct에서
// 엔딩 스코어 : 이 점수의 높고 낮음에 따라서 결말이 바뀜. 화를 많이 냈을 때의 엔딩과,
// 순종적인 태도를 가졌을 때의 엔딩이 있다면, 화를 내는 선택지에는 2를 주고 순종적인 선택지에는 0을 주는 등
// 태도의 차이를 낸다.
struct Choice {
    let choiceText: String
    let nextPageIndex: Int
   
    let endingScore: Int
    }

// 게임 개별 페이지. 책으로 치면 각 쪽.
// 스트럭처 안에다가 주석 넣으면.. 프라퍼티 인식 안 될 수도 있음. 무슨 일이 있어도 앤간해서는 빼는 게 좋을 듯
struct Page {
    let storyText: String
    let storyImage: String?
    let choice :[Choice]
    let questIdentifier: String
    var endEpisodePage: Bool = false
    let annotation : [Note]
    var warningInt: Int = 0
}
struct Note{
    let word : String
    let explanation : String
}

struct Chapter {
    var episodes: [[Page]]
    var quests: [Quest]
    let chapterNumber: Int
    let chapterName: String
    let chapterIllust: String
    let chapterChoice: [Choice]
}

//게임 캐릭터. 플레이 시작 시 생성, 죽으면 삭제
struct GameCharacter {
    // 금은 캐릭 엔딩 보면 리셋.
    //이전 에피소드 골드 + 현재 에피소드 골드. 캐릭 죽으면 현재 챕터 골드 리셋.
    var totalGold: Int
    //현재 챕터 골드 : 캐릭 죽을 시 현재 챕터에서 얻은 골드만 날리기 위해서 만듦.
    var currentChapterGold: Int
    var previousChapterGold : Int
    var totalWarning: Int = 0
    var GameFullStory:[Chapter] = [prologue,chapter1]
    var currentEpPageIndex: Int = 0
    var currentEpisodeIndex : Int = 0
    var currentChapterIndex : Int = 0
    
    func currentChapter() -> Chapter {
        return santa.gameCharacter.GameFullStory[currentChapterIndex]
    }
    func currentEpisode() -> [Page] {
        return currentChapter().episodes[currentEpisodeIndex]
    }
    func currentPage() -> Page {
        return currentEpisode()[currentEpPageIndex]
    }
    //게임 쪽 번호, 현재 기획 내용에 없는데 혹시 몰라서 남겨둠
    var pageIndex = 0
    var totalEndingScore: Int
    
}
//유저
struct User {
    var gameCharacter: GameCharacter
    var setting : Setting
    
}

struct Setting{
    // 슬라이더 값은 0.0 ~ 1.0
    var bgmVolume : Double = 0.5
    var fontSize: Int = 16
    var rowSpacing : Double = 0
}

struct Quest {
    //퀘스트 이름
    var questName: String

    //퀘스트 클리어 조건 : 위 퀘스트 식별자와 동일한 스트링 배열. 이 배열 안에 있는 것과 동일한 스트링의 식별자를 가지고 있는 choice를 발견해서 달성 여부를 결정.
    // 예상하는 로직 : 루프를 돌려서 이 어레이와 초이스의 퀘스트식별자 비교, 동일할 때마다 해당 조건을 이 어레이에서 삭제하고 "finish"를 1개 추가함.
    var questClearJoGeun: [String]
    var questClear: Bool = false
    //클리어 시 보상 금액(n냥)
    var reward: Int
}

func chaptherCleared(){
    santa.gameCharacter.previousChapterGold += santa.gameCharacter.currentChapterGold
    santa.gameCharacter.currentChapterGold = 0
}
func normalRebirth(){
    santa.gameCharacter.currentChapterGold = 0
    santa.gameCharacter.totalGold = santa.gameCharacter.previousChapterGold
}
func specialRebirth(){
    santa.gameCharacter.totalGold -= 30
    santa.gameCharacter.currentChapterGold -= 30
}

var santa = User(gameCharacter: santaGameCharacter, setting: Setting())

var santaGameCharacter = GameCharacter(totalGold: 0, currentChapterGold: 0, previousChapterGold: 0, totalEndingScore: 0)

