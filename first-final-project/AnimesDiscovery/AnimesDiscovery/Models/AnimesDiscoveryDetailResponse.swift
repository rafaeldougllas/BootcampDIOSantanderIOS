//
//  AnimesDiscoveryDetailResponse.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 22/10/23.
//

import Foundation

struct AnimesDiscoveryDetailResponse: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
    }

    let data: AnimeDescription

    init(data: AnimeDescription) {
        self.data = data
    }
}

struct AnimeDescription: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case airing
        case approved
        case broadcast
        case duration
        case episodes
        case favorites
        case genres
        case images
        case malId = "mal_id"
        case members
        case popularity
        case rank
        case rating
        case score
        case scoredBy = "scored_by"
        case season
        case source
        case status
        case synopsis
        case title
        case trailer
        case type
        case url
        case year
    }

    let airing: Bool
    let approved: Bool
    let broadcast: Broadcast
    let duration: String
    let episodes: Int
    let favorites: Int
    let genres: [Genre]
    let images: DataImages
    let malId: Int
    let members: Int
    let popularity: Int
    let rank: Int
    let rating: String
    let score: Double
    let scoredBy: Int
    let season: String
    let source: String
    let status: String
    let synopsis: String
    let title: String
    let trailer: Trailer
    let type: String
    let url: URL
    let year: Int

    init(airing: Bool, approved: Bool, broadcast: Broadcast, duration: String, episodes: Int, favorites: Int, genres: [Genre], images: DataImages, malId: Int, members: Int, popularity: Int, rank: Int, rating: String, score: Double, scoredBy: Int, season: String, source: String, status: String, synopsis: String, title: String, trailer: Trailer, type: String, url: URL, year: Int) {
        self.airing = airing
        self.approved = approved
        self.broadcast = broadcast
        self.duration = duration
        self.episodes = episodes
        self.favorites = favorites
        self.genres = genres
        self.images = images
        self.malId = malId
        self.members = members
        self.popularity = popularity
        self.rank = rank
        self.rating = rating
        self.score = score
        self.scoredBy = scoredBy
        self.season = season
        self.source = source
        self.status = status
        self.synopsis = synopsis
        self.title = title
        self.trailer = trailer
        self.type = type
        self.url = url
        self.year = year
    }
}

struct DataImages: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case jpg
        case webp
    }

    let jpg: Jpg
    let webp: Webp

    init(jpg: Jpg, webp: Webp) {
        self.jpg = jpg
        self.webp = webp
    }
}

struct Genre: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case malId = "mal_id"
        case name
        case type
        case url
    }

    let malId: Int
    let name: String
    let type: String
    let url: URL

    init(malId: Int, name: String, type: String, url: URL) {
        self.malId = malId
        self.name = name
        self.type = type
        self.url = url
    }
}

struct Broadcast: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case day
        case string
        case time
        case timezone
    }

    let day: String
    let string: String
    let time: String
    let timezone: String

    init(day: String, string: String, time: String, timezone: String) {
        self.day = day
        self.string = string
        self.time = time
        self.timezone = timezone
    }
}

struct Trailer: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case embedUrl = "embed_url"
        case images
        case url
        case youtubeId = "youtube_id"
    }

    let embedUrl: String
    let images: TrailerImages
    let url: String
    let youtubeId: String

    init(embedUrl: String, images: TrailerImages, url: String, youtubeId: String) {
        self.embedUrl = embedUrl
        self.images = images
        self.url = url
        self.youtubeId = youtubeId
    }
}

struct TrailerImages: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case imageUrl = "image_url"
        case largeImageUrl = "large_image_url"
        case maximumImageUrl = "maximum_image_url"
        case mediumImageUrl = "medium_image_url"
        case smallImageUrl = "small_image_url"
    }

    let imageUrl: URL
    let largeImageUrl: URL
    let maximumImageUrl: URL
    let mediumImageUrl: URL
    let smallImageUrl: URL

    init(imageUrl: URL, largeImageUrl: URL, maximumImageUrl: URL, mediumImageUrl: URL, smallImageUrl: URL) {
        self.imageUrl = imageUrl
        self.largeImageUrl = largeImageUrl
        self.maximumImageUrl = maximumImageUrl
        self.mediumImageUrl = mediumImageUrl
        self.smallImageUrl = smallImageUrl
    }
}
