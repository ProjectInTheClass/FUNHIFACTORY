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
    let storyText: String
    let storyImage: String?
    let choice :[Choice]
   
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

var santa = GameCharacter(totalGold: 0, currentChapterGold: 0, previousChapterGold: 0)


let ep001: [Page] = [
    Page(storyText: " 한 나라의 왕인 나는 굵은 포승줄로 묶인 채 고개를 떨궜다. 이 자리에 발을 딛는 것도 이것이 마지막이겠거니 싶었다. 난 그저 초점 없는 눈으로 땅바닥을 바라보며 무릎을 꿇었다.", storyImage: nil, choice: [
            Choice(choiceText: "다음", nextPageIndex: 2, questIdentifier: "", endingScore: 0)]),
    Page(storyText: " 나는 내가 내뱉는 숨 하나하나를 의심했다. 이게 정녕 꿈이 아닌 것인지, 내가 어찌 이런 처지가 되었는지 말이다. 내가 아버지의 미움을 버티면서까지 겨우 이 자리에 섰는데 이리 되어버린 게 현실이 아니기를 바랐다. 날 이렇게 만든 자들을 결코 용서할 수 없다.", storyImage: nil, choice: [
                Choice(choiceText: "다음", nextPageIndex: 2, questIdentifier: "", endingScore: 0)
        ]),
    Page(storyText: "뒤이어 나온 대비는 나를 죽일 기세로 쏘아 보았다. 나에게 참아왔던 한이 그리 많았던 것인지, 화와 후련함이 섞인 듯한 표정이었다.\n\n \"소성정의 왕대비*는 이렇게 이르노라. 하늘이 많은 백성을 내고 임금을 세우게 하신 것은 인륜을 펴고 법도를 세워 위로 종묘를 받들고 아래로 백성을 잘 다스리게 하려고 하신 것이다. 선조 대왕(宣祖大王)께서 불행하게도 적자(適子)가 없어 일시의 법도에 따라 나이의 순서를 뛰어넘고 광해를 세자로 삼았다.\n 그런데 그는 동궁에 있을 때부터 잘못하는 행위가 드러났으므로 선조께서 만년에 몹시 후회하고 한스럽게 여기셨고, 그가 왕위를 계승한 뒤에는 도리어 어긋나는 짓을 하자 몹시 후회하셨다.", storyImage: nil, choice: [
            Choice(choiceText: "아무 말도 할 수 없다.", nextPageIndex: 3, questIdentifier: "", endingScore: 0)]),
    Page(storyText: " 우선 그중에서 큰 죄악만을 거론해 볼까 한다. 내가 아무리 덕이 부족하더라도 선왕의 배필이 되어 한 나라의 국모 노릇을 한 지 벌써 여러 해가 되었으니 선조의 아들이라면 나를 어머니로 여기지 않을 수 없을 것이다.\n 하나, 광해는 남을 참소하고 음해하는 자들의 말을 신임하고 스스로 시기하고 혐의하는 마음을 가져 우리 부모를 형벌하여 죽이고 우리 일가들을 몰살시켰으며 품 속에 있는 어린 자식을 빼앗아 죽이고 나를 유폐하여 곤욕을 치르게 하였으니, 그는 인간의 도리가 조금도 없는 자이다.\n 그가 이러한 짓을 한 것은 선왕에게 품었던 유감을 풀려고 한 것인데 미망인에 대해서야 무슨 짓인들 못하겠는가. 그는 형과 아우를 살해하고 조카들을 모조리 죽였으며 서모*를 때려 죽이기까지 하였다.", storyImage: nil, choice: [
            Choice(choiceText: "따진다", nextPageIndex: 4, questIdentifier: "", endingScore: 0)]),
    Page(storyText: " 그리고 여러 차례 큰 옥사를 일으켜 무고한 사람들을 가혹하게 죽였고, 민가 수천 호를 철거시키고 두 궁궐을 창건하는 데 있어 토목 공사의 일이 10년이 지나도록 끝나지 않았다.\n 그리고 선왕조의 원로대신들을 모두 축출시키고 인아친척들과 궁녀, 내관들로서 악한 짓을 하도록 권유하는 무리들만을 등용하고 신임하였으며, 정사를 하는 데 있어 뇌물을 바친 자들만을 기용했으므로 무식한 자들이 조정에 가득하였고 금을 싣고 와서 관직을 사는 자들이 마치 장사꾼이 물건을 흥정하듯이 하였다.\n 또한 부역이 많고 수탈이 극심하여 백성들이 살 수가 없어서 고난 속에서 아우성을 치고 있으니, 국가의 위태로움은 말할 수 없었다. 어디 그뿐이겠는가.\" ", storyImage: nil, choice: [
            Choice(choiceText: "다음", nextPageIndex: 5, questIdentifier: "", endingScore: 0),
            Choice(choiceText: "다음", nextPageIndex: 6, questIdentifier: "", endingScore: 0)]),
    Page(storyText: " 나는 아무 말도 할 수 없었다.\n\n “우리나라가 중국을 섬겨온 지 2백여 년이 지났으니 의리에 있어서는 군신의 사이지만 은혜에 있어서는 부자의 사이와 같았고, 임진년에 나라를 다시 일으켜준 은혜는 영원토록 잊을 수 없다.\n 이리하여 선왕께서 40년간 보위에 계시면서 지성으로 중국을 섬기시며 평생에 한 번도 서쪽으로 등을 돌리고 앉으신 적이 없었다. 그런데 광해는 은덕을 저버리고 천자의 명을 두려워하지 않았으며 배반하는 마음을 품고 오랑캐와 화친하였다.", storyImage: nil, choice: [
            Choice(choiceText: "다음", nextPageIndex: 7, questIdentifier: "", endingScore: 0)]),
    Page(storyText: " \"내가 나 좋다고 그랬겠소? 내가 나라이자 나라가 나일 것이니, 모두 나라가 잘 되자고 한 일이 아니겠는가.\"\n\n “닥치거라. 우리나라가 중국을 섬겨온 지 2백여 년이 지났으니 의리에 있어서는 군신의 사이지만 은혜에 있어서는 부자의 사이와 같았고, 임진년에 나라를 다시 일으켜준 은혜는 영원토록 잊을 수 없다.\n 이리하여 선왕께서 40년간 보위에 계시면서 지성으로 중국을 섬기시며 평생에 한 번도 서쪽으로 등을 돌리고 앉으신 적이 없었다. 그런데 광해는 은덕을 저버리고 천자의 명을 두려워하지 않았으며 배반하는 마음을 품고 오랑캐와 화친하였다.", storyImage: nil, choice: [
            Choice(choiceText: "다음", nextPageIndex: 7, questIdentifier: "", endingScore: 0)]),
    Page(storyText: " 이리하여 기미년(1308)에 중국이 오랑캐를 정벌할 때 장수에게 사태를 예상하여 그들을 좇을지 등을 질지를 결정하라고 은밀히 지시하였다. 그 끝내 우리 군사 모두를 오랑캐에게 투항하게 하여 추악한 명성이 온 천하게 전파되게 하였다.\n 그리고 우리나라에 온 중국 사신을 구속 수금하는 데 있어 감옥의 죄수들보다 더하였고, 황제가 칙서를 여러 번 내렸으나 군사를 보낼 생각을 하지 아니하였다. 그리하여 예의의 나라인 우리 삼한으로 하여금 이적 금수의 나라가 되는 것을 모면하지 못하게 하였으니, 가슴 아픈 일을 어떻게 다 말할 수 있겠는가.", storyImage: nil, choice: [
            Choice(choiceText: "다음", nextPageIndex: 8, questIdentifier: "", endingScore: 0)]),
    Page(storyText: " 하늘의 이치를 멸절시키고 인륜을 막아 위로는 중국 조정에 죄를 짓고 아래로 백성들에게 원한을 사고 있는데 이러한 죄악을 저지른 자가 어떻게 나라의 임금으로서 백성의 부모가 될 수 있으며, 임금의 자리에 있으면서 종묘, 사직의 신령을 받들 수 있겠는가. 이에 그를 폐위시키노라.”\n\n 그렇게 나는 폐위되었다. 이제 더 이상 한 나라의 왕이 아니다.", storyImage: nil, choice: [
            Choice(choiceText: "현실을 수긍한다.", nextPageIndex: 9, questIdentifier: "", endingScore: 0),
            Choice(choiceText: "복수를 꿈꾼다.", nextPageIndex: 10, questIdentifier: "", endingScore: 0)]),
    Page(storyText: " ‘잃을 게 많은 자리에 올라, 내 덕을 쌓지 못한 채 한순간에 물거품이 되어 추락하는구나. 올라오기 위해 노력한 순간이 자리에 앉아 있는 순간보다 갑절은 더 길다. 나는 대체 무엇을 위해 올라온 것이냐. 그렇게 악착같이 살아서 결국 내 손에 흐르는 것은 비릿비릿하고 역겨운 진한 핏물뿐이구나.’", storyImage: nil, choice: [
            Choice(choiceText: "", nextPageIndex: 11, questIdentifier: "", endingScore: 0)]),
    Page(storyText: " ‘숨이 턱턱 막히는구나. 아득바득 올라왔는데 한 순간에 미끄러져 땅바닥으로 추락하니. 참 내 꼴이 우습다, 우스워. 아아, 이제 나에게 남은 건 무엇이란 말인가? 그렇게 악착같이 살아서 결국 내 손에 흐르는 것은 비릿비릿하고 역겨운 진한 핏물뿐이구나. 이미 더럽혀진 손, 더 더러워진다고 티가 날까. 난 복수를 꿈 꿀 것이다.’", storyImage: nil, choice: [
            Choice(choiceText: "", nextPageIndex: 11, questIdentifier: "", endingScore: 0)
])]
    

