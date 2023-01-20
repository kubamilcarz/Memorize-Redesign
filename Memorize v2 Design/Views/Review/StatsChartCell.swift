//
//  StatsChartCell.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import SwiftUI

struct StatsChartCell: View {
    
    var card: Card?
    var deck: Deck?
    var height: CGFloat
    
    var positiveCount = 72
    var negativeCount = 33
    
    var numberOfReviews: Int {
        positiveCount + negativeCount
    }
    
    init(card: Card, height: CGFloat = 200) {
        self.card = card
        self.height = height
    }
    
    init(deck: Deck, height: CGFloat = 200) {
        self.deck = deck
        self.height = height
    }
    
    var body: some View {
        Group {
            if let card {
                statCell(positive: positiveCount, negative: negativeCount)
            }
            
            if let deck {
                // chart for deck
                Text("hello")
            }
        }
    }
    
    private func statCell(positive: Int, negative: Int) -> some View {
        VStack {
            HStack(alignment: .bottom) {
                Group {
                    if negative == numberOfReviews {
                        ZStack(alignment: .top) {
                            barFor(negative, color: .red)
                        }
                    } else {
                        VStack {
                            barFor(negative, color: .red)
                        }
                    }
                }
                .aspectRatio(2/3, contentMode: .fit)
                
                Group {
                    if positive == numberOfReviews {
                        ZStack(alignment: .top) {
                            barFor(positive, color: .green)
                        }
                    } else {
                        VStack {
                            barFor(positive, color: .green)
                        }
                    }
                }
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .aspectRatio(2/3, contentMode: .fill)

    }
    
    private func barFor(_ value: Int, color: Color) -> some View {
        
        var heightOfBar: CGFloat {
            var returnValue = (CGFloat(value) * CGFloat(height))/CGFloat(numberOfReviews)
            
            if returnValue == 0 { return 2 } else {
                return returnValue
            }
        }
        
        return Group {
            Text(value.formatted(.number))
                .font(height <= 150 ? .memorizeTabBar : .memorizeCaption2)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .layoutPriority(1)
                .frame(maxWidth: .infinity)
                .zIndex(1)
                .padding(.vertical, height <= 150 ? 5 : 15)
                .foregroundStyle(.primary)
            
            VStack {
                Rectangle()
                    .fill(color.opacity(0.7))
                    .frame(maxWidth: .infinity)
                    .frame(height: heightOfBar)
                    .cornerRadius(height <= 150 ? 6 : 12, corners: [.topLeft, .topRight])
                
                Text(color == .green ? "Correct" : color == .red ? "Wrong" : "Unknown")
                    .fixedSize()
                    .font(height <= 150 ? .memorizeTabBar : .memorizeCaption2)
                    .fontWeight(height <= 150 ? .light : .regular)
                    .foregroundStyle(.secondary)
                    .layoutPriority(1)
            }
                
        }
    }
}

struct StatsChartCell_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Spacer()
                .layoutPriority(1)
            
            StatsChartCell(card: Card.dummy[0], height: 150)
        }
        .padding()
    }
}
