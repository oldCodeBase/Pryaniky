//
//  Model.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 08/06/2021.
//

import Foundation

struct Model: Decodable {
    let data: [DataResponse]
    let view: [View]
}

struct DataResponse: Decodable {
    let name: View
    let data: DifferentData
}

struct DifferentData: Decodable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variant]?
}

struct Variant: Decodable {
    let id: Int
    let text: String
}

enum View: String, Decodable {
    case hz       = "hz"
    case selector = "selector"
    case picture  = "picture"
}

