//
//  Array+Only.swift
//  Memorize
//
//  Created by Pasha on 07/10/2020.
//  Copyright © 2020 MemorizeApp. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
