//
//  PlayerView.swift
//  MusicPlayer
//
//  Created by Marlow Charite on 6/21/19.
//  Copyright © 2019 Marlow Charite. All rights reserved.
//

import SwiftUI

struct PlayerView : View {
	
	private let song: Song
	
	init(song: Song) {
		self.song = song
	}
	
	var body: some View {
		VStack {
			Image(song.artwork)
				.resizable()
				.frame(width: 400, height: 400)
				.cornerRadius(10)
				.clipped(antialiased: true)
			
			PlayerControls(song: song)
			
			}
			.navigationBarTitle(Text(song.title), displayMode: .inline)
			.navigationBarItems(trailing: Image(systemName: "chevron.down"))
	}
	
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
	static var previews: some View {
		NavigationView {
			PlayerView(song: Library.songs[1])
		}
	}
}
#endif

struct PlayerControls : View {
	
	@State private var duration: Double = 0
	@State private var isPlaying = false
	private let song: Song
	
	init(song: Song) {
		self.song = song
	}
	
	var body: some View {
		VStack {
			
			HStack(alignment: .top) {
				Image(song.artwork)
					.resizable()
					.clipShape(Circle())
					.frame(width: 50, height: 50)
				VStack(alignment: .leading) {
					Text(song.title)
						.fontWeight(.heavy)
					Text("\(song.artist): \(song.albumTitle)")
				}
			}
			
			VStack {
				Spacer()
				Slider(value: $duration)
					.frame(width: 350.0)
				HStack {
					Text("0:00")
					Spacer()
					Text("0:00")
					}.frame(width: 350)
			}
			Spacer()
			HStack(spacing: 40) {
				Button(action: { print("button pressed") }) {
					Image(systemName: "backward")
						.aspectRatio(1, contentMode: .fit)
						.frame(width: 20)
						.foregroundColor(.yellow)
				}
				Button(action: { self.isPlaying.toggle() }) {
					Image(systemName: isPlaying ? "pause" : "play")
						.resizable()
						.aspectRatio(1, contentMode: .fit)
						.frame(width: 40)
						.foregroundColor(.yellow)
				}
				Button(action: { print("button pressed") }) {
					Image(systemName: "forward")
						.aspectRatio(1, contentMode: .fit)
						.frame(width: 20)
						.foregroundColor(.yellow)
					
				}
			}
			
			Spacer()

			
		}
	}
}
