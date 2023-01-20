//
//  NewCardViewModel.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import PencilKit
import SwiftUI

extension NewCardView {
    
    enum FocusStates: Int {
        case front = 0, back = 1
    }
    
    final class ViewModel: ObservableObject {
        @Published var decks: [Deck]
        
        @Published var deck: Deck?
        @Published var front = ""
        @Published var back = ""
        
        @FocusState var focusedField: FocusStates?
        
        @Published var isFrontFrozen = false
        @Published var isBackFrozen = false
        @Published var isDrawingFrozen = false
        
        @Published var canvasData = Data()
        @Published var currentCanvas: Canvas
        @Published var canvasView = PKCanvasView()
        @Published var isCanvasToolkitActive = false
        
        @Published var isShowingSuccess = false
        
        var isFormDisabled: Bool { front.isEmpty || back.isEmpty }
        
        init() {
            self.decks = Deck.dummy.sorted { $0.name < $1.name }
            self.currentCanvas = Canvas(canvasView: .constant(PKCanvasView()), onSaved: {}, isStatic: false)
        }
        
        // MARK: - Methods
        
        func addCard() {
            // 4. reset fields
            if !isFrontFrozen { front = "" }
            if !isBackFrozen { back = "" }
            if !isDrawingFrozen { clearDrawing() }
            
            // 5. change focus
            if isFrontFrozen && !isBackFrozen { focusedField = .back }
            else { focusedField = .front }
        }
        
        func saveCard(card: Card) {
            // handle editing of card
        }
        
        func updateDrawing() {
            canvasData = canvasView.drawing.dataRepresentation()
        }
        
        func clearDrawing() {
            canvasView.drawing = PKDrawing()
        }
    }
}
