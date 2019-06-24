//
//  Library.swift
//  MusicPlayer
//
//  Created by Marlow Charite on 6/23/19.
//  Copyright © 2019 Marlow Charite. All rights reserved.
//

import Foundation

final class Library {
	static let songs: [Song] = [
		.init(title: "All Me", albumTitle: "Nothing Was The Same", artist: "Drake", artwork: "nothing-was-the-same"),
		.init(title: "Angels Ft. Saba", albumTitle: "The Coloring Book", artist: "Chance the Rapper", artwork: "the-coloring-book"),
		.init(title: "It's Too Late", albumTitle: "Summer On Sunset", artist: "Wale", artwork: "summer-on-sunset"),
		.init(title: "Lights Please", albumTitle: "The Warm Up", artist: "J. Cole", artwork: "the-warm-up")
	]
}

struct Song {
	let title: String
	let albumTitle: String
	let artist: String
	let artwork: String
}
