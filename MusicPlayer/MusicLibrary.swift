//
//  MusicLibrary.swift
//  MusicPlayer
//
//  Created by Marlow Charite on 6/29/19.
//  Copyright © 2019 Marlow Charite. All rights reserved.
//

import SwiftUI

struct MusicLibrary : View {
	
	private var songs: [Song] = []
	
	init(songs: [Song]) {
		self.songs = songs
	}
	
    var body: some View {
		NavigationView {
			List(songs.identified(by: \.title)) { song in
				NavigationButton(destination: PlayerView(song: song)) {
					SongRow(song: song)
				}
			}
			.navigationBarTitle(Text("Music"))
		}
    }
}

struct SongRow: View {
	
	let song: Song
	
	var body: some View {
		HStack(alignment: .top) {
			Image(song.artwork)
				.resizable()
				.frame(width: 50, height: 50)
				.cornerRadius(5)
				.clipped()
			VStack(alignment: .leading) {
				Text(song.title)
					.font(.headline)
				Text(song.artist)
					.font(.caption)
			}
		}
	}
}

#if DEBUG
struct MusicLibrary_Previews : PreviewProvider {
    static var previews: some View {
		MusicLibrary(songs: Library.songs)
    }
}
#endif
