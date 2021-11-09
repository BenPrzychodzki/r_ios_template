//
//  translationUtils.swift
//  SquidGameMeter
//
//  Created by Szymon Trochimiak on 09/11/2021.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
