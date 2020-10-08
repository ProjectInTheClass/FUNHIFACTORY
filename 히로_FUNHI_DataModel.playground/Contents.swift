import UIKit



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
    let storyText: String
    let storyImage: String?
    var choice : Array = [Choice]()
   
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

var santa = GameCharacter(totalGold: 0, currentChapterGold: 0, previousChapterGold: 0, totalEndingScore: 0)

let ep105 : [Page] = [
    Page(storyText: "\"전하, 세자 저하께서 문안 인사를 드리러 왔사옵니다. \n\"\"세자라니. 도대체 누가 세자란 말인가? 명나라의 황제의 승인을 받지 못한 자가 어찌 세자라고 불릴 수가 있는가? 어서 물러가라 하라.\" \n“저하, 전하께서…….”", storyImage: nil, choice: [Choice(choiceText: "문안 인사를 포기하고 그만 돌아간다.", nextPageIndex: 1, questIdentifier: "", endingScore: 0), Choice(choiceText: "끝까지 남아 기다린다.", nextPageIndex: 2, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    //5-1
    Page(storyText: "“됐네. 이만 물러가겠소.”\n\n나는 다시 동궁으로 걸어갔다.\n\n‘전쟁 통에는 저를 방패로 내세우시더니, 이제는 자신을 향한 창이라 생각하시어 저를 버리시는 겁니까? 제가 이 나라를 살리기 위해, 아버지는 도망을 가셨어도 저는 끝까지 한양에 남아 지켰습니다. 명나라가 저를 세자로 보지 않아도, 전쟁 중에 저를 세자로 책봉하셨어도, 어찌 됐든 저는 조선의 ‘세자’요, 아버지의 아들이지 않습니까?’", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 3, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    //5-2
    Page(storyText: "“아바마마께 전하거라. 받아주실 때까지 난 가지 않을 것이니.”\n\n전쟁 통에는 나를 방패로 내세우시더니, 이제는 아비를 향한 창이라 생각하시어 날 버리는 건가? 아버지께서 피란을 가실 때에도 난 끝까지 한양에 남아 나라를 지켰다. 감히 명이 나를 세자로 보지 않더라도, 전쟁 중에 어쩔 수 없이 나를 세자로 책봉하였어도, 어찌 됐든 난 조선의 ‘세자’이자 아버지의 아들이다. 아버지께서 이를 모르고 계신 건지, 모른 척하고 계신 건지 알 수가 없다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 3, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: "나는 크게 한숨을 들이쉬었다.\n\n‘그래. 어차피 이미 오래전에 겪어봤던 일인데 더 이상 상처받지 말자…….’\n\n……헉.\n\n나는 소스라치게 놀라 뒤로 자빠졌다.\n\n“저하, 괜찮으십니까? 이보게, 얼른 의원을 불러오너라. 저하, 제 목소리가 들리십…….”\n\n나는 계속해서 알 수 없는 일에 정신이 혼미해졌다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 4, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: "나는 크게 한숨을 들이쉬었다.\n\n‘그래. 어차피 이미 오래전에 겪어봤던 일인데 더 이상 상처받지 말자…….’\n\n……헉.\n\n나는 소스라치게 놀라 뒤로 자빠졌다.\n\n“저하, 괜찮으십니까? 이보게, 얼른 의원을 불러오너라. 저하, 제 목소리가 들리십…….”\n\n나는 계속해서 알 수 없는 일에 정신이 혼미해졌다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 5, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: "‘내가 방금 무어라 했던가? 이미 겪어봤던 일이라고? 아버지께 한 소리를 들어 내 잠시 미친 게 분명하구나. 아니지, 아니야. 아버지께서 날 내치시는 것이 한 두어 번이 아니니 무의식중에 나온 말일 게야…….’/n/n그렇게 깊은 혼란 속으로 빠져버렸고, 그대로 쓰러져 정신을 잃어버렸다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 0, questIdentifier: "", endingScore: 0)], endEpisodePage: true)
]

let ep106 : [Page] = [
    Page(storyText: "“저하, 전하께서 재혼을 하신다고 하온데…….”\n“그게 무슨 소리인가?”\n\n갑자기 이게 무슨 말이지? 난 분명 동궁으로 가던 길에 쓰러졌을 텐데. 내가 어찌 이미 들어와 있는 것인지 도통 영문을 알 수 없었다. 내가 생각하지도 않은 말이 저절로 나와버리니 요즘 내가 많이 이상해진 건가 싶었다.\n\n“신하들이 저하의 책봉을 주청(奏請)* 할 것을 청하자 재혼을 하시겠다고 밝혔사옵니다.”\n\n나는 내 당혹스러움을 감출 수가 없었다.\n\n‘아버지께 문안 인사를 올린 날로부터 몇 날 며칠이 흐른 것인지 종잡을 수가 없구나. 내가 정말 미친 것인지에 대해 생각하는 것에도 갈피를 잡지를 못하겠는데, 아버지의 재혼 소식이라니.’", storyImage: nil, choice: [Choice(choiceText: "표정을 숨길 여유조차 없다.", nextPageIndex: 1, questIdentifier: "", endingScore: 0), Choice(choiceText: "덤덤하게 행동한다.", nextPageIndex: 2, questIdentifier: "", endingScore: 0), Choice(choiceText: "화를 낸다.", nextPageIndex: 3, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: "나는 생각이 많은 까닭에 굳은 표정을 숨길 여유조차 없었다.", storyImage: nil, choice: [], endEpisodePage: true),
    Page(storyText: " 생각이 많아졌다. 엎친 데 덮친 격으로 아버지의 재혼 소식은 마치 내게 청천벽력 같은 소리였다. 잘못하다간 겨우 얻은 내 세자 자리가 까딱하면 사라지게 되는 것이다. 아버지는 결코 내게 온전한 세자 자리를 주고 싶지 않아 하시는 걸까. 나는 애써 놀란 표정을 감추고 덤덤하게 굴었다. 나를 무시하셔도, 난 여전히 그 자리에 있다는 것을 보여주기 위해서.", storyImage: nil, choice: [], endEpisodePage: true),
    Page(storyText: "나는 화를 참을 수가 없었다.\n\n“무어라? 정녕 나를 세자로 온전히 인정하시지 않겠다는 말이 아닌가? 드디어 아버지께 인정을 받은 줄만 알았는데, 그것도 아니란 말인 건가. 난 도대체 아버지께 아들이 맞긴 한가? 너, 내가 세자로 보이긴 하느냐? 어? 얼른 바른대로 말하거라!”\n\n나는 눈 앞에 보이는 꽃병을 집어던졌다. 쨍그랑 소리와 함께 모두들 놀란 눈치였다. 나는 신하들이 눈치를 보든 말든 상관없었다. 그냥 그 상황 자체가 나에겐 지옥같았다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 4, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: " “당연히 세자 저하 아니십니까? 전하께서도 그리 생각 하실 겁니다.”\n\n“지금 이 상황을 보고도 그리 말할 수가 있느냐? 너도 내가 만만한 거구나.”\n“예? 전혀 아닙니다.”\n\n내 안의 끓어오르는 분노가 느껴졌다. 심장으로부터 열이 나는 것이 생생하게 오감으로 느껴질 지경이었다. 내 몸은 화로 가득해 새빨갛게 변했다.\n\n“됐다. 더 이상 네놈들의 말을 듣고 싶지 않구나. 썩 꺼져라. 어서!”\n\n평소 같았으면 참을 수 있었는데 왜 오늘은 화를 억누를 수 없단 말인가. 나는 내 자신이 혼란스러웠다.", storyImage: nil, choice: [], endEpisodePage: true)
]

let ep107 : [Page] = [
    Page(storyText: "나는 불안한 생각을 멈출 수가 없었다.\n\n‘나는 어찌해야 할까. 밖으로는 명나라가 나를 세자로 임명할 수 없다고 하고, 안으로는 아버지가 나를 미워하시니……. 만일 새어머니께서 대군을 낳기라도 하시면 내 자리는 위험해지겠지.’", storyImage: nil, choice: [], endEpisodePage: true)
]
let ep108 : [Page] = [
    Page(storyText: " 내가 우려했던 일이 일어나고야 말았다. 소성대비가 대군을 낳은 것이다.\n\n‘영의정까지 대군의 편에 서 버렸단 말인가?’\n\n이곳에 자신의 편 하나 없다는 사실이 나를 더욱 조마조마하고 위태롭게 만들었다.", storyImage: nil, choice: [], endEpisodePage: true)
]
let ep109 : [Page] = [
    Page(storyText: " 머리를 식힐 겸 궁 내를 거닐고 있는데 한 시녀가 울고 있었다.\n\n“무슨 일이냐?”\n\n 시녀는 나를 쳐다보더니 놀라서 재빠르게 허리를 수그렸고, 떨리는 목소리로 말했다.\n\n“저…저하……. 아무 일도 아니 옵니다.”\n“아무 일도 아니라기엔 자네가 울고 있지 않는가?”\n“실은… 동궁 소속의 시녀라는 이유만으로 차별을 당하고 있사옵니다.”\n“그게 무슨 말이냐?”\n“동궁 소속의 시녀들은 모두 무시를 당하고 있사옵니다. 같은 시녀라고 할지라도 맞먹을 수 없다고 하온데….”\n“무시하는 자들은 누구이더냐?”\n“대부분의 궁 안의 자들이며, 심지어는 중궁전의 시녀들까지 기세등등하여 무시를 하고 있사옵니다.”", storyImage: nil, choice: [Choice(choiceText: "참는다", nextPageIndex: 1, questIdentifier: "", endingScore: 0), Choice(choiceText: "무시한 자들을 찾아가려고 한다", nextPageIndex: 2, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: "나는 크게 한숨을 쉬었다.\n\n“그래, 알았다. 어서 가 보거라.”\n“예.”\n\n 이제는 궁 안의 시녀들까지 나를 기어코 무시를 하는구나. 동궁 소속의 궁인들을 무시한다는 것은 곧 나를 무시하는 것과 다를 바가 없지 않은가?", storyImage: nil, choice: [], endEpisodePage: true),
    Page(storyText: " “그래 알았다. 어서 가 보거라.”\n“예.”\n\n나는 내 뒤에 있던 신하에게 말했다.\n\n“누구인지 알아야겠다.”\n“알아서 무슨 일을 하시렵니까?”\n“당연히 벌을 내려야 하지 않겠는가? 아직 하늘은 푸르고 내가 이리 살아 있는데, 어찌 날 욕보인 자들을 살려 둘 수 있겠는가?”\n“아직은 자중하시지요, 저하. 전하께서도 그리 이야기를 하신지 얼마나 지나셨다고 그리하십니까? 저하께서 그런 나인들의 말 하나하나에 신경을 쓰시면, 그거야말로 저하께서 찔려서 벌을 내렸다는 더 큰 소문이 돌 것입니다. 아직은 성품을 온화하게 가지는 게 좋을 것 같습니다.”\n“네 말을 듣고 보니 그 말도 일리가 있구나. 내가 여기서 참는 것이 더 좋은 결과를 가지고 오면 좋겠는데.”", storyImage: nil, choice: [], endEpisodePage: true)
]
let ep110 : [Page] = [
    Page(storyText: " 아버지께 문안 인사를 드리러 동궁 밖으로 나오는데 내인 하나가 급히 말을 전했다.\n\n“지금 전하의 병환이 위급하십니다.”\n\n 나는 말을 듣자마자 수레에서 내려 급히 달려갔다. 약방 내의원들이 입시하고 말을 전하는 내관과 약을 가진 의관들이 침실 밖 대청에 많이 들어와 있었다.\n 정신을 차리지 못하는 아버지를 보니 가슴이 철렁하고 심장이 마구 뛰었다. 이때의 마음은 도대체 무엇이었을지 아직도 깨닫지 못했다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 1, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: "아버지께서 일어나질 못하시고 의식이 들지 않으시니, 청심원, 소합원, 강즙 등 약을 번갈아 올렸다. 잠시 뒤, 아버지의 기력이 조금 안정이 되었다. 아버지는 의식을 차리시자마자\n\n“이게 어찌 된 일인가, 어찌 된 일이야.”\n\n 라고 소리치셨다. 나는 손을 저어 좌우를 나가게 하였다. 이에 약방 도제조 이하가 합문 안으로 물러나 대령했다.", storyImage: nil, choice: [], endEpisodePage: true)
]
let ep111 : [Page] = [
    Page(storyText: " 의관들이 아버지의 증세는 한기가 밖에서 엄습하여 그렇게 된 것이라고 하였다. 오늘은 날씨가 몹시 추우니 한기가 없는 곳에서 정사를 보시면서 몸을 보살피며 치료받는 것이 좋겠다고 하였다.", storyImage: nil, choice: [], endEpisodePage: true)
]
let ep112 : [Page] = [
    Page(storyText: "나는 아버지 곁에서 병시중을 하였다.", storyImage: nil, choice: [Choice(choiceText: "아버지께 죄송한 마음이 든다.", nextPageIndex: 1, questIdentifier: "", endingScore: 0), Choice(choiceText: "아버지께 죄책감이 들지 않는다.", nextPageIndex: 2, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: " ‘영창대군은 열 살 남짓하고, 지금 아버지께서 돌아가시면 내가 왕이 되는 것이 아닌가?’\n\n 이런 생각을 하게 만든 아버지가 원망스럽기도, 이런 생각을 하고 있는 것이 죄송스럽기도 하였다. 나는 감히 아버지를 죽일 용기가 없었고, 불효자가 되기도 싫었다. 이런 내 마음이 원망에서 그치길 바랐다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 3, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: " ‘지금 영창대군은 열 살 남짓한데, 지금 아버지께서 돌아가시면 내가 왕이 되는 것 아닌가?’\n\n 참 시기 적절하다. 내 불안한 세자 자리가, 아버지의 위태로움에 더 단단해지는 듯했다. 우스웠다. 한 나라의 왕도 병 앞에서는 어쩔 줄 모르는구나.\n\n 난 세자가 되고 싶다. 그 누구도 의심하지 않는 세자가 되고 싶다. 그럼 비로소 내가 왕이 될 것이니.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 3, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: " 아버지께서는 내가 죽기 만을 바라시는 걸까?", storyImage: nil, choice: [], endEpisodePage: true)
]
let ep113 : [Page] = [
    Page(storyText: " 하나 유영경은 이 명령은 여러 사람의 뜻밖에 나온 것이므로 신은 결코 받들 수 없다고 또다시 반대를 하였다.\n\n 궁 내에 이런 떠들썩한 소식이 내게 들리지 않을 리가 있겠는가. 이 소식을 들은 나는…", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 1, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: " 머리를 식힐 겸 궁 내를 거닐고 있는데 한 시녀가 울고 있었다.\n\n“무슨 일이냐?”\n\n 시녀는 나를 쳐다보더니 놀라서 재빠르게 허리를 수그렸고, 떨리는 목소리로 말했다.\n\n“저…저하……. 아무 일도 아니 옵니다.”\n“아무 일도 아니라기엔 자네가 울고 있지 않는가?”\n“실은… 동궁 소속의 시녀라는 이유만으로 차별을 당하고 있사옵니다.”\n“그게 무슨 말이냐?”\n“동궁 소속의 시녀들은 모두 무시를 당하고 있사옵니다. 같은 시녀라고 할지라도 맞먹을 수 없다고 하온데….”\n“무시하는 자들은 누구이더냐?”\n“대부분의 궁 안의 자들이며, 심지어는 중궁전의 시녀들까지 기세등등하여 무시를 하고 있사옵니다.”", storyImage: nil, choice: [Choice(choiceText: "심정이 참담하다.", nextPageIndex: 2, questIdentifier: "", endingScore: 0), Choice(choiceText: "헛웃음만 나오는 이 상황이 재미있다.", nextPageIndex: 3, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: " 지금 내 심정은 참담하기 그지없다.\n\n 아무리 영창대군의 편에 선 자라고 할지라도 엄연히 세자가 있는데도 이리 대놓고 반대를 한다니. 나는 그저 ‘세자’라는 이름만 가진 꼭두각시일 뿐이란 말인가? 나는 여전히 이곳에 홀로 고립되어 있다.", storyImage: nil, choice: [], endEpisodePage: true),
    Page(storyText: " 대비께서 대군을 낳으시고 내 편엔 아무도 남지 않은 이 상황이 그저 웃기고 어이가 없었다. 난 미친 사람처럼 웃었다. 난 그저 ‘세자’라는 이름만 가진 꼭두각시였다는 사실이 이렇게 뼈 시리게 느껴졌고, 가슴이 욱신거렸다. 가뜩이나 쓸쓸한 이곳이 곱절은 더 외롭게만 느껴졌다. 한참을 웃고 나니 더 가슴이 시렸다.", storyImage: nil, choice: [], endEpisodePage: true)
]
let ep114 : [Page] = [
    Page(storyText: " 아버지가 쓰러진 날로부터 두어 달이 지났을까. 정인홍의 상소가 한 통 올라왔다.\n\n“신이 듣건대 지난 10월 전하께옵서 전섭의 전교를 내리자 영의정 유영경이 원임 대신(전 정승)들을 꺼려 시임 대신(현 정승)들과 공모하였으며, 중궁전에서 언서로 전지를 내리자 ‘오늘의 전교는 뭇사람의 뜻밖에 나온 것이어서 명을 받지 못하겠다’라고 즉시 회계하여 대신들로 하여금 알지 못하게 하였고, 영경은 무슨 음모화 흉계가 있기에 이토록 비밀리에 하는 것입니까?…… 원임 대신을 멀리하고, 여러 사람의 뜻 밖에 나온 전교라고 한 까닭은 대체 무엇이옵니까? 영경이 세자 저하를 세자로 보긴 하시옵니까?”", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 1, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: " 상소에 대해 아버지는\n\n“정인홍이 세자로 하여금 속히 전위를 받게 하려고 하였으니 그 스스로 모의한 것이 세자에게 충성을 다하는 것이라고 여겼겠지만 실은 불충함이 극심하다. 세자는 반드시 천자의 명을 받은 뒤에 비로소 세자라고 할 수 있다. 지금 세자는 책명을 받지 못했으니 이는 천자도 허락하지 않은 것이고 천하도 알지 못한다.”\n 라고 하셨다. 나는 그 소식을 듣고 인정전으로 달려갔다.", storyImage: nil, choice: [Choice(choiceText: "죽으려고 해도 마음대로 죽지도 못했습니다.", nextPageIndex: 2, questIdentifier: "", endingScore: 0), Choice(choiceText: "제가 어찌하면 세자로 인정을 하시렵니까?", nextPageIndex: 3, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: " “아바마마, 지난번 갑자기 전위하라는 명을 내리시니 신은 죽으려 해도 죽을 수가 없었나이다.”\n\n 책명을 받지 못한 나는 세자가 될 수 없다. 조정에는 내 편이 없다. 아버지마저 나를 미워하신다. 이런 곳에서 홀로 버틸 수밖에 없는 내가 초라하고 비참하게만 느껴졌다.", storyImage: nil, choice: [], endEpisodePage: true),
    Page(storyText: " “천자가 허락을 하지 않았어도, 아바마마께서는 인정을 해주실 수 있지 않습니까? 지난번 갑자기 세자로 저를 임명을 하라는 명을 내리시니 신은 죽으려고 해도 죽을 수가 없었나이다. 제가 어찌하면 되겠습니까? 제가 죽으면 그제서야 인정을 하실 겁니까? 신이 도대체 어찌하면 세자로 인정을 하실 겁니까?”\n\n 나는 울부짖었다. 책명 받지 못한 나는 세자가 될 수 없다. 조정도, 아버지도 내 편이 아니다. 이런 곳에서 홀로 버텨야 하는 나 자신이 너무 초라하게만 느껴졌다.", storyImage: nil, choice: [], endEpisodePage: true)
]
let ep115 : [Page] = [
    Page(storyText: " 빗방울이 보슬보슬 떨어지던, 잠 못 들던 새벽, 나는 침전을 나와 돌계단에 걸터 앉았다. 머리가 축축해지고, 온몸이 젖어 으슬으슬 해지는 게 느껴졌다. 그러던 찰나에, 갑자기 목소리가 들렸다.\n\n‘어차피 네 아비는 곧 죽는다. 대군은 왕위를 이을 수 없어. 네가 왕이 될 것이야.’", storyImage: nil, choice: [Choice(choiceText: "누구냐고 소리친다.", nextPageIndex: 1, questIdentifier: "", endingScore: 0), Choice(choiceText: "무시한다.", nextPageIndex: 2, questIdentifier: "", endingScore: 0)], endEpisodePage: false),
    Page(storyText: " 놀란 나는 벌떡 일어나서 소리쳤다.\n\n“누구냐!”\n\n 주위를 둘러보아도 아무도 없었다. 내 귓가에 목소리가 자꾸만 맴돌았다. 여자도, 남자도 아닌 목소리가 머리를 띵하게 만들었다.\n\n‘아버지께서 곧 돌아가신다니. 그게 무슨 말도 안 되는 소리인가?’", storyImage: nil, choice: [], endEpisodePage: true),
    Page(storyText: " 내가 잘못 들은 거겠지 하며 무시했다. 그러나 잠시 뒤, 또 소리가 들렸다.\n\n‘안심해. 네 아비의 총애를 받지 않아도 넌 왕이 될 수 있어. 대군이 다 크기 전, 아마 네 아비는 곧 죽을 거다.’\n\n 놀란 나는 벌떡 일어났다. 주위를 둘러보아도 아무도 없었다. 내 귓가에 목소리가 자꾸만 맴돌았다. 여자도, 남자도 아닌 목소리가 머리를 띵하게 만들었다.\n\n‘아버지께서 곧 돌아가신다니. 그게 무슨 말도 안 되는 소리인가?’", storyImage: nil, choice: [], endEpisodePage: true)
]
let ep116 : [Page] = [
    Page(storyText: " 궁 내에 울려 퍼지는 통곡의 울음소리. 아버지께 서 승하하셨다.\n\n‘설마 그 목소리의 말이 맞았다니. 그건 환청이 아니라 예언이었던 것인가? 아, 그럼 이제 내가 왕인 것인가?’\n 나는 지금 이 순간 기뻐해야할지, 슬퍼해야할지 혼란스러웠다.", storyImage: nil, choice: [], endEpisodePage: true)
]
let ep117 : [Page] = [
    Page(storyText: " 아버지를 잃은 슬픔에서 나올 틈도 없이 즉위식이 거행되었다. 서러움에 갇힌 세자의 삶에서 벗어나 이제서야 겨우 왕이 되었는데, 나에겐 너무나도 익숙한 느낌이었다.", storyImage: nil, choice: [], endEpisodePage: true)
]
