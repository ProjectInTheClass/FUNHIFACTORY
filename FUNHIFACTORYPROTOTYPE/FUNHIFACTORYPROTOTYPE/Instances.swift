//
//  Instances.swift
//  FUNHIPROTOTYPE
//
//  Created by 최서연 on 2020/10/12.
//

import Foundation

// 캐릭터가 죽고 난 후에 유저가 선택한 부활 방법을 식별하기 위한 것(게임오버뷰랑 메인게임뷰에서 쓰임)
    var endingIS:String = ""


    let ep001: [Page] = [
        Page(storyText: " 한 나라의 왕인 나는 굵은 포승줄로 묶인 채 고개를 떨궜다. 이 자리에 발을 딛는 것도 이것이 마지막이겠거니 싶었다. 난 그저 초점 없는 눈으로 땅바닥을 바라보며 무릎을 꿇었다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 2,  endingScore: 0)], questIdentifier: "", annotation: []),
        Page(storyText: " 한 나라의 왕인 나는 굵은 포승줄로 묶인 채 고개를 떨궜다. 나는 내가 내뱉는 숨 하나하나를 의심했다. 이게 정녕 꿈이 아닌 것인지, 내가 어찌 이런 처지가 되었는지 말이다. 내가 아버지의 미움을 버티면서까지 겨우 이 자리에 섰는데 이리 되어버린 게 현실이 아니기를 바랐다. 날 이렇게 만든 자들을 결코 용서할 수 없다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 2,  endingScore: 0)], questIdentifier: "", annotation: []),
        Page(storyText: "뒤이어 나온 대비는 나를 죽일 기세로 쏘아 보았다. 나에게 참아왔던 한이 그리 많았던 것인지, 화와 후련함이 섞인 듯한 표정이었다.\n\n \"소성정의 왕대비*는 이렇게 이르노라. 하늘이 많은 백성을 내고 임금을 세우게 하신 것은 인륜을 펴고 법도를 세워 위로 종묘를 받들고 아래로 백성을 잘 다스리게 하려고 하신 것이다. 선조 대왕(宣祖大王)께서 불행하게도 적자(適子)가 없어 일시의 법도에 따라 나이의 순서를 뛰어넘고 광해를 세자로 삼았다.\n 그런데 그는 동궁에 있을 때부터 잘못하는 행위가 드러났으므로 선조께서 만년에 몹시 후회하고 한스럽게 여기셨고, 그가 왕위를 계승한 뒤에는 도리어 어긋나는 짓을 하자 몹시 후회하셨다.", storyImage: nil, choice: [
            Choice(choiceText: "다음.", nextPageIndex: 3,  endingScore: 0)
        ], questIdentifier: "", annotation: [Note(word: "소성정의 왕대비(昭聖貞懿王大妃)", explanation: "인목왕후 김씨로, 정명공주와 영창대군의 어머니이다.")]),
        Page(storyText: " 우선 그중에서 큰 죄악만을 거론해 볼까 한다. 내가 아무리 덕이 부족하더라도 선왕의 배필이 되어 한 나라의 국모 노릇을 한 지 벌써 여러 해가 되었으니 선조의 아들이라면 나를 어머니로 여기지 않을 수 없을 것이다.\n 하나, 광해는 남을 참소하고 음해하는 자들의 말을 신임하고 스스로 시기하고 혐의하는 마음을 가져 우리 부모를 형벌하여 죽이고 우리 일가들을 몰살시켰으며 품 속에 있는 어린 자식을 빼앗아 죽이고 나를 유폐하여 곤욕을 치르게 하였으니, 그는 인간의 도리가 조금도 없는 자이다.\n 그가 이러한 짓을 한 것은 선왕에게 품었던 유감을 풀려고 한 것인데 미망인에 대해서야 무슨 짓인들 못하겠는가. 그는 형과 아우를 살해하고 조카들을 모조리 죽였으며 서모*를 때려 죽이기까지 하였다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 4,  endingScore: 0)], questIdentifier: "", annotation: [Note(word: "서모", explanation: "아버지의 첩")]),
        Page(storyText: " 그리고 여러 차례 큰 옥사를 일으켜 무고한 사람들을 가혹하게 죽였고, 민가 수천 호를 철거시키고 두 궁궐을 창건하는 데 있어 토목 공사의 일이 10년이 지나도록 끝나지 않았다.\n 그리고 선왕조의 원로대신들을 모두 축출시키고 인아친척들과 궁녀, 내관들로서 악한 짓을 하도록 권유하는 무리들만을 등용하고 신임하였으며, 정사를 하는 데 있어 뇌물을 바친 자들만을 기용했으므로 무식한 자들이 조정에 가득하였고 금을 싣고 와서 관직을 사는 자들이 마치 장사꾼이 물건을 흥정하듯이 하였다.\n 또한 부역이 많고 수탈이 극심하여 백성들이 살 수가 없어서 고난 속에서 아우성을 치고 있으니, 국가의 위태로움은 말할 수 없었다. 어디 그뿐이겠는가.\" ", storyImage: nil, choice: [Choice(choiceText: "아무 말도 할 수 없다.", nextPageIndex: 5, endingScore: 1),Choice(choiceText: "따진다.", nextPageIndex: 6, endingScore: 5)], questIdentifier: "", annotation: []
        ),
        Page(storyText: " 나는 아무 말도 할 수 없었다.\n\n “우리나라가 중국을 섬겨온 지 2백여 년이 지났으니 의리에 있어서는 군신의 사이지만 은혜에 있어서는 부자의 사이와 같았고, 임진년에 나라를 다시 일으켜준 은혜는 영원토록 잊을 수 없다.\n 이리하여 선왕께서 40년간 보위에 계시면서 지성으로 중국을 섬기시며 평생에 한 번도 서쪽으로 등을 돌리고 앉으신 적이 없었다. 그런데 광해는 은덕을 저버리고 천자의 명을 두려워하지 않았으며 배반하는 마음을 품고 오랑캐와 화친하였다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 7,  endingScore: 0)], questIdentifier: "", annotation: []),
        Page(storyText: " \"내가 나 좋다고 그랬겠소? 내가 나라이자 나라가 나일 것이니, 모두 나라가 잘 되자고 한 일이 아니겠는가.\"\n\n “닥치거라. 우리나라가 중국을 섬겨온 지 2백여 년이 지났으니 의리에 있어서는 군신의 사이지만 은혜에 있어서는 부자의 사이와 같았고, 임진년에 나라를 다시 일으켜준 은혜는 영원토록 잊을 수 없다.\n 이리하여 선왕께서 40년간 보위에 계시면서 지성으로 중국을 섬기시며 평생에 한 번도 서쪽으로 등을 돌리고 앉으신 적이 없었다. 그런데 광해는 은덕을 저버리고 천자의 명을 두려워하지 않았으며 배반하는 마음을 품고 오랑캐와 화친하였다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 7,  endingScore: 0)], questIdentifier: "", annotation: []),
        Page(storyText: " 이리하여 기미년(1308)에 중국이 오랑캐를 정벌할 때 장수에게 사태를 예상하여 그들을 좇을지 등을 질지를 결정하라고 은밀히 지시하였다. 그 끝내 우리 군사 모두를 오랑캐에게 투항하게 하여 추악한 명성이 온 천하게 전파되게 하였다.\n 그리고 우리나라에 온 중국 사신을 구속 수금하는 데 있어 감옥의 죄수들보다 더하였고, 황제가 칙서를 여러 번 내렸으나 군사를 보낼 생각을 하지 아니하였다. 그리하여 예의의 나라인 우리 삼한으로 하여금 이적 금수의 나라가 되는 것을 모면하지 못하게 하였으니, 가슴 아픈 일을 어떻게 다 말할 수 있겠는가.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 8,  endingScore: 0)], questIdentifier: "", annotation: []),
        Page(storyText: " 하늘의 이치를 멸절시키고 인륜을 막아 위로는 중국 조정에 죄를 짓고 아래로 백성들에게 원한을 사고 있는데 이러한 죄악을 저지른 자가 어떻게 나라의 임금으로서 백성의 부모가 될 수 있으며, 임금의 자리에 있으면서 종묘, 사직의 신령을 받들 수 있겠는가. 이에 그를 폐위시키노라.”\n\n 그렇게 나는 폐위되었다. 이제 더 이상 한 나라의 왕이 아니다.", storyImage: nil, choice: [Choice(choiceText: "현실을 수긍한다.", nextPageIndex: 9,  endingScore: 0),Choice(choiceText: "복수를 꿈꾼다.", nextPageIndex: 10,  endingScore: 0)], questIdentifier: "", annotation: []),
        Page(storyText: " ‘잃을 게 많은 자리에 올라, 내 덕을 쌓지 못한 채 한순간에 물거품이 되어 추락하는구나. 올라오기 위해 노력한 순간이 자리에 앉아 있는 순간보다 갑절은 더 길다. 나는 대체 무엇을 위해 올라온 것이냐. 그렇게 악착같이 살아서 결국 내 손에 흐르는 것은 비릿비릿하고 역겨운 진한 핏물뿐이구나.’", storyImage: nil, choice: [Choice(choiceText: "", nextPageIndex: 11,  endingScore: 0)], questIdentifier: "", endEpisodePage: true, annotation: []),
        Page(storyText: " ‘숨이 턱턱 막히는구나. 아득바득 올라왔는데 한 순간에 미끄러져 땅바닥으로 추락하니. 참 내 꼴이 우습다, 우스워. 아아, 이제 나에게 남은 건 무엇이란 말인가? 그렇게 악착같이 살아서 결국 내 손에 흐르는 것은 비릿비릿하고 역겨운 진한 핏물뿐이구나. 이미 더럽혀진 손, 더 더러워진다고 티가 날까. 난 복수를 꿈 꿀 것이다.’", storyImage: nil, choice: [Choice(choiceText: "", nextPageIndex: 11,  endingScore: 0)
        ], questIdentifier: "", endEpisodePage: true, annotation: []
        )]
        

    let ep002: [Page] = [
        Page(storyText: "그를 지켜보던 소월신(素月神)은 가볍게 피식 웃고는 시간의 물레방아를 돌렸다. 19바퀴를 돌린 후 멈추고 시간의 한 조각을 꺼내 그에게 지난 과거로 자신이 돌아가는 꿈을 꾸는 도술인 과아귀몽술(過我歸夢術)을 부렸다.", storyImage: nil, choice: [Choice(choiceText: "", nextPageIndex: 666,  endingScore: 0)], questIdentifier: "", endEpisodePage: true, annotation: [])]

    let ep101: [Page] = [
        Page(storyText: " “세자 저하, 감축드리옵니다.”\n\n 동궁에서 나오니 모든 관료들이 나를 향해 축하를 올렸다.\n\n ‘드디어 내가 세자가 되었단 말인가?’", storyImage: nil, choice: [Choice(choiceText: "애써 덤덤한 척 한다. ", nextPageIndex: 1,  endingScore: 0),Choice(choiceText: "행복해 한다.", nextPageIndex: 2,  endingScore: 0),Choice(choiceText: "살짝 미소를 짓는다.", nextPageIndex: 3,  endingScore: 0)], questIdentifier: "", annotation: []),
        Page(storyText: " 나는 애써 덤덤한 척 일말의 표정도 바꾸지 않았다.", storyImage: nil, choice: [Choice(choiceText: "", nextPageIndex: 666,  endingScore: 0)
        ], questIdentifier: "", endEpisodePage: true, annotation: []),
        Page(storyText: " 내가 드디어 인정을 받은 것 같았다. 서글픈 내 세월을 위로받는 기분이었다. 아무리 내 감정을 숨기려야 숨겨지지가 않았다.\n\n “그리 좋으십니까? 아까부터 줄곧 웃음꽃이 핀 듯합니다.”\n “너라면 웃음이 안 나겠느냐? 아버지께 조금이라도 인정을 받은 것 같구나.”", storyImage: nil, choice: [
            Choice(choiceText: "", nextPageIndex: 666,  endingScore: 0)
        ], questIdentifier: "", endEpisodePage: true, annotation: []),
        Page(storyText: " 내가 드디어 인정을 받은 것 같았다. 서글픈 내 세월을 위로받는 기분이었다. 체통은 지켜야 하니 너무 좋아할 순 없었다. 하지만 입꼬리는 자꾸만 위로 솟아올랐다.", storyImage: nil, choice: [
            Choice(choiceText: "", nextPageIndex: 666,  endingScore: 0)
        ], questIdentifier: "", endEpisodePage: true, annotation: [])]

    let ep102: [Page] = [Page(storyText: " 한 내시가 다급하게 나를 불렀다.\n\n “저하, 급히 피란을 가셔야 하옵니다. 떠날 채비를 서두르십시오.”\n\n 급히 채비를 하고 동궁 밖으로 나오자 차가운 새벽 내음이 느껴졌다. 처마를 따라 빗물이 떨어지고 있었다.\n\n ‘아아, 하늘마저 우리의 편이 아닌 것인가.’\n\n 나의 손끝에 스치는 빗물을 따라 냉랭하게 느껴졌다. 아버지를 기다리기 위해 인정전으로 향했다. 인정전에는 이미 모든 벼슬아치들과 마부와 말 등이 대궐 뜰을 가득 메웠다.", storyImage: nil, choice: [
                                Choice(choiceText: "다음.", nextPageIndex: 1,  endingScore: 0)], questIdentifier: "", annotation: []
    ),Page(storyText: " 비는 그칠 줄을 몰랐다. 아버지와 나는 말을 타고, 소상대비는 뚜껑 있는 교자를 타고 갔다. 홍제원*에 이르자 비는 더 극심히 왔고, 숙의* 이하는 교자를 버리고 말을 탔다.\n 뒤에서는 통곡하는 궁인들의 목소리가 들렸다. 점심을 먹으려고 하니, 반찬은 커녕 밥도 제대로 먹지를 못했다. 급작스레 떠나게 된 피란길이라서 그렇다고 애써 위안 삼았다.", storyImage: nil, choice: [Choice(choiceText: "", nextPageIndex: 666,  endingScore: 0)], questIdentifier: "", endEpisodePage: true, annotation: [Note(word: "홍제원", explanation: "조선 시대에 중국 사신이 서울로 올 때 성 안에 들어오기 전에 묵던 공관(여관)"), Note(word: "숙의", explanation: "조선 시대 후궁에게 내리던 종 2품 내명부의 품계")])
    ]

    let ep103: [Page] = [
        Page(storyText: " 해가 떨어질 때 즈음 임진강 나루에 닿아 배에 올랐다. 아버지는 신하들을 보고 엎드려서 통곡하니 좌우가 눈물을 흘리면서 감히 쳐다보지를 못했다. 밤은 칠흑같이 어두운데 단 한 개의 불도 없었다. 나는 아버지를 똑바로 쳐다볼 순 없었고, 그저 뒷모습만 또렷이 볼 뿐이었다.\n 밤이 깊은 후에야 겨우 소식이 닿았다. 아버지가 배를 가라앉히고 나루를 끊고 가까운 곳의 집도 철거시키도록 명했다. 이는 적들이 그것을 뗏목으로 이용할 것을 염려한 때문이었다. 백관들은 굶주리고 지쳐 촌가에 흩어져 잤다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 1,  endingScore: 0)], questIdentifier: "chapter1quest1", annotation: []),
        Page(storyText: " “여봐라, 강을 건너지 못한 이가 몇이나 있는지 아느냐?”\n “확실한 수는 잘 모르겠지만, 지금 보았을 땐 강을 건너지 못한 이는 반이 족히 넘을 듯 하옵니다, 저하.”\n\n 비는 여전히 오고 있었다. 나는 걸어온 길을 되돌아보았다.  내가 걸어온 그 길에는 출렁이는 강물만이 흐르고 있었다.\n\n 아버지께서는 그게 정말 최선의 선택이었을까?", storyImage: nil, choice: [Choice(choiceText: "아버지를 이해한다.", nextPageIndex: 2,  endingScore: 0),Choice(choiceText: "아버지를 이해하지 못 한다..", nextPageIndex: 3,  endingScore: 0)
        ], questIdentifier: "", annotation: []),
        Page(storyText: " 사실 내가 아버지였어도 아버지와 똑같은 선택을 하지 않았을까 싶다. 적들과 마주치지 않기 위해, 제 목숨을 살리기 위해, 한 나라의 왕이 비참하게 죽지 않기 위해서 말이다.\n\n 아버지는 불어넘치는 강물에 두려워하셨을 것이다. 피란을 가지 못할까 봐 무서우셨을 것이다. 강을 미처 건너지 못한 궁인들에게 미안해하실 것이다. 아마 그럴 것이다. 그렇게 믿고 싶다.", storyImage: nil, choice: [              Choice(choiceText: "", nextPageIndex: 666,  endingScore: 0)
        ], questIdentifier: "", endEpisodePage: true, annotation: []),
        Page(storyText: " 제 목숨을 살리기 위해 다른 이들을 포기하는 건 내 입장에서는 이해할 수가 없다. 그것이 정말 현명한 판단이었을까? 내가 아버지라면 절반이 넘는 궁인들을 두고 떠나지는 않았을 것이다. 애초에 궁을 떠나지는 않았을 것이다. 한 나라의 왕이 어찌 자리를 비울 수 있단 말인가? 죽더라도 조선의 심장에서 죽겠다.", storyImage: nil, choice: [
                Choice(choiceText: "", nextPageIndex: 666,  endingScore: 0)
        ], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]

    let ep104: [Page] = [
        Page(storyText: " “13일 밤부터 비둘기처럼 생긴 회색빛이 나는 새 한 마리가 대궐 안 숲에서 울었다는 이야기가 들렸다. 혹, 그 이야기에 대해 아는 것이 있느냐?”\n\n 나는 내가 말해놓고도 갑자기 이것을 왜 묻고 있는지 모르겠다.", storyImage: nil, choice: [
                Choice(choiceText: "다음", nextPageIndex: 1,  endingScore: 0)
        ], questIdentifier: "", annotation: []),
        Page(storyText: " “예. 그 소리가 마치 각각화도(各各禍逃)* 또는 각각궁통개(各各弓筒介)**라고 우는 듯하였으며 소리가 몹시 슬프고도 다급했다고 하옵니다.”\n “오호라, 새가 그리 희귀하게 우는 것을 보면 우리에게 무언갈 알려주고자 하는 것이 분명하도다.”\n “그 새는 수 일 동안 분주하게 오가면서 온 궁 안을 두루 날아다니면서 울어댔다고 들었사옵니다.”\n “그럼, 그 새가 어디서 날아온 것인지도 아는가?”\n “어떤 이는 그것이 바다에서 왔다고 하고, 또 다른 이는 깊은 산 중에 그런 새가 있다고 하옵니다. 그 새가 울기 시작한 날이 바로 왜구가 우리나라에 상륙한 일이온데, 어찌 이런 우연이 있을 수 있겠사옵니까?”", storyImage: nil, choice: [
                Choice(choiceText: "다음.", nextPageIndex: 2,  endingScore: 0)
        ], questIdentifier: "", annotation: [Note(word: "각각화도(各各禍逃)", explanation: "사람들마다 화를 당해 흩어지다"), Note(word: "각각궁통개(各各弓筒介)", explanation: "사람들마다 활통을 지니다")]),
        Page(storyText: " “그래. 지난해에는 죽은 자라들이 상류로부터 강을 뒤덮고 떠내려 왔으며, 강물마저 핏물같이 붉게 변하여 사람들이 걱정을 놓질 못하였는데 말이다. 자라와 적빛 강물에 이어서 회색빛 새가 우리에게 경고를 해주었던 것 같구나.”\n “예, 저하. 한데, 그것뿐만이 아니 옵니다. 왜구가 상륙한 후에 전하께서 침전에 앉아 계셨는데 침전 서쪽 작은 못에서 푸른색 무지개가 나타나 그 기운이 동쪽을 향하다가 북쪽으로 향하여 중문을 뚫고 전상*에 올라 어좌**에까지 접근했다고 하옵니다. 성상께서 피하여 서쪽으로 앉으면 서쪽을 향하고 동쪽으로 피하면 동쪽으로 향했다고 하니 이런 해괴한 일이 일어나는지 신은 도통 알 길이 없사옵니다.", storyImage: nil, choice: [
                Choice(choiceText: "하늘의 경고일 듯 하다.", nextPageIndex: 3,  endingScore: 0),
                Choice(choiceText: "그냥 잘못 본 거겠지.", nextPageIndex: 4,  endingScore: 0)
        ], questIdentifier: "", annotation: [Note(word: "전상", explanation: "전각이나 궁전의 위"), Note(word: "어좌", explanation: "임금의 자리")]),
        Page(storyText: "“우리에게 경고로 하여금 알리신 바가 하늘이 우리를 도우겠다는 말인지, 우리를 공격하겠다는 말인지는 우리가 어떻게 대처하느냐에 달려있겠구나.”", storyImage: nil, choice: [
                Choice(choiceText: "다음", nextPageIndex: 5,  endingScore: 0)
        ], questIdentifier: "", annotation: []),
        Page(storyText: "“참으로 기이한 일이구나. 잘못 본 건 아니더냐? 어찌 무지개가 이리저리 움직이겠느냐?”\n “소인도 그게 어떻게 가능한 일인지는 잘 모르겠습니다. 다만 그것이 천지의 뜻이 아닐까 싶습니다. 우리에게 무언가를 말해주는 듯하기도 하고요.”\n “들어보니 그럴듯하구나.”", storyImage: nil, choice: [
                Choice(choiceText: "다음", nextPageIndex: 5,  endingScore: 0)
        ], questIdentifier: "", annotation: []),
        Page(storyText: " ‘들어본 적이 있는 듯한 이야기와 익숙한 이 대화의 흐름은 대체 무엇인가?’", storyImage: nil, choice: [
                Choice(choiceText: "잘못 생각했겠지.", nextPageIndex: 6,  endingScore: 0),
                Choice(choiceText: "나 자신을 의심한다.", nextPageIndex: 7,  endingScore: 0)
        ], questIdentifier: "", annotation: []),
        Page(storyText: " 나는 내가 잘못 생각하고 있겠거니 했다. 하지만 어쩐지 어딘가 찜찜한 기운은 가시질 않았다.", storyImage: nil, choice: [
                Choice(choiceText: "", nextPageIndex: 666,  endingScore: 0)
        ], questIdentifier: "", endEpisodePage: true, annotation: []),
        Page(storyText: " “너, 이 이야기를 나와 한 적이 있느냐?”\n “아니요, 이번이 처음입니다만, 무슨 일인지요?”\n “한데 어찌 이리 익숙하단 말이냐. 내가 기억이 이상해 진 게 틀림없다. 의원을 봐야겠다. 어서 의원을 불러라. 어서!”\n “아, 예. 불러오겠습니다.”\n\n 내가 드디어 미친 건가 싶었다. 난생처음 겪는 일이니 도무지 원인을 알 방도가 없었다. 내가 그렇게 고민하고 있을 사이에 의원이 왔다.", storyImage: nil, choice: [
                Choice(choiceText: "다음", nextPageIndex: 8,  endingScore: 0)
        ], questIdentifier: "", annotation: []),
        Page(storyText: " “저하, 어디가 불편하신지요?”\n “기억이…..기억이…막 이상하구나. 처음 겪는 일인데도 이미 예전에 겪어본 것만 같아. 가끔 내가 왜 이 말을 하고 있지?라는 생각도 들어. 내가 미친 게냐?”\n “증상만 듣고는 소인은 잘 모르겠습니다. 제가 맥 좀 짚어보겠습니다.\n\n 침묵이 이어졌고, 이윽고 의원이 내게 말했다.\n\n “흠…이상합니다. 맥도 정상하고 아주 건강하십니다.”\n “그럼 내가 미쳤다는 말인 게냐?”\n “아..아닙니다.”\n “됐다. 물러가라.”\n\n 원인을 알 수 없는 이상한 증세에 나는 자꾸만 심기가 거슬렸다.\n\n “원인이라도 알 수 있으면 좀 좋을 터만..”", storyImage: nil, choice: [
                Choice(choiceText: "", nextPageIndex: 666,  endingScore: 0)
        ], questIdentifier: "chapter1quest2", endEpisodePage: true, annotation: [])
    ]


    let ep105 : [Page] = [
        Page(storyText: "\"전하, 세자 저하께서 문안 인사를 드리러 왔사옵니다. \n\"\"세자라니. 도대체 누가 세자란 말인가? 명나라의 황제의 승인을 받지 못한 자가 어찌 세자라고 불릴 수가 있는가? 어서 물러가라 하라.\" \n“저하, 전하께서…….”", storyImage: nil, choice: [Choice(choiceText: "문안 인사를 포기하고 그만 돌아간다.", nextPageIndex: 1,  endingScore: 0), Choice(choiceText: "끝까지 남아 기다린다.", nextPageIndex: 2,  endingScore: 0)], questIdentifier: "", endEpisodePage: false, annotation: []),
        //5-1
        Page(storyText: "“됐네. 이만 물러가겠소.”\n\n나는 다시 동궁으로 걸어갔다.\n\n‘전쟁 통에는 저를 방패로 내세우시더니, 이제는 자신을 향한 창이라 생각하시어 저를 버리시는 겁니까? 제가 이 나라를 살리기 위해, 아버지는 도망을 가셨어도 저는 끝까지 한양에 남아 지켰습니다. 명나라가 저를 세자로 보지 않아도, 전쟁 중에 저를 세자로 책봉하셨어도, 어찌 됐든 저는 조선의 ‘세자’요, 아버지의 아들이지 않습니까?’", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 3,  endingScore: 0)], questIdentifier: "", endEpisodePage: false, annotation: []),
        //5-2
        Page(storyText: "“아바마마께 전하거라. 받아주실 때까지 난 가지 않을 것이니.”\n\n전쟁 통에는 나를 방패로 내세우시더니, 이제는 아비를 향한 창이라 생각하시어 날 버리는 건가? 아버지께서 피란을 가실 때에도 난 끝까지 한양에 남아 나라를 지켰다. 감히 명이 나를 세자로 보지 않더라도, 전쟁 중에 어쩔 수 없이 나를 세자로 책봉하였어도, 어찌 됐든 난 조선의 ‘세자’이자 아버지의 아들이다. 아버지께서 이를 모르고 계신 건지, 모른 척하고 계신 건지 알 수가 없다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 3,  endingScore: 0)], questIdentifier: "", endEpisodePage: false, annotation: []),
        Page(storyText: "나는 크게 한숨을 들이쉬었다.\n\n‘그래. 어차피 이미 오래전에 겪어봤던 일인데 더 이상 상처받지 말자…….’\n\n……헉.\n\n나는 소스라치게 놀라 뒤로 자빠졌다.\n\n“저하, 괜찮으십니까? 이보게, 얼른 의원을 불러오너라. 저하, 제 목소리가 들리십…….”\n\n나는 계속해서 알 수 없는 일에 정신이 혼미해졌다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 4,  endingScore: 0)], questIdentifier: "", endEpisodePage: false, annotation: []),
        Page(storyText: "나는 크게 한숨을 들이쉬었다.\n\n‘그래. 어차피 이미 오래전에 겪어봤던 일인데 더 이상 상처받지 말자…….’\n\n……헉.\n\n나는 소스라치게 놀라 뒤로 자빠졌다.\n\n“저하, 괜찮으십니까? 이보게, 얼른 의원을 불러오너라. 저하, 제 목소리가 들리십…….”\n\n나는 계속해서 알 수 없는 일에 정신이 혼미해졌다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 5,  endingScore: 0)], questIdentifier: "", endEpisodePage: false, annotation: []),
        Page(storyText: "‘내가 방금 무어라 했던가? 이미 겪어봤던 일이라고? 아버지께 한 소리를 들어 내 잠시 미친 게 분명하구나. 아니지, 아니야. 아버지께서 날 내치시는 것이 한 두어 번이 아니니 무의식중에 나온 말일 게야…….’\n\n그렇게 깊은 혼란 속으로 빠져버렸고, 그대로 쓰러져 정신을 잃어버렸다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 0,  endingScore: 0)], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]

    let ep106 : [Page] = [
        Page(storyText: "“저하, 전하께서 재혼을 하신다고 하온데…….”\n“그게 무슨 소리인가?”\n\n갑자기 이게 무슨 말이지? 난 분명 동궁으로 가던 길에 쓰러졌을 텐데. 내가 어찌 이미 들어와 있는 것인지 도통 영문을 알 수 없었다. 내가 생각하지도 않은 말이 저절로 나와버리니 요즘 내가 많이 이상해진 건가 싶었다.\n\n“신하들이 저하의 책봉을 주청(奏請)* 할 것을 청하자 재혼을 하시겠다고 밝혔사옵니다.”\n\n나는 내 당혹스러움을 감출 수가 없었다.\n\n‘아버지께 문안 인사를 올린 날로부터 몇 날 며칠이 흐른 것인지 종잡을 수가 없구나. 내가 정말 미친 것인지에 대해 생각하는 것에도 갈피를 잡지를 못하겠는데, 아버지의 재혼 소식이라니.’", storyImage: nil, choice: [Choice(choiceText: "표정을 숨길 여유조차 없다.", nextPageIndex: 1,  endingScore: 0), Choice(choiceText: "덤덤하게 행동한다.", nextPageIndex: 2,  endingScore: 0), Choice(choiceText: "화를 낸다.", nextPageIndex: 3,  endingScore: 0)],  questIdentifier: "", endEpisodePage: false, annotation: [Note(word: "주청", explanation: "임금께 아뢰어 청하던 일")]),
        Page(storyText: "나는 생각이 많은 까닭에 굳은 표정을 숨길 여유조차 없었다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 0,  endingScore: 0)],  questIdentifier: "", endEpisodePage: true, annotation: []),
        Page(storyText: " 생각이 많아졌다. 엎친 데 덮친 격으로 아버지의 재혼 소식은 마치 내게 청천벽력 같은 소리였다. 잘못하다간 겨우 얻은 내 세자 자리가 까딱하면 사라지게 되는 것이다. 아버지는 결코 내게 온전한 세자 자리를 주고 싶지 않아 하시는 걸까. 나는 애써 놀란 표정을 감추고 덤덤하게 굴었다. 나를 무시하셔도, 난 여전히 그 자리에 있다는 것을 보여주기 위해서.", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: []),
        Page(storyText: "나는 화를 참을 수가 없었다.\n\n“무어라? 정녕 나를 세자로 온전히 인정하시지 않겠다는 말이 아닌가? 드디어 아버지께 인정을 받은 줄만 알았는데, 그것도 아니란 말인 건가. 난 도대체 아버지께 아들이 맞긴 한가? 너, 내가 세자로 보이긴 하느냐? 어? 얼른 바른대로 말하거라!”\n\n나는 눈 앞에 보이는 꽃병을 집어던졌다. 쨍그랑 소리와 함께 모두들 놀란 눈치였다. 나는 신하들이 눈치를 보든 말든 상관없었다. 그냥 그 상황 자체가 나에겐 지옥같았다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 4,  endingScore: 0)], questIdentifier: "chapter1quest3", endEpisodePage: false, annotation: []),
        Page(storyText: " “당연히 세자 저하 아니십니까? 전하께서도 그리 생각 하실 겁니다.”\n\n“지금 이 상황을 보고도 그리 말할 수가 있느냐? 너도 내가 만만한 거구나.”\n“예? 전혀 아닙니다.”\n\n내 안의 끓어오르는 분노가 느껴졌다. 심장으로부터 열이 나는 것이 생생하게 오감으로 느껴질 지경이었다. 내 몸은 화로 가득해 새빨갛게 변했다.\n\n“됐다. 더 이상 네놈들의 말을 듣고 싶지 않구나. 썩 꺼져라. 어서!”\n\n평소 같았으면 참을 수 있었는데 왜 오늘은 화를 억누를 수 없단 말인가. 나는 내 자신이 혼란스러웠다.", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]

    let ep107 : [Page] = [
        Page(storyText: "나는 불안한 생각을 멈출 수가 없었다.\n\n‘나는 어찌해야 할까. 밖으로는 명나라가 나를 세자로 임명할 수 없다고 하고, 안으로는 아버지가 나를 미워하시니……. 만일 새어머니께서 대군을 낳기라도 하시면 내 자리는 위험해지겠지.’", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]
    let ep108 : [Page] = [
        Page(storyText: " 내가 우려했던 일이 일어나고야 말았다. 소성대비가 대군을 낳은 것이다.\n\n‘영의정까지 대군의 편에 서 버렸단 말인가?’\n\n이곳에 자신의 편 하나 없다는 사실이 나를 더욱 조마조마하고 위태롭게 만들었다.", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]
    let ep109 : [Page] = [
        Page(storyText: " 머리를 식힐 겸 궁 내를 거닐고 있는데 한 시녀가 울고 있었다.\n\n“무슨 일이냐?”\n\n 시녀는 나를 쳐다보더니 놀라서 재빠르게 허리를 수그렸고, 떨리는 목소리로 말했다.\n\n“저…저하……. 아무 일도 아니 옵니다.”\n“아무 일도 아니라기엔 자네가 울고 있지 않는가?”\n“실은… 동궁 소속의 시녀라는 이유만으로 차별을 당하고 있사옵니다.”\n“그게 무슨 말이냐?”\n“동궁 소속의 시녀들은 모두 무시를 당하고 있사옵니다. 같은 시녀라고 할지라도 맞먹을 수 없다고 하온데….”\n“무시하는 자들은 누구이더냐?”\n“대부분의 궁 안의 자들이며, 심지어는 중궁전의 시녀들까지 기세등등하여 무시를 하고 있사옵니다.”", storyImage: nil, choice: [
                Choice(choiceText: "참는다", nextPageIndex: 1,  endingScore: 0),
                Choice(choiceText: "무시한 자들을 찾아가려고 한다", nextPageIndex: 2,  endingScore: 0)
        ], questIdentifier: "",  endEpisodePage: false, annotation: []),
        Page(storyText: "나는 크게 한숨을 쉬었다.\n\n“그래, 알았다. 어서 가 보거라.”\n“예.”\n\n 이제는 궁 안의 시녀들까지 나를 기어코 무시를 하는구나. 동궁 소속의 궁인들을 무시한다는 것은 곧 나를 무시하는 것과 다를 바가 없지 않은가?", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: []),
        Page(storyText: " “그래 알았다. 어서 가 보거라.”\n“예.”\n\n나는 내 뒤에 있던 신하에게 말했다.\n\n“누구인지 알아야겠다.”\n“알아서 무슨 일을 하시렵니까?”\n“당연히 벌을 내려야 하지 않겠는가? 아직 하늘은 푸르고 내가 이리 살아 있는데, 어찌 날 욕보인 자들을 살려 둘 수 있겠는가?”\n“아직은 자중하시지요, 저하. 전하께서도 그리 이야기를 하신지 얼마나 지나셨다고 그리하십니까? 저하께서 그런 나인들의 말 하나하나에 신경을 쓰시면, 그거야말로 저하께서 찔려서 벌을 내렸다는 더 큰 소문이 돌 것입니다. 아직은 성품을 온화하게 가지는 게 좋을 것 같습니다.”\n“네 말을 듣고 보니 그 말도 일리가 있구나. 내가 여기서 참는 것이 더 좋은 결과를 가지고 오면 좋겠는데.”", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]
    let ep110 : [Page] = [
        Page(storyText: " 아버지께 문안 인사를 드리러 동궁 밖으로 나오는데 내인 하나가 급히 말을 전했다.\n\n“지금 전하의 병환이 위급하십니다.”\n\n 나는 말을 듣자마자 수레에서 내려 급히 달려갔다. 약방 내의원들이 입시하고 말을 전하는 내관과 약을 가진 의관들이 침실 밖 대청에 많이 들어와 있었다.\n 정신을 차리지 못하는 아버지를 보니 가슴이 철렁하고 심장이 마구 뛰었다. 이때의 마음은 도대체 무엇이었을지 아직도 깨닫지 못했다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 1,  endingScore: 0)], questIdentifier: "", endEpisodePage: false, annotation: []),
        Page(storyText: "아버지께서 일어나질 못하시고 의식이 들지 않으시니, 청심원, 소합원, 강즙 등 약을 번갈아 올렸다. 잠시 뒤, 아버지의 기력이 조금 안정이 되었다. 아버지는 의식을 차리시자마자\n\n“이게 어찌 된 일인가, 어찌 된 일이야.”\n\n 라고 소리치셨다. 나는 손을 저어 좌우를 나가게 하였다. 이에 약방 도제조 이하가 합문 안으로 물러나 대령했다.", storyImage: nil, choice: [Choice(choiceText: "", nextPageIndex: 1,  endingScore: 0)], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]
    let ep111 : [Page] = [
        Page(storyText: " 의관들이 아버지의 증세는 한기가 밖에서 엄습하여 그렇게 된 것이라고 하였다. 오늘은 날씨가 몹시 추우니 한기가 없는 곳에서 정사를 보시면서 몸을 보살피며 치료받는 것이 좋겠다고 하였다.", storyImage: nil, choice: [Choice(choiceText: "", nextPageIndex: 1,  endingScore: 0)], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]
    let ep112 : [Page] = [
        Page(storyText: "나는 아버지 곁에서 병시중을 하였다.", storyImage: nil, choice: [
                Choice(choiceText: "아버지께 죄송한 마음이 든다.", nextPageIndex: 1,  endingScore: 0),
                Choice(choiceText: "아버지께 죄책감이 들지 않는다.", nextPageIndex: 2,  endingScore: 0)
        ], questIdentifier: "", endEpisodePage: false, annotation: []),
        
        Page(storyText: " ‘영창대군은 열 살 남짓하고, 지금 아버지께서 돌아가시면 내가 왕이 되는 것이 아닌가?’\n\n 이런 생각을 하게 만든 아버지가 원망스럽기도, 이런 생각을 하고 있는 것이 죄송스럽기도 하였다. 나는 감히 아버지를 죽일 용기가 없었고, 불효자가 되기도 싫었다. 이런 내 마음이 원망에서 그치길 바랐다.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 3,  endingScore: 0)], questIdentifier: "", endEpisodePage: false, annotation: []),
        Page(storyText: " ‘지금 영창대군은 열 살 남짓한데, 지금 아버지께서 돌아가시면 내가 왕이 되는 것 아닌가?’\n\n 참 시기 적절하다. 내 불안한 세자 자리가, 아버지의 위태로움에 더 단단해지는 듯했다. 우스웠다. 한 나라의 왕도 병 앞에서는 어쩔 줄 모르는구나.\n\n 난 세자가 되고 싶다. 그 누구도 의심하지 않는 세자가 되고 싶다. 그럼 비로소 내가 왕이 될 것이니.", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 3,  endingScore: 0)], questIdentifier: "", endEpisodePage: false, annotation: []),
        Page(storyText: " 아버지께서는 내가 죽기 만을 바라시는 걸까?", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]
    let ep113 : [Page] = [
        Page(storyText: " 하나 유영경은 이 명령은 여러 사람의 뜻밖에 나온 것이므로 신은 결코 받들 수 없다고 또다시 반대를 하였다.\n\n 궁 내에 이런 떠들썩한 소식이 내게 들리지 않을 리가 있겠는가. 이 소식을 들은 나는…", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 1,  endingScore: 0)], questIdentifier: "", endEpisodePage: false, annotation: []),
        Page(storyText: " 머리를 식힐 겸 궁 내를 거닐고 있는데 한 시녀가 울고 있었다.\n\n“무슨 일이냐?”\n\n 시녀는 나를 쳐다보더니 놀라서 재빠르게 허리를 수그렸고, 떨리는 목소리로 말했다.\n\n“저…저하……. 아무 일도 아니 옵니다.”\n“아무 일도 아니라기엔 자네가 울고 있지 않는가?”\n“실은… 동궁 소속의 시녀라는 이유만으로 차별을 당하고 있사옵니다.”\n“그게 무슨 말이냐?”\n“동궁 소속의 시녀들은 모두 무시를 당하고 있사옵니다. 같은 시녀라고 할지라도 맞먹을 수 없다고 하온데….”\n“무시하는 자들은 누구이더냐?”\n“대부분의 궁 안의 자들이며, 심지어는 중궁전의 시녀들까지 기세등등하여 무시를 하고 있사옵니다.”", storyImage: nil, choice: [Choice(choiceText: "심정이 참담하다.", nextPageIndex: 2,  endingScore: 0), Choice(choiceText: "헛웃음만 나오는 이 상황이 재미있다.", nextPageIndex: 3,  endingScore: 0)], questIdentifier: "", endEpisodePage: false, annotation: []),
        Page(storyText: " 지금 내 심정은 참담하기 그지없다.\n\n 아무리 영창대군의 편에 선 자라고 할지라도 엄연히 세자가 있는데도 이리 대놓고 반대를 한다니. 나는 그저 ‘세자’라는 이름만 가진 꼭두각시일 뿐이란 말인가? 나는 여전히 이곳에 홀로 고립되어 있다.", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: []),
        Page(storyText: " 대비께서 대군을 낳으시고 내 편엔 아무도 남지 않은 이 상황이 그저 웃기고 어이가 없었다. 난 미친 사람처럼 웃었다. 난 그저 ‘세자’라는 이름만 가진 꼭두각시였다는 사실이 이렇게 뼈 시리게 느껴졌고, 가슴이 욱신거렸다. 가뜩이나 쓸쓸한 이곳이 곱절은 더 외롭게만 느껴졌다. 한참을 웃고 나니 더 가슴이 시렸다.", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]
    let ep114 : [Page] = [
        Page(storyText: " 아버지가 쓰러진 날로부터 두어 달이 지났을까. 정인홍의 상소가 한 통 올라왔다.\n\n“신이 듣건대 지난 10월 전하께옵서 전섭의 전교를 내리자 영의정 유영경이 원임 대신(전 정승)들을 꺼려 시임 대신(현 정승)들과 공모하였으며, 중궁전에서 언서로 전지를 내리자 ‘오늘의 전교는 뭇사람의 뜻밖에 나온 것이어서 명을 받지 못하겠다’라고 즉시 회계하여 대신들로 하여금 알지 못하게 하였고, 영경은 무슨 음모화 흉계가 있기에 이토록 비밀리에 하는 것입니까?…… 원임 대신을 멀리하고, 여러 사람의 뜻 밖에 나온 전교라고 한 까닭은 대체 무엇이옵니까? 영경이 세자 저하를 세자로 보긴 하시옵니까?”", storyImage: nil, choice: [Choice(choiceText: "다음", nextPageIndex: 1,  endingScore: 0)],  questIdentifier: "", endEpisodePage: false, annotation: []),
        Page(storyText: " 상소에 대해 아버지는\n\n“정인홍이 세자로 하여금 속히 전위를 받게 하려고 하였으니 그 스스로 모의한 것이 세자에게 충성을 다하는 것이라고 여겼겠지만 실은 불충함이 극심하다. 세자는 반드시 천자의 명을 받은 뒤에 비로소 세자라고 할 수 있다. 지금 세자는 책명을 받지 못했으니 이는 천자도 허락하지 않은 것이고 천하도 알지 못한다.”\n 라고 하셨다. 나는 그 소식을 듣고 인정전으로 달려갔다.", storyImage: nil, choice: [Choice(choiceText: "죽으려고 해도 마음대로 죽지도 못했습니다.", nextPageIndex: 2,  endingScore: 0), Choice(choiceText: "제가 어찌하면 세자로 인정을 하시렵니까?", nextPageIndex: 3,  endingScore: 0)], questIdentifier: "", endEpisodePage: false, annotation: []),
        Page(storyText: " “아바마마, 지난번 갑자기 전위하라는 명을 내리시니 신은 죽으려 해도 죽을 수가 없었나이다.”\n\n 책명을 받지 못한 나는 세자가 될 수 없다. 조정에는 내 편이 없다. 아버지마저 나를 미워하신다. 이런 곳에서 홀로 버틸 수밖에 없는 내가 초라하고 비참하게만 느껴졌다.", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: []),
        Page(storyText: " “천자가 허락을 하지 않았어도, 아바마마께서는 인정을 해주실 수 있지 않습니까? 지난번 갑자기 세자로 저를 임명을 하라는 명을 내리시니 신은 죽으려고 해도 죽을 수가 없었나이다. 제가 어찌하면 되겠습니까? 제가 죽으면 그제서야 인정을 하실 겁니까? 신이 도대체 어찌하면 세자로 인정을 하실 겁니까?”\n\n 나는 울부짖었다. 책명 받지 못한 나는 세자가 될 수 없다. 조정도, 아버지도 내 편이 아니다. 이런 곳에서 홀로 버텨야 하는 나 자신이 너무 초라하게만 느껴졌다.", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]
    let ep115 : [Page] = [
        Page(storyText: " 빗방울이 보슬보슬 떨어지던, 잠 못 들던 새벽, 나는 침전을 나와 돌계단에 걸터 앉았다. 머리가 축축해지고, 온몸이 젖어 으슬으슬 해지는 게 느껴졌다. 그러던 찰나에, 갑자기 목소리가 들렸다.\n\n‘어차피 네 아비는 곧 죽는다. 대군은 왕위를 이을 수 없어. 네가 왕이 될 것이야.’", storyImage: nil, choice: [Choice(choiceText: "누구냐고 소리친다.", nextPageIndex: 1,  endingScore: 0), Choice(choiceText: "무시한다.", nextPageIndex: 2,  endingScore: 0)], questIdentifier: "", endEpisodePage: false, annotation: []),
        Page(storyText: " 놀란 나는 벌떡 일어나서 소리쳤다.\n\n“누구냐!”\n\n 주위를 둘러보아도 아무도 없었다. 내 귓가에 목소리가 자꾸만 맴돌았다. 여자도, 남자도 아닌 목소리가 머리를 띵하게 만들었다.\n\n‘아버지께서 곧 돌아가신다니. 그게 무슨 말도 안 되는 소리인가?’", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: []),
        Page(storyText: " 내가 잘못 들은 거겠지 하며 무시했다. 그러나 잠시 뒤, 또 소리가 들렸다.\n\n‘안심해. 네 아비의 총애를 받지 않아도 넌 왕이 될 수 있어. 대군이 다 크기 전, 아마 네 아비는 곧 죽을 거다.’\n\n 놀란 나는 벌떡 일어났다. 주위를 둘러보아도 아무도 없었다. 내 귓가에 목소리가 자꾸만 맴돌았다. 여자도, 남자도 아닌 목소리가 머리를 띵하게 만들었다.\n\n‘아버지께서 곧 돌아가신다니. 그게 무슨 말도 안 되는 소리인가?’", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]
    let ep116 : [Page] = [
        Page(storyText: " 궁 내에 울려 퍼지는 통곡의 울음소리. 아버지께 서 승하하셨다.\n\n‘설마 그 목소리의 말이 맞았다니. 그건 환청이 아니라 예언이었던 것인가? 아, 그럼 이제 내가 왕인 것인가?’\n 나는 지금 이 순간 기뻐해야할지, 슬퍼해야할지 혼란스러웠다.", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]
    let ep117 : [Page] = [
        Page(storyText: " 아버지를 잃은 슬픔에서 나올 틈도 없이 즉위식이 거행되었다. 서러움에 갇힌 세자의 삶에서 벗어나 이제서야 겨우 왕이 되었는데, 나에겐 너무나도 익숙한 느낌이었다.", storyImage: nil, choice: [], questIdentifier: "", endEpisodePage: true, annotation: [])
    ]

var prologue: Chapter = Chapter(episodes: [ep001, ep002], quests: [], chapterNumber: 0, chapterName: "프롤로그 챕터 이름", chapterIllust: "chapter1Illust", chapterChoice: [Choice(choiceText: "나는 현실에 수긍한다.", nextPageIndex: 0, endingScore: 1),Choice(choiceText: "나는 현실을 부정하며 받아들이지 못한다.", nextPageIndex: 1, endingScore: 5)])
var chapter1: Chapter = Chapter(episodes: [ep101, ep102, ep103, ep104, ep105, ep106, ep107, ep108, ep109, ep110, ep111, ep112, ep113, ep114, ep115, ep116, ep117], quests: [
                                        Quest(questName: "임진강 나루에 도착하기", questClearJoGeun: ["chapter1quest1"], reward: 5),
                                        Quest(questName: "의원에게 진찰받기", questClearJoGeun: ["chapter1quest2"], reward: 5),
                                        Quest(questName: "꽃병을 집어 던지기", questClearJoGeun: ["chapter1quest3"], reward: 10)],chapterNumber: 1, chapterName: "1장 챕터 이름", chapterIllust: "chapter1Illust", chapterChoice: [])
