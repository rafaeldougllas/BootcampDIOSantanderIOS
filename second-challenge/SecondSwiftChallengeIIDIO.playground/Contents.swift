import UIKit

enum SongStyle: Codable {
    case rock
    case blues
    case eletronic
    case gospel
}

protocol PlayableSong: Codable {
    var name: String { get set }
    var band: String { get set }
    var style: SongStyle { get set }
    
    func play() -> String
}

class Song: PlayableSong {
    var name: String
    var band: String
    var style: SongStyle
    let description: String
    
    init(name: String, band: String, style: SongStyle, description: String) {
        self.name = name
        self.band = band
        self.style = style
        self.description = description
    }
    
    func play() -> String {
        return description
    }
}

protocol RadioProtocol {
    var songs: [Song] { get set }
    
    func playTopSongs()
}

class Radio: RadioProtocol {
    var songs: [Song]
    
    init(songs: [Song]) {
        self.songs = songs
    }
    
    func playTopSongs() {
        for index in stride(from: songs.count, to: 0, by: -1) {
            let song = songs[index - 1]
            print("E na \(index)° posição, com vocês, \(song.name) da banda \(song.band)")
            print(song.play() + " ♫\n")
        }
    }
}

let songsListStr = """
[{"style":{"gospel":{}},"name":"Daylight","band":"David Kushner","description":"Hidin' all of our sins from the daylight"},{"description":"Te estendo Minhas mãos. Meu amor É incondicional","name":"Incondicional","band":"Oficina G3","style":{"gospel":{}}},{"description":"Some just want everything. But everything means nothing. If I ain't got you.","style":{"blues":{}},"name":"If I ain't got you","band":"Alicia Keys"},{"name":"A Sky Full Of Stars","description":"'Cause in a sky, 'cause in a sky full of stars. I think I saw you","style":{"eletronic":{}},"band":"Coldplay"},{"description":"Hey, hey, I wanna be a rockstar, oh","style":{"rock":{}},"band":"Nickelback","name":"Rockstar"}]
"""

Task {
    do {
        let data = Data(songsListStr.utf8)
        let songsList = try JSONDecoder().decode([Song].self, from: data)
        let radio = Radio(songs: songsList)
        radio.playTopSongs()
    } catch {
        print(error.localizedDescription)
    }
}
