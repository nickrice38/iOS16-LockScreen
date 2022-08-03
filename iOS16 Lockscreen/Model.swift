//
//  Model.swift
//  iOS16 Lockscreen
//
//  Created by Nick Rice on 03/08/2022.
//

import Foundation

struct Place: Identifiable, Hashable {
    var id = UUID()
    var backgroundImage: String
    var foregroundImage: String
    var time: String
    var date: String
    var location: String
}

var examplePlaces = [
    Place(backgroundImage: "surfBG", foregroundImage: "surfFG", time: "13:37", date: "Wednesday, August 3", location: "Florida, United States"),
    Place(backgroundImage: "japanBG", foregroundImage: "japanFG", time: "02:37", date: "Thursday, August 4", location: "Kitayama, Japan"),
    Place(backgroundImage: "londonBG", foregroundImage: "londonFG", time: "18:37", date: "Wednesday, August 3", location: "London, United Kingdom")
]
