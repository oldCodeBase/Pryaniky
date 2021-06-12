//
//  Row.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 08/06/2021.
//

protocol RowTypeProtocol {
    var containsText:               Bool     { get }
    var containsImage:              Bool     { get }
    var containsSegmentedControl:   Bool     { get }
}

import UIKit

enum Row: Int, CaseIterable, RowTypeProtocol {
    
    case imageWithText
    case segmentedControl
    case text
    
    var containsImage: Bool {
        switch self {
        case .imageWithText:           return true
        case .segmentedControl, .text: return false
        }
    }
    
    var containsSegmentedControl: Bool {
        switch self {
        case .imageWithText, .text: return false
        case .segmentedControl:     return true
        }
    }
    
    var containsText: Bool {
        switch self {
        case .imageWithText, .text: return true
        case .segmentedControl:     return false
        }
    }
}

