import UIKit
import Foundation


//선택은 캐릭터의 친밀도에 영향을 준다. 또는 스토리의 흐름에 변화를 주기도 함.
struct Choice{
    let choiceText : String
    let nextTextIndex : Int //다음 텍스트 불러오기
    let targetFollower : Follower?   //호감도를 줄 대상
    let like : Int?  //선택지에 따른 호감도 양
}

struct Chat {
    let text : String
    let image : String?
    let choice : [Choice]
    let characterFace : Bool   //톡에서 얼굴이 나올때도 있고, 그냥 톡만 올라올 때도 있으니까.
    //업적이나 일러스트 식별자는 구현 여부에 따라 다를 듯.
}

struct GameCharacter {
    //티켓은 안 넣어도 될 것 같다.
}

struct Setting{
    var bgm : Int
    var effectSound : Int
    var textSpeed : Int //터치 안해도 자동으로 넘어가는 때가 있는데 그때를 말하는 듯.
    //언어는 시간상 구현하기 힘들 듯.
}

struct Follower{
    let name : String
    let profileImage : String
    let backGroundImage : String
    let liking : Int
    //캐릭터 추가설명 구현 여부?
        //힐데 편지가방 등.
}
