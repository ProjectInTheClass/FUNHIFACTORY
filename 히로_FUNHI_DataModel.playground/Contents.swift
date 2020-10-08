import UIKit

var str = "Hello, playground"





//개별 페이지 안의 선택지.
struct Choice {
    let choiceText: String
    let nextPageIndex: Int
    // 퀘스트 식별자. 자세한 내용은 Quest struct에서
    let questIdentifier: String
    // 엔딩 스코어 : 이 점수의 높고 낮음에 따라서 결말이 바뀜. 화를 많이 냈을 때의 엔딩과,
    // 순종적인 태도를 가졌을 때의 엔딩이 있다면, 화를 내는 선택지에는 2를 주고 순종적인 선택지에는 0을 주는 등
    // 태도의 차이를 낸다.
    let endingScore: Int
    }

// 게임 개별 페이지. 책으로 치면 각 쪽.
struct Page {
    let index: Int
    let storyText: String
    let storyImage: String?
    let choice : Array = [Choice]()
   
    //에피소드 마지막 페이지 식별자. 666같은 인트보다는 불 값이 더 낫지 않을까? true면 마지막 쪽 맞음, false면 페이지 더 있음. 기본값은 false.
    var endEpisodePage: Bool = false

}

struct Chapter {
    var Episodes: [[Page]]
    var quests: [Quest]
}

//게임 캐릭터. 플레이 시작 시 생성, 죽으면 삭제
struct GameCharacter {
    // 금은 캐릭 엔딩 보면 리셋.
    //이전 에피소드 골드 + 현재 에피소드 골드. 캐릭 죽으면 현재 챕터 골드 리셋.
    var totalGold: Int
    //현재 챕터 골드 : 캐릭 죽을 시 현재 챕터에서 얻은 골드만 날리기 위해서 만듦.
    var currentChapterGold: Int
    var previousChapterGold : Int
    var GameFullStory:[[[Page]]] = [[[]]]
    var currentEpPageIndex: Int = 0
    var currentEpisodeIndex : Int = 0
    var currentChapterIndex : Int = 0
    
    func currentChapter() -> [[Page]] {
        return GameFullStory[currentChapterIndex]
    }
    func currentEpisode() -> [Page] {
        return currentChapter()[currentEpisodeIndex]
    }
    func currentPage() -> Page {
        return currentEpisode()[currentEpPageIndex]
    }
    //게임 쪽 번호, 현재 기획 내용에 없는데 혹시 몰라서 남겨둠
    var pageIndex = 1
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
    var fontSize: Int = 15
    var rowSpacing : Int = 24
}

struct Quest {
    //퀘스트 이름
    var questName: String

    //퀘스트 클리어 조건 : 위 퀘스트 식별자와 동일한 스트링 배열. 이 배열 안에 있는 것과 동일한 스트링의 식별자를 가지고 있는 choice를 발견해서 달성 여부를 결정.
    // 예상하는 로직 : 루프를 돌려서 이 어레이와 초이스의 퀘스트식별자 비교, 동일할 때마다 해당 조건을 이 어레이에서 삭제하고 "finish"를 1개 추가함.
    var questClearJoGeun: [String]
    
    // 모든 엘리먼트가 "finish"로 바뀌면, questClearOX를 true로 바꿈.
    mutating func changeQuestClearOX() {
        var finishCount: Int = 0
        for joGeon in questClearJoGeun {
            if joGeon == "finish" {
                finishCount += 1
            }
        }
        if finishCount == questClearJoGeun.count {
            questClearOX = true
        }
    }
    // 퀘스트 클리어 여부.
    var questClearOX: Bool = false {
        didSet {
            if self.questClearOX == true {
                santa.totalGold += reward
                santa.currentChapterGold += reward
            }
        }
    }
    //클리어 시 보상 금액(n냥)
    var reward: Int
}

func chaptherCleared(){
    santa.previousChapterGold += santa.currentChapterGold
    santa.currentChapterGold = 0
}
func normalRebirth(){
    santa.currentChapterGold = 0
    santa.totalGold = santa.previousChapterGold
}
func specialRebirth(){
    santa.totalGold -= 30
    santa.currentChapterGold -= 30
}

var santa = GameCharacter(sowalWarning: 0, totalGold: 0, currentChapterGold: 0, previousChapterGold: 0)
