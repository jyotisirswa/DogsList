//
//  Collections + Extension.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation

//MARK: - Arrays
public extension Collection where Indices.Iterator.Element == Index {
  /// Returns the element at the specified index iff it is within bounds, otherwise nil.
  subscript (safe index: Index) -> Iterator.Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
