//
//  TitleCoverViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/30.
//

import UIKit
import AVFoundation
import Gifu
import Alamofire

class TitleCoverViewController: UIViewController {
  
  @IBOutlet weak var startButton: SoundButton!

  override func viewDidLoad() {
    super.viewDidLoad()
  }
 
  @IBAction func startAction(_ sender: Any) {
  }
}



enum EpisodeRouter: URLRequestConvertible {
  
  var url: URL {
    return .init(string: "https://api.github.com/repos/ProjectInTheClass/FUNHIFACTORYGameData/git/trees/master?recursive=1")!
  }
  
  case episodes
  
  var method: HTTPMethod {
    switch self {
    case .episodes:
      return .get
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    var request = URLRequest(url: url)
    request.method = method
    return request
  }
}

struct EpisodesResDto: Decodable {
  let tree: [EpisodeName]
  
  func toModel() -> EpisodesRes {
    return EpisodesRes(names: tree.map { CompactEpisode(fileName: $0.path, story: nil) })
  }
}

struct EpisodesRes: Decodable {
  let names: [CompactEpisode]
}

struct CompactEpisode: Decodable {
  let fileName: String
  var story: [BlockOfDayEpisode]?
  
  mutating func loadStory() async {
    let result = await AF.request(EpisodeDetailRouter.episode(fileName))
      .serializingDecodable([BlockOfDayEpisodeForJson].self).result

    switch result {
    case let .success(res):
      story = res.map { $0.toBlockOfDayEpisode() }
    case .failure(let error):
      ()
    }
  }
  
  func toEpisode() -> Episode {
    var episode = Episode(storyBlocks: story ?? [])
    episode.fileName = fileName
    return episode
  }
}

struct EpisodeName: Decodable {
  let path: String
}


enum EpisodeDetailRouter: URLRequestConvertible {
  
  var url: URL {
    return .init(string: "https://raw.githubusercontent.com/ProjectInTheClass/FUNHIFACTORYGameData/master")!
  }
  
  case episode(String)
  
  var method: HTTPMethod {
    switch self {
    case .episode:
      return .get
    }
  }
  
  func asURLRequest() throws -> URLRequest {
  switch self {
  case .episode(let asdf):
    let url = url.appendingPathComponent(asdf)
    var request = URLRequest(url: url)
    request.method = method
    return request
  }
  }
}
