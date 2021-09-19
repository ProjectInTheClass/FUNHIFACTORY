//
//  StringExtension.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/19.
//

import UIKit

extension String {
  var postPositionText: String {
    guard let lastText = last else { return self }     // 글자의 마지막 부분을 가져옴
    
    let unicodeVal = UnicodeScalar(String(lastText))?.value // 유니코드 전환
    
    guard let value = unicodeVal else { return self }

    if (value < 0xAC00 || value > 0xD7A3) { return self }   // 한글아니면 반환

    let last = (value - 0xAC00) % 28                        // 종성인지 확인

    let str = last > 0 ? "은..." : "는..."      // 받침있으면 은 없으면 는 반환
    
    return self + str
  }
}

