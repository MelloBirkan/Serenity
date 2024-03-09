//
//  MeditationView.swift
//  Serenity
//
//  Created by Marcello Gonzatto Birkan on 08/03/24.
//

import SwiftUI

struct MeditationView: View {
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
              
              Text("0s")
            })
            .font(.subheadline)
            .textCase(.uppercase)
            .opacity(0.7)
            .foregroundStyle(.secondary)
            
            Text("1 Minute Relaxing Meditation")
              .font(.title)
            
            Button(action: {}, label: {
              Label("Play", systemImage: "play.fill")
                .font(.headline)
                .foregroundStyle(.first)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(.accent)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            })
            
            Text("Clear your mind slumber into nothingness. Allocate only few moments for a quick breather.")
            
            
            Spacer()
          })
          .foregroundStyle(.primary)
          .padding(20)
        }
        .frame(height: UIScreen.main.bounds.height * 2 / 3)
      }
      .ignoresSafeArea()
    }
}

#Preview {
    MeditationView()
}
