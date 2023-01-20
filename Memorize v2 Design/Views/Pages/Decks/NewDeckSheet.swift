//
//  NewDeckSheet.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/14/23.
//

import SwiftUI

struct NewDeckSheet: View {
    @Environment(\.dismiss) var dismiss
    
    let colors: [[Color?]] = [[.memorizeRed, .memorizeOrange, .memorizeYellow, .memorizeGreen, .memorizeMint, .memorizeBlue, .memorizeNavy], [.memorizePurple, .memorizePink, .memorizeGray, nil, nil, nil, nil]]
    
    let icons = ["checkmark", "book", "house", "car", "person", "sunrise", "shuffle", "cloud.rain", "figure.walk", "flashlight.off.fill", "dial.high", "lightbulb.led", "spigot", "key", "digitalcrown.arrow.clockwise", "oilcan", "syringe"]
    
    var isEdit: Bool
    var deck: Deck?
    
    init(isEdit: Bool = false, deck: Deck? = nil) {
        self.isEdit = isEdit
        self.deck = deck
    }
    
    @State private var title = ""
    @State private var description = ""
    @State private var pickedIcon = "house"
    @State private var pickedColor = Color.memorizeBlue
    @State private var isShowingSuccess = false
    
    var formDisabled: Bool {
        title.count < 2 || pickedIcon.isEmpty
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    DeckCell(withTitle: title, icon: pickedIcon, color: pickedColor)
                        .frame(maxWidth: 120)
                        .padding(.top)
                    
                    VStack(spacing: 30) {
                        TextField("Name", text: $title)
                            .textFieldStyle(MemorizeTextFieldStyle("Title"))
                        
                        TextField("Description", text: $description)
                            .textFieldStyle(MemorizeTextFieldStyle("Description"))
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    VStack(spacing: 15) {
                        HStack {
                            Text("Color").font(.memorizeTitle4)
                            
                            Spacer()
                        }
                        
                        VStack(spacing: 15) {
                            ForEach(colors, id: \.self) { row in
                                HStack(spacing: 15) {
                                    ForEach(row, id: \.self) { color in
                                        if let color {
                                            ZStack {
                                                Circle()
                                                    .fill(color.opacity(0.75))
                                                
                                                if pickedColor == color {
                                                    Image(systemName: "checkmark")
                                                        .foregroundStyle(.white.opacity(0.85))
                                                        .font(.headline)
                                                }
                                            }
                                            .onTapGesture {
                                                withAnimation {
                                                    pickedColor = color
                                                }
                                            }
                                        } else {
                                            Circle().fill(.clear)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(spacing: 15) {
                        HStack {
                            Text("Icon").font(.memorizeTitle4)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 7.5)
                        
                        ScrollView(.vertical) {
                            VStack(spacing: 15) {
                                LazyVGrid(columns: [
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible())
                                ], spacing: 15) {
                                    ForEach(icons, id: \.self) { icon in
                                        ZStack {
                                            Circle().fill(.ultraThinMaterial)
                                                .overlay(
                                                    pickedIcon == icon ?
                                                    Circle().stroke(Color.memorizeBlue, lineWidth: 1)
                                                        .padding(1)
                                                    : nil
                                                )
                                            
                                            Image(systemName: icon)
                                                .foregroundStyle(pickedIcon != icon ? Color.secondary : .memorizeBlue)
                                        }
                                        .onTapGesture {
                                            withAnimation {
                                                pickedIcon = icon
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 7.5)
                        }
                        .frame(maxHeight: 170)
                    }
                    .padding(.horizontal, 7.5)
                }
                .padding(.bottom, 75)
            }
            .withFloatingActionButtons {
                MemorizeBigButton(isEdit ? "Save" : "Add") {
                    if !isEdit {
                        isShowingSuccess = true

                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                            dismiss()
                        }
                    }
                }
                .padding(.horizontal)
                .disabled(formDisabled)
            }
            
            .withSuccessOverlay("Added Deck", animated: $isShowingSuccess)
            
            .navigationTitle(isEdit ? title : "New Deck")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Done") { dismiss() }
            }
            
            .onAppear {
                if let deck {
                    title = deck.name
                    description = deck.description
                    pickedColor = deck.color
                    pickedIcon = deck.icon
                }
            }
        }
    }
}

struct NewDeckSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewDeckSheet(isEdit: false)
    }
}
