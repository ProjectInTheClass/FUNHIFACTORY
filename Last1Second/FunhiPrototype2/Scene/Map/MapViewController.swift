//
//  MapViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/08/15.
//

import UIKit

class MapViewController: UIViewController {

  @IBOutlet weak var mapImage: UIImageView!
  @IBOutlet var spotButtons: [MapPlaceButton]!
  
  var buttonIndex = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.transitioningDelegate = self
    setupButtons()
    setupCurrentButton()
  }
    
  func setupCurrentButton() {
    switch currentEpisode().episodePlace {
    case "돈화문":
      updateCurrentButton(index: 0)
    case "현재" :
      updateCurrentButton(index: 0)
    default:
        print("에피소드의 위치를 찾을 수 없음. 오류")
    }
  }

  private func updateCurrentButton(index: Int) {
    spotButtons.forEach { $0.isSelected = false }
    spotButtons[index].isSelected = true
  }
  
  private func setupButtons() {
    guard spotButtons.count == spotsName.count else { print("'error: buttons.count != spotsName.count'"); return}
    spotButtons.enumerated().forEach { index, button in
      let name = spotsName[index].number + " " + spotsName[index].name
      button.button.setTitle(name, for: .normal)
      button.button.index = index
      button.button.addTarget(self, action: #selector(openDetail(_:)), for: .touchUpInside)
    }
  }
  
  @objc func openDetail(_ sender: MapButton) {
    guard let vc = storyboard?.instantiateViewController(identifier: "imageViewer") as? ImageViewerViewController else {return}
    vc.currentSpotData = spotsName[sender.index ?? 0]
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true, completion: nil)
  }
  
  @IBAction func goBack(_ sender: Any) {
      dismiss(animated: true, completion: nil)
  }
  
  let spotsName : [Spots] = [
    Spots(number: "①", name: "돈화문", images: ["donhwamun1", "donhwamun2", "donhwamun3", "donhwamun4", "donhwamun5", "donhwamun6", "donhwamun7", "donhwamun8", "donhwamun9"], description: "돈화문은 창덕궁의 정문으로, 보물 제383호로 지정되어 있다.\n1412년(태종 12)에 건립된 돈화문은 궁궐 대문 중에서 가장 큰 규모이자 현존하는 궁궐 대문 중에서 가장 오래된 목조 건물이다.\n임진왜란 때 소실되어 광해군이 즉위한 뒤 1609년에 다시 재건되었다.\n\n돈화문의 ‘돈화(敦化)’는 ‘임금이 큰 덕을 베풀어 백성들을 돈독하게 교화 한다’는 뜻이다.\n이는 유학 경전 중 하나인 [중용(中庸)]에 나오는 표현을 확장시킨 것이다."),
  
     Spots(number: "②", name: "금천교", images: ["geumcheongyo1", "geumcheongyo2", "geumcheongyo3", "geumcheongyo4", "geumcheongyo5", "geumcheongyo6", "geumcheongyo7", "geumcheongyo8"], description: "금천교는 창덕궁의 돈화문과 진선문 사이를 지나가는 명당수에 위에 설치된 돌다리로, 보물 제1762호로 지정되어 있다.\n창덕궁이 창건되고 6년 후 1411년(태종 11)에 설치되었다.\n여러 번의 화재와 전쟁에도 불구하고 금천교는 창건 당시의 모습을 보존하고 있으며, 현존하는 궁궐의 돌다리와 서울에 남아있는 돌다리 중 가장 오래되었다.\n\n\n궁궐의 위엄을 보여주는 상징적인 조각상들과 아름다운 문양, 견고하고 장중한 축조 기술 등이 돋보이는 다리로서 역사적, 예술적, 건축적 가치가 뛰어나다."),
  
     Spots(number: "③", name: "인정전", images: ["injeongjeon1", "injeongjeon2", "injeongjeon3", "injeongjeon4", "injeongjeon5", "injeongjeon6", "injeongjeon7", "injeongjeon8", "injeongjeon9"], description: "인정전은 창덕궁의 정전으로서 국가의 중요한 의식을 치르던 곳으로, 국보 225호로 지정되어 있다.\n인정전의 앞으로는 의식을 치르는 마당인 조정이 펼쳐져있고, 뒷편으로는 북한산이 위치해있다.\n광해군 때 중건하였고, 1803년(순조 11)에 일어난 화재로 다시 재건하였고, 1857년(철종 8)에 한 보수공사 이후 지금 현재 모습을 갖추었다.\n인정전의 ‘인정(仁政)’은 ‘어진 정치’라는 뜻을 가지고 있다.\n\n\n인정전 내부는 유리창을 비롯해 전구나 커튼 등 다양한 서양 장신구가 설치되어있다. 구한말 외국과의 수교를 통해 외래 문물이 들어왔는데, 1907년 순종이 덕수궁에서 창덕궁으로 거처를 옮겼고 그에 따라 인정전의 실내바닥이 전돌에서 마루로 바뀌고 전구가 설치되는 등의 변화가 일어나게 되었다."),
  
     Spots(number: "④", name: "궐내각사", images: ["government_office1", "government_office2","government_office3"], description: "궐내각사는 왕과 왕실을 가까이에서 보좌하기 위해 특별히 궁궐 내에 세운 관청들이다.\n금천을 기준으로 동쪽에 약방, 홍문관(옥당), 예문관이, 서쪽에 내각(규장각), 봉모당, 대유재, 소유재 등이 자리하고 있었다.\n하지만 일제강점기 때 규장각, 대유재, 소유재는 단순 도서관으로 기능이 변했다가, 소장 도서들을 다른 곳으로 옮기면서 규장각과 봉모당 등 모든 궁궐 전각들이 헐리고 도로와 잔디밭으로 변해 버렸다.\n현재 있는 건물들은 2000년~2004년에 걸쳐 복원된 모습이다."),
  
     Spots(number: "⑤", name: "선정전", images: ["seonjeongjeon1", "seonjeongjeon2", "seonjeongjeon3", "seonjeongjeon4", "seonjeongjeon5", "seonjeongjeon6", "seonjeongjeon7", "seonjeongjeon8", "seonjeongjeon9"], description: "선정전은 임금이 고위직 신하들과 함께 일상 업무를 보던 공식 집무실인 편전으로, 보물 제814호로 지정되어 있다.\n아침의 조정회의, 업무 보고, 경연 등 각종 회의가 이곳에서 열렸다.\n‘정치는 베풀어야 한다’는 뜻을 가진 선정전은 1461년(세조 7)에 바뀐 이름으로, 창건 당시에는 조계청이라 불리었다.\n임진왜란과 인조반정 등의 화재로 소실되었다가 1647년(인조 25)에 인경궁을 헐어 그 재목으로 재건하였다.\n현재 궁궐에 남아 있는 유일한 청기와 건물이다."),
  
     Spots(number: "⑥", name: "희정당", images: ["huijeongdang1", "huijeongdang2", "huijeongdang3", "huijeongdang4", "huijeongdang5", "huijeongdang6", "huijeongdang7", "huijeongdang8"], description: "본래 침전으로 사용하다가, 조선 후기부터 왕의 집무실로 사용된 희정당은 보물 제815호로 지정되어 있다.\n1496년(연산 2)에 숭문당이라는 건물이 소실되었고, 다시 재건하면서 이름을 희정당이라고 부르게 되었다.\n이후에도 몇 차례 화재로 다시 지었는데 현재 건물은 일제강점기 때 1917년에 불 탄 것을 경복궁의 침전인 강녕전을 헐어서 1920년에 지은 것이다.\n구한말 왕의 집무실과 외국 사신들을 접대하는 곳으로 사용하면서 희정당 내부에는 카펫, 유리 창문, 샹들리에 등이 설치하여 서양식으로 변화하였다."),
  
     Spots(number: "⑦", name: "대조전", images: ["daejojeon1", "daejojeon2", "daejojeon3", "daejojeon4", "daejojeon5", "daejojeon6", "daejojeon7", "daejojeon8", "daejojeon9"], description: "대조전은 왕비가 거처하는 건물 중 가장 으뜸으로, 보물 제816호로 지정되어 있다.\n1917년에 불 타 없어진 터에 1920년에 경복궁의 침전인 교태전을 옮겨 지어 현재 대조전이 되었다.\n희정당과 마찬가지로, 내부는 서양식이며, 왕실 생활의 마지막 모습이 비교적 잘 보존되어 있다.\n대조전 주변을 에워싼 부속 건물 중 하나인 흥복헌은 1910년 마지막 어전 회의를 열어 경술국치가 결정된 비극적인 현장이다."),
  
     Spots(number: "⑧", name: "낙선재", images: ["nakseonjae1", "nakseonjae2", "nakseonjae3", "nakseonjae4", "nakseonjae5", "nakseonjae6", "nakseonjae7", "nakseonjae8", "nakseonjae9", "nakseonjae10", "nakseonjae11"], description: "현종의 검소한 면모가 잘 느껴지는 낙선재는 보물 제1764호로 지정되어 있다.\n1847년 헌종이 왕비와 대왕대비를 위해 마련한 곳으로, 조선 왕실의 권위를 확립하고 자신의 개혁 의지를 실천하기 위한 장소로 사용했다.\n낙선재는 궁궐의 침전 형식이 응용되면서 다른 곳에서는 쉽게 찾아볼 수 없는 다양한 문양의 장식들을 볼 수 있다."),
  
     Spots(number: "⑨", name: "부용지", images: ["buyongji1", "buyongji2", "buyongji3", "buyongji4", "buyongji5", "buyongji6"], description: "후원의 첫 번째 중심 정원인 부용지는 사각형 모양의 연못이다.\n부용지를 중심으로 휴식과 학문적 용도로 쓰인 아름다운 건물들이 모여있다.\n연꽃이 활짝 핀 모양의 부용정은 연못에 핀 한 송이의 꽃 형상으로 보물 제1763호로 지정되어 있다.\n높은 곳에서 연못을 내려다보는 주합루는 학문을 연마하던 곳으로 보물 제1768호로 지정되어 있다.\n건물 하나하나 모두 각각 특색있고 아름답지만, 서로 어우러지면서 풍경이 되는 것이 절묘한 경관이다."),
  
     Spots(number: "⑩", name: "불로문", images: ["bullomun1","bullomun2"], description: "연경당 입구에 서 있는 불로문은 이 문을 통과하면 늙지 않는다는 설이 있다. 이는 왕의 무병 장수를 기원하기 위해 만들어졌다."),
  
     Spots(number: "⑪", name: "애련지", images: ["aeryeonji1", "aeryeonji2", "aeryeonji3"], description: "1692년(숙종 18)에 연못 가운데 섬을 쌓고 정자를 지었다고 하지만, 지금 그 섬은 없고 정자만 연못 북쪽 끝에 걸쳐 있다.\n숙종은 ‘내 연꽃을 사랑함은 더러운 곳에 처하여도 맑고 깨끗하여 은연히 군자의 덕을 지녔기 때문이다’라고 하여 이 정자에 ‘애련(愛蓮)’이라는 이름을 붙였고, 이 연못은 애련지가 되었다."),
  
     Spots(number: "⑫", name: "연경당", images: ["yeongyeongdang1", "yeongyeongdang2", "yeongyeongdang3", "yeongyeongdang4", "yeongyeongdang5", "yeongyeongdang6", "yeongyeongdang7", "yeongyeongdang8", "yeongyeongdang9", "yeongyeongdang10", "yeongyeongdang11", "yeongyeongdang12"], description: "사대부의 살림집을 본뜬 조선 후기 접견실인 연경당은 보물 제1770호로 지정되어 있다.\n연경당의 ‘연경(演慶)’은 경사가 널리 퍼진다는 뜻이다.\n연경당은 효명세자가 순조와 순원왕후를 위한 잔치를 열고자 지은 집니다. 창건 직후 이곳에서는 효명세자가 신하를 접견하거나 연회를 펼쳤다. 헌종 이후 효명세자의 어진과 모훈을 보관하는 곳으로 사용하다가 고종 때에 이르러 외국 공사를 접견하고 연회를 베푸는 중요한 정치 공간으로 이용하였다.\n유교적 철학과 궁전의 조영법식이 어우러져 건축된 연경당은 조선시대 궁궐 내 사대부 건축으로서 그 가치가 매우 뛰어나다."),
  
    Spots(number: "⑬", name: "폄우사", images: ["pyeomusa1", "pyeomusa2", "pyeomusa3"], description: "반월지 연못의 서쪽 언덕 위에 위치한 길쭉한 맞배지붕 형태를 가진 폄우사는 본래 부속채가 딸린 ‘ㄱ’자 모양이었으나 현재는 부속채가 없어져 단출한 모습을 갖추게 되었다."),
  
     Spots(number: "⑭", name: "존덕정", images: ["jondeokjeong1", "jondeokjeong2"], description: "반월지 연못을 중심으로 겹지붕의 육각형 정자인 존덕정은 조선 건축의 색다른 구상과 재주를 보여주는 중요한 건물이다."),
  
     Spots(number: "⑮", name: "옥류천", images: ["ongnyucheon1", "ongnyucheon2", "ongnyucheon3"], description: "옥류천은 후원 북쪽 가장 깊은 골짜기에 흐른다.\n1636년(인조 14)에 거대한 바위인 소요암을 깎아내고 그 위에 홈을 파서 작은 폭포를 만들었다.\n바위에 새겨진 '玉流川' 세 글자는 인조의 친필이다.")]
}

extension MapViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      if mapPresentFromLeft {
        return AnimationController(animationDuration: 0.4, animationType: .GoDownPresent)
      } else {
        return AnimationController(animationDuration: 0.4, animationType: .GoRightPresent)
      }
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      if mapPresentFromLeft {
        return AnimationController(animationDuration: 0.4, animationType: .GoUpDismiss)
      } else {
        return AnimationController(animationDuration: 0.4, animationType: .GoLeftDismiss)
      }
        
    }
}
