//
//  AnimesDiscoveryResponse.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 22/10/23.
//

import Foundation

struct AnimesDiscoveryResponse: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case pagination
    }

    let data: [AnimesShortDescription]
    let pagination: Pagination

    init(data: [AnimesShortDescription], pagination: Pagination) {
        self.data = data
        self.pagination = pagination
    }
}

struct Pagination: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case hasNextPage = "has_next_page"
        case lastVisiblePage = "last_visible_page"
    }

    let hasNextPage: Bool
    let lastVisiblePage: Int

    init(hasNextPage: Bool, lastVisiblePage: Int) {
        self.hasNextPage = hasNextPage
        self.lastVisiblePage = lastVisiblePage
    }
}

struct AnimesShortDescription: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case content
        case date
        case entry
        case malId = "mal_id"
        case user
    }

    let content: String
    let date: Date
    let entry: [Entry]
    let malId: String
    let user: User

    init(content: String, date: Date, entry: [Entry], malId: String, user: User) {
        self.content = content
        self.date = date
        self.entry = entry
        self.malId = malId
        self.user = user
    }
}

struct Entry: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case images
        case malId = "mal_id"
        case title
        case url
    }

    let images: Images
    let malId: Int
    let title: String
    let url: URL

    init(images: Images, malId: Int, title: String, url: URL) {
        self.images = images
        self.malId = malId
        self.title = title
        self.url = url
    }
}

struct Images: Codable {
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

struct Jpg: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case imageUrl = "image_url"
        case largeImageUrl = "large_image_url"
        case smallImageUrl = "small_image_url"
    }

    let imageUrl: String
    let largeImageUrl: String
    let smallImageUrl: String

    init(imageUrl: String, largeImageUrl: String, smallImageUrl: String) {
        self.imageUrl = imageUrl
        self.largeImageUrl = largeImageUrl
        self.smallImageUrl = smallImageUrl
    }
}

struct Webp: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case imageUrl = "image_url"
        case largeImageUrl = "large_image_url"
        case smallImageUrl = "small_image_url"
    }

    let imageUrl: String
    let largeImageUrl: String
    let smallImageUrl: String

    init(imageUrl: String, largeImageUrl: String, smallImageUrl: String) {
        self.imageUrl = imageUrl
        self.largeImageUrl = largeImageUrl
        self.smallImageUrl = smallImageUrl
    }
}

struct User: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case url
        case username
    }

    let url: String
    let username: String

    init(url: String, username: String) {
        self.url = url
        self.username = username
    }
}
