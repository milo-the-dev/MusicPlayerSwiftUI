//
//  AppState.swift
//  MusicPlayer
//
//  Created by Marlow Charite on 7/22/19.
//  Copyright © 2019 Marlow Charite. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class AppState: BindableObject {
	
	var willChange = PassthroughSubject<Void, Never>()
	
	var currentSong: Song? {
		willSet {
			willChange.send()
		}
	}
	var isPlaying = false {
		willSet {
			willChange.send()
		}
	}
}
