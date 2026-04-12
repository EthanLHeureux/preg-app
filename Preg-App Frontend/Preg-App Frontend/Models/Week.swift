//
//  PregnancyWeek.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import Foundation

nonisolated struct PregnancyWeek: Codable {
    let week: Int
    let mother: Mother
    let baby: Baby
}
