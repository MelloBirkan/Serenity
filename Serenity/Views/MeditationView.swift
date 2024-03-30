//
//  MeditationView.swift
//  Serenity
//
//  Created by Marcello Gonzatto Birkan on 08/03/24.
//

import SwiftUI

struct MeditationView: View {
  @State var meditationOO: MeditationOO
  @State private var showPlayer = false
  
    var body: some View {
      VStack(spacing: 0) {
        
        Image(.meditaion3)
          .resizable()
          .scaledToFill()
          .frame(height: UIScreen.main.bounds.height / 3)
        
        ZStack {
          Color(.BG)
          
          VStack(alignment: .leading, spacing: 24, content: {
            
            VStack(alignment: .leading, spacing: 8, content: {
              Text("Music")
              
              Text(meditationOO.meditation.duration.formatted() + "S")
            })
            .font(.subheadline)
            .textCase(.uppercase)
            .opacity(0.7)
            .foregroundStyle(.secondary)
            
            Text(meditationOO.meditation.title)
              .font(.title)
            
            Button(action: {
              showPlayer = true
            }, label: {
              Label("Play", systemImage: "play.fill")
                .font(.headline)
                .foregroundStyle(.first)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(.accent)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            })
            
            Text(meditationOO.meditation.description)
            
            
            Spacer()
          })
          .foregroundStyle(.primary)
          .padding(20)
        }
        .frame(height: UIScreen.main.bounds.height * 2 / 3)
      }
      .ignoresSafeArea()
      .fullScreenCover(isPresented: $showPlayer) {
        PlayerView(OO: meditationOO)
      }
    }
}

#Preview {
  let meditationVM = MeditationOO(meditation: MeditationDO.data)
  return MeditationView(meditationOO: meditationVM)
}
