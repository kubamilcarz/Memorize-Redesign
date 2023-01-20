//
//  NewCardView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/19/23.
//

import PencilKit
import SwiftUI

struct NewCardView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var vm = ViewModel()
    @State private var canvasView = PKCanvasView()

    var deck: Deck?
    var card: Card?
    var inEditMode: Bool
    var isNested: Bool
    var isDetail: Bool?
    
    init(card: Card? = nil, isNested: Bool = true) {
        self.card = card
        self.inEditMode = card != nil
        self.isNested = isNested
    }
    
    init(deck: Deck, isNested: Bool = true) {
        self.inEditMode = card != nil
        self.isNested = isNested
        self.deck = deck
    }
    
    init(card: Card? = nil, isDetail: Bool) {
        self.card = card
        self.inEditMode = card != nil
        self.isNested = true
        self.isDetail = true
    }

    var content: some View {
        ScrollView {
            VStack(spacing: 15) {
                HStack {
                    Text("Deck")
                        .font(.memorizeTitle4)
                    
                    Spacer()
                    
                    Picker("Deck", selection: $vm.deck) {
                        ForEach(vm.decks) { dck in
                            Label(dck.name, systemImage: dck.icon)
                                .tag(dck as? Deck)
                        }
                    }
                    .layoutPriority(1)
                    .pickerStyle(.menu)
                    .onAppear {
                        if vm.deck == nil {
                            vm.deck = vm.decks.first
                        }
                    }
                }
                .padding(.horizontal)
                
                if isDetail == nil {
                    Divider()
                }
                                
                VStack(spacing: 15) {
                    VStack {
                        HStack {
                            Text("Front")
                                .font(.memorizeTitle4)
                            Spacer()
                            Toggle("Freeze", isOn: $vm.isFrontFrozen)
                                .toggleStyle(.button)
                                .buttonBorderShape(.capsule)
                                .font(.memorizeCaption2)
                        }
                        
                        TextField("Front", text: $vm.front)
                            .textFieldStyle(MemorizeTextFieldStyle())
                            .focused(vm.$focusedField, equals: FocusStates.front)
                            .submitLabel(.next)
                            .onSubmit {
                                vm.focusedField = .back
                            }
                    }
                    if UIDevice.isiPad {
                        Section {
                            vm.currentCanvas
                                .frame(minHeight: 300)
                        } header: {
                            HStack {
                                HStack {
                                    Text("Drawing")
                                    Spacer()
                                    Toggle("Freeze", isOn: $vm.isDrawingFrozen)
                                        .toggleStyle(.button)
                                        .buttonBorderShape(.capsule)
                                        .font(.memorizeCaption2)
                                }
                                
                                Button("Clear", action: vm.clearDrawing)
                                    .controlSize(.mini)
                                    .font(.memorizeCaption2)
                            }
                            
                        }
                        .onTapGesture {
                            vm.currentCanvas.showToolPicker()
                            vm.isCanvasToolkitActive = true
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Back")
                                .font(.memorizeTitle4)
                            Spacer()
                            Toggle("Freeze", isOn: $vm.isBackFrozen)
                                .toggleStyle(.button)
                                .buttonBorderShape(.capsule)
                                .font(.memorizeCaption2)
                        }
                        
                        TextField("Back", text: $vm.back)
                            .textFieldStyle(MemorizeTextFieldStyle())
                            .focused(vm.$focusedField, equals: FocusStates.back)
                            .submitLabel(.continue)
                            .onSubmit(vm.addCard)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(inEditMode ? card?.front ?? "Unknown Card" : "New Card")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isDetail == nil {
                if !isNested {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done").font(.memorizeBody)
                    }
                }
            }
        }
        .withFloatingActionButtons {
            if isDetail == nil {
                MemorizeBigButton(inEditMode ? "Save" : "Add") {
                    if inEditMode, let card {
                        vm.saveCard(card: card)
                    } else {
                        vm.addCard()

                        vm.isShowingSuccess = true
                    }
                }
                .padding(.horizontal)
                .disabled(vm.isFormDisabled)
            }
        }
        
        .withSuccessOverlay("Card Added", animated: $vm.isShowingSuccess)
        
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            vm.isCanvasToolkitActive = false
        }
        .onAppear {
            vm.currentCanvas = Canvas(canvasView: $canvasView, onSaved: vm.updateDrawing, isStatic: false)
            vm.deck = deck
            
            if let card {
                vm.front = card.front
                vm.back = card.back
            }
            
        }
        .onChange(of: vm.currentCanvas.toolPicker.isVisible) { newValue in
            vm.isCanvasToolkitActive = newValue
        }
        .disableScrolling(disabled: vm.isCanvasToolkitActive)
    }
    
    var body: some View {
        Group {
            if isNested {
                content
            } else {
                NavigationView {
                    content
                }
            }
        }
    }
    
    func freezeFieldToggle(title: LocalizedStringKey, _ field: Binding<Bool>) -> some View {
        HStack {
            Text(title)
            Spacer()
            Toggle("Freeze", isOn: field)
                .toggleStyle(.button)
                .buttonBorderShape(.capsule)
                .font(.caption2)
        }
    }
}

struct NewCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardView(isNested: false)
    }
}
