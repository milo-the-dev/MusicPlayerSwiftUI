//
//  MusicLibrary.swift
//  MusicPlayer
//
//  Created by Marlow Charite on 6/29/19.
//  Copyright © 2019 Marlow Charite. All rights reserved.
//

import SwiftUI

struct MusicLibrary: View {
	@EnvironmentObject var state: AppState
	@State var isShowingPlayer = false
	private var songs: [Song] = []
	
	init(songs: [Song]) {
		self.songs = songs
	}
	
    var body: some View {
		NavigationView {
			VStack {
				SongsList(songs: songs)
					.environmentObject(state)
					.navigationBarTitle(Text("Music"))
				
				if state.isPlaying {
					MiniPlayer(song: state.currentSong!)
						.frame(height: 50)
						.tapAction { self.isShowingPlayer = true }
						.environmentObject(state)
				}
			}
			.sheet(isPresented: $isShowingPlayer) {
				PlayerView(song: self.state.currentSong!)
					.environmentObject(self.state)
			}
		}
    }
}

struct SongsList: View {
	@EnvironmentObject var state: AppState
	private var songs: [Song]
	
	init(songs: [Song]) {
		self.songs = songs
	}
	
	var body: some View {
		List(songs, id: \.title) { song in
			NavigationLink(destination: PlayerView(song: song).environmentObject(self.state)) {
				SongRow(song: song)
			}
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
		let state = AppState()
		state.isPlaying = true
		state.currentSong = Library.songs.first!
		return MusicLibrary(songs: Library.songs).environmentObject(state)
    }
}
#endif
