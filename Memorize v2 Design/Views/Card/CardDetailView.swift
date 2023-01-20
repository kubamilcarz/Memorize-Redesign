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
            VStack(spacing: 30) {
                VStack(spacing: 15) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Stats")
                                .font(.memorizeTitle4)
                            Text("You created this card on \(Date.now.formatted(date: .abbreviated, time: .omitted))")
                                .font(.memorizeCaption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                    }
                    
                    HStack(alignment: .center) {
                        HStack(spacing: 10) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Accuracy")
                                Spacer()
                                Text("Avg Answer")
                                Spacer()
                                Text("Last Reviewed")
                                Spacer()
                                Text("First Reviewed")
                            }
                            .fontWeight(.semibold)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(74.formatted(.percent))
                                Spacer()
                                Text("3 s")
                                Spacer()
                                Text(Date.now.formatted(date: .abbreviated, time: .omitted))
                                Spacer()
                                Text(Date.now.formatted(date: .abbreviated, time: .omitted))
                            }
                        }
                        .lineLimit(1)
                        .font(.caption)
                        .padding(.vertical)
                        .frame(maxHeight: 140)
                        
                        Spacer()
                        
                        StatsChartCell(card: card, height: 150)
                            .frame(maxWidth: 120)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                NewCardView(card: card, isDetail: true)
                
                VStack(spacing: 15) {
                    Divider()
                        .padding(.bottom, 15)
                    
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
                        .font(.memorizeCaption)
                    }
                    .padding(.horizontal)
                }
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