let ep002: [Page] = [
    Page(storyText: "그를 지켜보던 소월신(素月神)은 가볍게 피식 웃고는 시간의 물레방아를 돌렸다. 19바퀴를 돌린 후 멈추고 시간의 한 조각을 꺼내 그에게 지난 과거로 자신이 돌아가는 꿈을 꾸는 도술인 과아귀몽술(過我歸夢術)을 부렸다.", storyImage: nil, choice: [
        Choice(choiceText: "", nextPageIndex: 666, questIdentifier: "", endingScore: 0)])]

let ep101: [Page] = [
    Page(storyText: " “세자 저하, 감축드리옵니다.”\n\n 동궁에서 나오니 모든 관료들이 나를 향해 축하를 올렸다.\n\n ‘드디어 내가 세자가 되었단 말인가?’", storyImage: nil, choice: [
            Choice(choiceText: "애써 덤덤한 척 한다. ", nextPageIndex: 1, questIdentifier: "", endingScore: 0),
            Choice(choiceText: "행복해 한다.", nextPageIndex: 2, questIdentifier: "", endingScore: 0),
            Choice(choiceText: "살짝 미소를 짓는다.", nextPageIndex: 3, questIdentifier: "", endingScore: 0)]),
    Page(storyText: " 나는 애써 덤덤한 척 일말의 표정도 바꾸지 않았다.", storyImage: nil, choice: [
        Choice(choiceText: "", nextPageIndex: 666, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: " 내가 드디어 인정을 받은 것 같았다. 서글픈 내 세월을 위로받는 기분이었다. 아무리 내 감정을 숨기려야 숨겨지지가 않았다.\n\n “그리 좋으십니까? 아까부터 줄곧 웃음꽃이 핀 듯합니다.”\n “너라면 웃음이 안 나겠느냐? 아버지께 조금이라도 인정을 받은 것 같구나.”", storyImage: nil, choice: [
        Choice(choiceText: "", nextPageIndex: 666, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: " 내가 드디어 인정을 받은 것 같았다. 서글픈 내 세월을 위로받는 기분이었다. 체통은 지켜야 하니 너무 좋아할 순 없었다. 하지만 입꼬리는 자꾸만 위로 솟아올랐다.", storyImage: nil, choice: [
        Choice(choiceText: "", nextPageIndex: 666, questIdentifier: "", endingScore: 0)
])]

let ep102: [Page] = [
    Page(storyText: " 한 내시가 다급하게 나를 불렀다.\n\n “저하, 급히 피란을 가셔야 하옵니다. 떠날 채비를 서두르십시오.”\n\n 급히 채비를 하고 동궁 밖으로 나오자 차가운 새벽 내음이 느껴졌다. 처마를 따라 빗물이 떨어지고 있었다.\n\n ‘아아, 하늘마저 우리의 편이 아닌 것인가.’\n\n 나의 손끝에 스치는 빗물을 따라 냉랭하게 느껴졌다. 아버지를 기다리기 위해 인정전으로 향했다. 인정전에는 이미 모든 벼슬아치들과 마부와 말 등이 대궐 뜰을 가득 메웠다.", storyImage: nil, choice: [
        Choice(choiceText: "다음.", nextPageIndex: 1, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: " 비는 그칠 줄을 몰랐다. 아버지와 나는 말을 타고, 소상대비는 뚜껑 있는 교자를 타고 갔다. 홍제원*에 이르자 비는 더 극심히 왔고, 숙의* 이하는 교자를 버리고 말을 탔다.\n 뒤에서는 통곡하는 궁인들의 목소리가 들렸다. 점심을 먹으려고 하니, 반찬은 커녕 밥도 제대로 먹지를 못했다. 급작스레 떠나게 된 피란길이라서 그렇다고 애써 위안 삼았다.", storyImage: nil, choice: [
            Choice(choiceText: "", nextPageIndex: 666, questIdentifier: "", endingScore: 0),
    ])
]

let ep103: [Page] = [
    Page(storyText: "해가 떨어질 때 즈음 임진강 나루에 닿아 배에 올랐다. 아버지는 신하들을 보고 엎드려서 통곡하니 좌우가 눈물을 흘리면서 감히 쳐다보지를 못했다. 밤은 칠흑같이 어두운데 단 한 개의 불도 없었다. 나는 아버지를 똑바로 쳐다볼 순 없었고, 그저 뒷모습만 또렷이 볼 뿐이었다.\n 밤이 깊은 후에야 겨우 소식이 닿았다. 아버지가 배를 가라앉히고 나루를 끊고 가까운 곳의 집도 철거시키도록 명했다. 이는 적들이 그것을 뗏목으로 이용할 것을 염려한 때문이었다. 백관들은 굶주리고 지쳐 촌가에 흩어져 잤다.", storyImage: nil, choice: [
            Choice(choiceText: "다음", nextPageIndex: 1, questIdentifier: "", endingScore: 0)]),
    Page(storyText: " “여봐라, 강을 건너지 못한 이가 몇이나 있는지 아느냐?”\n “확실한 수는 잘 모르겠지만, 지금 보았을 땐 강을 건너지 못한 이는 반이 족히 넘을 듯 하옵니다, 저하.”\n\n 비는 여전히 오고 있었다. 나는 걸어온 길을 되돌아보았다.  내가 걸어온 그 길에는 출렁이는 강물만이 흐르고 있었다.\n\n 아버지께서는 그게 정말 최선의 선택이었을까?", storyImage: nil, choice: [
            Choice(choiceText: "아버지를 이해한다.", nextPageIndex: 2, questIdentifier: "", endingScore: 0),
            Choice(choiceText: "아버지를 이해하지 못 한다..", nextPageIndex: 3, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: " 사실 내가 아버지였어도 아버지와 똑같은 선택을 하지 않았을까 싶다. 적들과 마주치지 않기 위해, 제 목숨을 살리기 위해, 한 나라의 왕이 비참하게 죽지 않기 위해서 말이다.\n\n 아버지는 불어넘치는 강물에 두려워하셨을 것이다. 피란을 가지 못할까 봐 무서우셨을 것이다. 강을 미처 건너지 못한 궁인들에게 미안해하실 것이다. 아마 그럴 것이다. 그렇게 믿고 싶다.", storyImage: nil, choice: [              Choice(choiceText: "", nextPageIndex: 666, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: " 제 목숨을 살리기 위해 다른 이들을 포기하는 건 내 입장에서는 이해할 수가 없다. 그것이 정말 현명한 판단이었을까? 내가 아버지라면 절반이 넘는 궁인들을 두고 떠나지는 않았을 것이다. 애초에 궁을 떠나지는 않았을 것이다. 한 나라의 왕이 어찌 자리를 비울 수 있단 말인가? 죽더라도 조선의 심장에서 죽겠다.", storyImage: nil, choice: [
            Choice(choiceText: "", nextPageIndex: 666, questIdentifier: "", endingScore: 0)
    ])
]

let ep104: [Page] = [
    Page(storyText: " “13일 밤부터 비둘기처럼 생긴 회색빛이 나는 새 한 마리가 대궐 안 숲에서 울었다는 이야기가 들렸다. 혹, 그 이야기에 대해 아는 것이 있느냐?”\n\n 나는 내가 말해놓고도 갑자기 이것을 왜 묻고 있는지 모르겠다.", storyImage: nil, choice: [
            Choice(choiceText: "다음", nextPageIndex: 1, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: " “예. 그 소리가 마치 각각화도(各各禍逃)* 또는 각각궁통개(各各弓筒介)**라고 우는 듯하였으며 소리가 몹시 슬프고도 다급했다고 하옵니다.”\n “오호라, 새가 그리 희귀하게 우는 것을 보면 우리에게 무언갈 알려주고자 하는 것이 분명하도다.”\n “그 새는 수 일 동안 분주하게 오가면서 온 궁 안을 두루 날아다니면서 울어댔다고 들었사옵니다.”\n “그럼, 그 새가 어디서 날아온 것인지도 아는가?”\n “어떤 이는 그것이 바다에서 왔다고 하고, 또 다른 이는 깊은 산 중에 그런 새가 있다고 하옵니다. 그 새가 울기 시작한 날이 바로 왜구가 우리나라에 상륙한 일이온데, 어찌 이런 우연이 있을 수 있겠사옵니까?”", storyImage: nil, choice: [
            Choice(choiceText: "다음.", nextPageIndex: 2, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: " “그래. 지난해에는 죽은 자라들이 상류로부터 강을 뒤덮고 떠내려 왔으며, 강물마저 핏물같이 붉게 변하여 사람들이 걱정을 놓질 못하였는데 말이다. 자라와 적빛 강물에 이어서 회색빛 새가 우리에게 경고를 해주었던 것 같구나.”\n “예, 저하. 한데, 그것뿐만이 아니 옵니다. 왜구가 상륙한 후에 전하께서 침전에 앉아 계셨는데 침전 서쪽 작은 못에서 푸른색 무지개가 나타나 그 기운이 동쪽을 향하다가 북쪽으로 향하여 중문을 뚫고 전상*에 올라 어좌**에까지 접근했다고 하옵니다. 성상께서 피하여 서쪽으로 앉으면 서쪽을 향하고 동쪽으로 피하면 동쪽으로 향했다고 하니 이런 해괴한 일이 일어나는지 신은 도통 알 길이 없사옵니다.", storyImage: nil, choice: [
            Choice(choiceText: "하늘의 경고일 듯 하다.", nextPageIndex: 3, questIdentifier: "", endingScore: 0),
            Choice(choiceText: "그냥 잘못 본 거겠지.", nextPageIndex: 4, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: "“우리에게 경고로 하여금 알리신 바가 하늘이 우리를 도우겠다는 말인지, 우리를 공격하겠다는 말인지는 우리가 어떻게 대처하느냐에 달려있겠구나.”", storyImage: nil, choice: [
            Choice(choiceText: "다음", nextPageIndex: 5, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: "“참으로 기이한 일이구나. 잘못 본 건 아니더냐? 어찌 무지개가 이리저리 움직이겠느냐?”\n “소인도 그게 어떻게 가능한 일인지는 잘 모르겠습니다. 다만 그것이 천지의 뜻이 아닐까 싶습니다. 우리에게 무언가를 말해주는 듯하기도 하고요.”\n “들어보니 그럴듯하구나.”", storyImage: nil, choice: [
            Choice(choiceText: "다음", nextPageIndex: 5, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: " ‘들어본 적이 있는 듯한 이야기와 익숙한 이 대화의 흐름은 대체 무엇인가?’", storyImage: nil, choice: [
            Choice(choiceText: "잘못 생각했겠지.", nextPageIndex: 6, questIdentifier: "", endingScore: 0),
            Choice(choiceText: "나 자신을 의심한다.", nextPageIndex: 7, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: " 나는 내가 잘못 생각하고 있겠거니 했다. 하지만 어쩐지 어딘가 찜찜한 기운은 가시질 않았다.", storyImage: nil, choice: [
            Choice(choiceText: "", nextPageIndex: 666, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: " “너, 이 이야기를 나와 한 적이 있느냐?”\n “아니요, 이번이 처음입니다만, 무슨 일인지요?”\n “한데 어찌 이리 익숙하단 말이냐. 내가 기억이 이상해 진 게 틀림없다. 의원을 봐야겠다. 어서 의원을 불러라. 어서!”\n “아, 예. 불러오겠습니다.”\n\n 내가 드디어 미친 건가 싶었다. 난생처음 겪는 일이니 도무지 원인을 알 방도가 없었다. 내가 그렇게 고민하고 있을 사이에 의원이 왔다.", storyImage: nil, choice: [
            Choice(choiceText: "다음", nextPageIndex: 8, questIdentifier: "", endingScore: 0)
    ]),
    Page(storyText: "", storyImage: nil, choice: [
            Choice(choiceText: "", nextPageIndex: 666, questIdentifier: "", endingScore: 0)
    ])
]

let prologue: Chapter = Chapter(Episodes: [ep001, ep002], quests: [])
let chapter1: Chapter = Chapter(Episodes: [ep101, ep102, ep103, ep104], quests: []])

