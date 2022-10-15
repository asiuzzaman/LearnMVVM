//
//  Model+IconManager.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 15/10/22.
//

import UIKit

protocol IconManagement: AnyObject {
    var totalIcons: Int { get }
    var allIcons: [Icon] { get }
    
    func topFavoriteIcons(first count: Int) -> [Icon]
    func vote(icon: Icon, rating: Icon.Rating)
    func rating(icon: Icon) -> Icon.Rating
}

struct Icon: Equatable , Hashable {
    let name: String
    let url: URL?
    let image: UIImage?
    let type: IconType
    
    init(ofType type: IconType) {
        self.type = type
        name = type.name
        image = type.image
        url = type.url
    }

    static func == (lhs: Icon, rhs: Icon) -> Bool {
        lhs.type == rhs.type
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(type)
    }
    
}

extension Icon {
    enum Rating: Int {
        case veryBad = 1, bad, ok, good, veryGood
    }
}

extension Icon.Rating {
    var label: String {
        switch self {
        case .veryBad: return "Very Bad"
        case .bad: return "Bad"
        case .ok: return "OK"
        case .good: return "Good"
        case .veryGood: return "Very Good"
        }
    }
}

extension Icon {
    enum IconType: String, CaseIterable {
        
        case morning
        case night
        case out
        case `in`
        case movie
        case travel
        case dining
        case rain
        case cleaning
        case leave
        case arrive
        case love
        case coffee
        case relax

        init? (_ rawValue: String) {
            switch rawValue {
            case "morning":  self = .morning
            case "night":    self = .night
            case "out":      self = .out
            case "in":       self = .in
            case "movie":    self = .movie
            case "travel":   self = .travel
            case "dining":   self = .dining
            case "rain":     self = .rain
            case "cleaning": self = .cleaning
            case "leave":    self = .leave
            case "arrive":   self = .arrive
            case "love":     self = .love
            case "coffee":   self = .coffee
            case "relax":    self = .relax
            default:         return nil
            }
        }
        
        static var allCases: [IconType] {[
            .morning, .night,
            .out, .`in`, .leave, .arrive,
            .travel, .dining, .cleaning, .movie, .relax,
            .rain, .love , .coffee
        ]}
        
    }
}

extension Icon.IconType {
    var name: String { rawValue.capitalized }

    var image: UIImage? { UIImage(named: rawValue) }

    var url: URL? {
        let address = [
            "https://client-assets.smartthings.com/scenes/",
            rawValue,
            "@4x.png"
        ].joined()

        return URL(string: address)
    }
}
