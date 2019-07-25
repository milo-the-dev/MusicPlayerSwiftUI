//
//  MiniPlayer.swift
//  MusicPlayer
//
//  Created by Marlow Charite on 7/24/19.
//  Copyright © 2019 Marlow Charite. All rights reserved.
//

import SwiftUI
import Combine

struct MiniPlayer: View {
	let song: Song
	@EnvironmentObject var state: AppState
	
	var body: some View {
		VStack (alignment: .leading) {
		HStack {
			Group {
				Image(song.artwork)
					.resizable()
					.frame(width: 30, height: 30)
					.cornerRadius(3)
				VStack(alignment: .leading) {
					Text(song.title)
						.font(.subheadline)
					Text(song.artist)
						.font(.caption)
				}
			}
			
			Spacer()
			
			HStack(spacing: 20) {
							Button(action: { print("button pressed") }) {
								Image(systemName: "backward")
									.aspectRatio(1, contentMode: .fit)
									.frame(width: 5)
									.foregroundColor(.yellow)
							}
							Button(action: { self.state.isPlaying.toggle() }) {
								Image(systemName: state.isPlaying ? "pause" : "play")
									.resizable()
									.aspectRatio(1, contentMode: .fit)
									.frame(width: 10)
									.foregroundColor(.yellow)
							}
							Button(action: { print("button pressed") }) {
								Image(systemName: "forward")
									.aspectRatio(1, contentMode: .fit)
									.frame(width: 5)
									.foregroundColor(.yellow)
								
							}
						}
		}
		}.padding()
	}
}

#if DEBUG
struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
		return MiniPlayer(song: Library.songs.first!)
			.environmentObject(AppState())
			.previewLayout(.sizeThatFits)
    }
}
#endif
