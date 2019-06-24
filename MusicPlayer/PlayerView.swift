//
//  PlayerView.swift
//  MusicPlayer
//
//  Created by Marlow Charite on 6/21/19.
//  Copyright © 2019 Marlow Charite. All rights reserved.
//

import SwiftUI

struct PlayerView : View {
	
	var song: Song
	
	var body: some View {
		
		NavigationView {
			
			VStack(alignment: .center) {
				Image(song.artwork)
					.resizable()
					.frame(width: 400, height: 400)
					.cornerRadius(10)
					.clipped(antialiased: true)
				
				PlayerControls(song: song)
				
			}
				.navigationBarItems(trailing: Image(systemName: "chevron.down"))
				.navigationBarTitle(Text(song.title))

		}
	}
	
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
	static var previews: some View {
		PlayerView(song: Library.songs[2])
	}
}
#endif

struct PlayerControls : View {
	
	@State private var duration: Double = 0
	var song: Song
	
	var body: some View {
		VStack {
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
			
			Text(song.title)
				.fontWeight(.heavy)
			Text("\(song.artist): \(song.albumTitle)")
			
			Spacer()

			HStack(spacing: 40) {
				Button(action: { print("button pressed") }) {
					Image(systemName: "backward")
						.aspectRatio(1, contentMode: .fit)
						.frame(width: 20)
						.foregroundColor(.yellow)
				}
				Button(action: { print("button pressed") }) {
					Image(systemName: "play")
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
