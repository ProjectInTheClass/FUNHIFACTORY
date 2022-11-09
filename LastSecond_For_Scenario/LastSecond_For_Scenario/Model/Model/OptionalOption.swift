//
//  OptionalOption.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation

struct OptionalOption: Codable {
  let achievementToUnlock: AchievementID?
  let infomationToUnlock: InfomationID?
  let gameCharacterToUnlock: GameCharacterID?
  let caseToUnlock: NoteCaseID?
  let albumImageToUnlock: AlbumImageID?
  let checkPointToUnlock: CheckPointID?
  let arContent: ArId?
}

extension OptionalOption {
  
  init(achieve : AchievementID?, inform : InfomationID?, gamecharacter : GameCharacterID?, cases : NoteCaseID?, album : AlbumImageID?, check : CheckPointID?, ar : ArId?) {
      achievementToUnlock = achieve
      infomationToUnlock = inform
      gameCharacterToUnlock = gamecharacter
      caseToUnlock = cases
      albumImageToUnlock = album
      checkPointToUnlock = check
      arContent = ar
  }
  
  init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
  
      achievementToUnlock = (try? values.decode(AchievementID.self, forKey: .achievementToUnlock)) ?? .none
      infomationToUnlock = (try? values.decode(InfomationID.self, forKey: .infomationToUnlock)) ?? .none
      gameCharacterToUnlock = (try? values.decode(GameCharacterID.self, forKey: .gameCharacterToUnlock)) ?? .none
      caseToUnlock = (try? values.decode(NoteCaseID.self, forKey: .caseToUnlock)) ?? .none
      albumImageToUnlock = (try? values.decode(AlbumImageID.self, forKey: .albumImageToUnlock)) ?? .none
      checkPointToUnlock = (try? values.decode(CheckPointID.self, forKey: .checkPointToUnlock)) ?? .none
      arContent = (try? values.decode(ArId.self, forKey: .arContent)) ?? .none
  }
}
