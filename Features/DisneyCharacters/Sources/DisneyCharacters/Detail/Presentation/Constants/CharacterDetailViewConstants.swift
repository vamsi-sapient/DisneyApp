//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 11/10/2022.
//

import Foundation
import Core

struct CharacterDetailViewConstants {
    enum AccessibilityIdentifiers: String {
        case view = "CharacterDetailView"
    }
    
    struct Titles {
        static let films = "character_detail_title_films".localized(bundle: Bundle.module)
        static let shortFilms = "character_detail_title_short_films".localized(bundle: Bundle.module)
        static let tvShows = "character_detail_title_tv_shows_films".localized(bundle: Bundle.module)
        static let videoGames = "character_detail_title_video_games_films".localized(bundle: Bundle.module)
        static let parkAttractions = "character_detail_title_park_attractions".localized(bundle: Bundle.module)
        static let allies = "character_detail_title_allies".localized(bundle: Bundle.module)
        static let enemies = "character_detail_title_enemies".localized(bundle: Bundle.module)
        static let noData = "character_detail_no_data".localized(bundle: Bundle.module)
    }
    
    struct Dimensions {
        static let width = 160.0
        static let height = 160.0
        static let cornerRadius = 20.0
        static let padding = 30.0
        static let rowHeight = 180.0
    }
}
