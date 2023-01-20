//
//  DeckDetailView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/13/23.
//

import SwiftUI

struct DeckDetailView: View {
    @EnvironmentObject var vm: DecksRootView.ViewModel
    
    var deck: Deck
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    DeckCell(for: deck)
                        .frame(maxWidth: 100)
                    
                    DeckSummaryCell(for: deck)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal)
                
                StudySessionModes(for: deck)
                    .padding(.horizontal)
                
                Divider()
                    .padding(.vertical, 10)
                
                VStack {
                    VStack {
                        HStack(spacing: 15) {
                            Text("Cards")
                                .font(.memorizeTitle3)
                            
                            Spacer()
                            
                            HStack(spacing: 10) {
                                Button { vm.isShowingNewCardSheet = true } label: {
                                    Image(systemName: "plus.circle")
                                }
                                
//                                Menu {
//                                    
//                                } label: {
//                                    Image(systemName: "ellipsis.circle")
//                                }
                            }
                              
                            if !deck.cards.isEmpty {
                                MemorizeCapsuleButton("See All") { }
                            }
                        }
                    }
                    
                    CardsList(deck: deck)
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 50)
            
        }
        .notFoundOverlay(isActive: false, for: .deck)
        
        .sheet(isPresented: $vm.isShowingNewCardSheet) {
            NewCardView(deck: deck, isNested: false)
        }
        
        .navigationTitle(deck.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    vm.isShowingNewCardSheet = true
                } label: {
                    Label("New Card", systemImage: "plus.circle")
                }
                
                Menu {
                    Button { vm.editingDeck = deck } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    
                    Button { } label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    
                    Button { } label: {
                        Label("Duplicate", systemImage: "square.on.square")
                    }
                    
                    Divider()
                    
                    Button { } label: {
                        Label("Info", systemImage: "info.circle")
                    }
                    
                    Menu {
                        Button(role: .destructive) {
                            
                        } label: {
                            Label("Clear Deck", systemImage: "minus.circle")
                        }
                        
                        Button(role: .destructive) {
                            
                        } label: {
                            Label("Remove Decks and Leave Cards", systemImage: "minus.circle")
                        }
                        
                        Button(role: .destructive) {
                            
                        } label: {
                            Label("Remove Decks", systemImage: "minus.circle")
                        }
                    } label: {
                        Label("Remove", systemImage: "minus.circle")
                    }
                } label: {
                    Label("Options", systemImage: "ellipsis.circle")
                }
            }
        }
    }
}

struct DeckDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DeckDetailView(deck: Deck.dummy[0])
            .environmentObject(DecksRootView.ViewModel())
    }
}
