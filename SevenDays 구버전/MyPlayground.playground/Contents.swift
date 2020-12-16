import Foundation
import UIKit
var ex = 0

func loop(){
    print("루프함수 시작")
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {timer in
        print("타이머 시작")
        ex+=1
        if ex == 10 {
            timer.invalidate()
            print("루프 종료")
            return
        }
        print("타이머 바디의 마지막 부분")
    })
    print("함수 마지막 부분")
}

loop()
