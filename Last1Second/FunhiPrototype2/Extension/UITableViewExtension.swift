//
//  UITableViewExtension.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/19.
//

import Foundation

extension UITableView {
  func updateHeaderViewHeight() {
    if let header = self.tableHeaderView {
      let newSize = header.systemLayoutSizeFitting(CGSize(width: self.bounds.width, height: 0))
      header.frame.size.height = newSize.height
    }
  }
}
