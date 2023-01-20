//
//  CardDetailView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import SwiftUI

struct CardDetailView: View {
    
    var card: Card
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                // Stats View
                
                VStack {
                    Text("Stats")
                        .font(.memorizeBody)
                        .foregroundColor(.secondary)
                }
                .frame(height: 200)
                
                Divider()
                
                NewCardView(card: card, isDetail: true)
                
                Divider()
                    .padding(.vertical, 15)
                
                HStack {
                    
                    Spacer()
                    
                    HStack(spacing: 15) {
                        Button(role: .destructive) {
                            
                        } label: {
                            Label("Remove Card", systemImage: "trash.circle")
                        }
                        .tint(.red)
                        
                        Divider()
                        
                        Button {
                            
                        } label: {
                            Label("Reset Stats", systemImage: "chart.line.uptrend.xyaxis.circle")
                        }
                        .tint(.secondary)
                    }
                    .frame(maxHeight: 50)
                    .font(.memorizeBody2)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(card.front)
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
            Button { } label: {
                Text("Save").font(.memorizeBody)
            }
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(card: Card.dummy[0])
    }
}
