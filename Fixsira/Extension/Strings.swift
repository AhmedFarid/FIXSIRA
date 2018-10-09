//
//  Strings.swift
//  Fixsira
//
//  Created by FARIDO on 10/7/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
