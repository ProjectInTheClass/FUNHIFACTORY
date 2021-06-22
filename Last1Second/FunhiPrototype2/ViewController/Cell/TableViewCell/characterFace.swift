//
//  characterFace.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/06/16.
//

import Foundation

func findFaceImage(nickname:GameCharacterID, profile:CharacterFace, normalProfile : String) -> String
{
    if nickname == .danhee{
        switch profile {
        case .angry1: return "prolog danhee angry 1"
        case .angry2: return "prolog danhee angry 2"
        case .basic:   return "prolog danhee basic"
        case .basictalk: return "prolog danhee basic talk"
        case .cry1: return "prolog danhee cry 1"
        case .cry2: return "prolog danhee cry 2"
        case .happy1:  return "prolog danhee happy 1"
        case .happy2:   return "prolog danhee happy 2"
        case .happy3:   return "prolog danhee happy 3"
        case .sad1:  return "prolog danhee sad 1"
        case .cryangry1: return "prolog danhee sad&angry 1"
        case .cryangry2: return "prolog danhee sad&angry 2"
        case .scared:   return "prolog danhee scared"
        case .straight: return "prolog danhee straight"
        case .surprise1:   return "prolog danhee surprise 1"
        case .surprise2:    return "prolog danhee surprise 2"
        default :
            return "none"
        }
    }
    else if nickname == .hwiryeong{
            switch profile {
            case .angry1: return "hwiryeong angry 1"
            case .angry2: return "hwiryeong angry 2"
            case .angry3: return "hwiryeong angry 3"
            case .angry4: return "hwiryeong angry 4"
            case .basic:   return "hwiryeong basic"
            case .basictalk: return "hwiryeong basic talk"
            case .cry1: return " hwiryeong cry"
            case .happy1:  return "hwiryeong happy 1"
            case .happy2:   return "hwiryeong happy 2"
            case .sad1:  return "hwiryeong sad"
            case .straight: return "hwiryeong straight"
            case .surprise1:   return "hwiryeong surprise 1"
            case .surprise2:   return "hwiryeong surprise 2"
            default : return "none"
            }
    }
    else if nickname == .tourguide{
            switch profile {
            case .basictalk: return "guide basic talk"
            case .basic: return "guide basic"
            case .happytalk: return "guide happy talk"
            case .happy1: return "guide happy"
            default : return "none"
        }
    }
    else if nickname == .teacher{
        switch profile {
        case .angry1: return "teacher angry 1"
        case .angry2: return "teacher angry 2"
        case .basic: return "teacher basic"
        case .basictalk: return "teacher basic talk"
        case .happy1: return "teacher happy"
        default:
            return "none"
        }
    }
    else{
        return normalProfile
    }
}
