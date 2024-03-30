//
//  PlayerView.swift
//  Serenity
//
//  Created by Marcello Gonzatto Birkan on 09/03/24.
//

import SwiftUI

struct PlayerView: View {
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var audioManager: AudioManager
  var OO: MeditationOO
  var isPreview = false
  @State private var value = 0.0
  
    var body: some View {
      ZStack {
        OO.meditation.image
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: UIScreen.main.bounds.width)
          .padding(.leading, 28)
          .ignoresSafeArea()
        
        Rectangle()
          .background(.thinMaterial)
          .opacity(0.05)
          .ignoresSafeArea()
        
        VStack(spacing: 32, content: {
          HStack {
            Button(action: {
              dismiss()
            }, label: {
              Image(systemName: "xmark.circle.fill")
                .font(.system(size: 36))
                .foregroundStyle(.white)
            })
            
            Spacer()
          }
          
          Text(OO.meditation.title)
            .font(.title)
            .foregroundStyle(.white) // Possivel mudança de cor
            .background(
              RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white)
                .opacity(0.2)
                .blur(radius: 20)
            )
          
          Spacer()
          
          VStack(spacing: 5, content: {
            
            Slider(value: $value, in: 0...60)
              .tint(.accent)
            
            HStack {
              Text("0:00")
              
              Spacer()
              
              Text("1:00")
            }
            .font(.caption)
            .foregroundStyle(.accent)
          
          HStack {
            PlaybackControlButton(systemName: "repeat") {
              
            }
            
            Spacer()
            
            PlaybackControlButton(systemName: "gobackward.10") {
              
            }
            
            Spacer()
            
            PlaybackControlButton(systemName: "play.circle.fill", fontSize: 44) {
            }
            
            Spacer()
            
            PlaybackControlButton(systemName: "goforward.10") {
            }
            
            Spacer()
            
            PlaybackControlButton(systemName: "stop.fill") {
              
            }
          }
          })
          .padding()
          .background(.ultraThinMaterial)
          .clipShape(RoundedRectangle(cornerRadius: 18))
          
        })
        
        .padding(20)
      }
      .onAppear {
        audioManager.startPlayer(track: OO.meditation.track, isPreview: isPreview)
      }
    }
}

#Preview {
  let meditationOO = MeditationOO(meditation: MeditationDO.data)
  return PlayerView(OO: meditationOO, isPreview: true)
}
