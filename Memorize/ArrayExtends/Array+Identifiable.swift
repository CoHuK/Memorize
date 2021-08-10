//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Pasha on 06/10/2020.
//  Copyright © 2020 MemorizeApp. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching:Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
