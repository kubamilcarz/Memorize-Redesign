//
//  Canvas.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import Foundation
import SwiftUI
import CoreData
import PencilKit

struct Canvas {
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var canvasView: PKCanvasView
    
    let onSaved: () -> Void
    
    let isStatic: Bool
    
    @State var toolPicker = PKToolPicker()
}

extension Canvas {
    func showToolPicker(_ visibility: Bool = true) {
        toolPicker.setVisible(visibility, forFirstResponder: canvasView)
        
        toolPicker.addObserver(canvasView)
        
        canvasView.becomeFirstResponder()
    }
}


extension Canvas: UIViewRepresentable {
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.tool = PKInkingTool(.pen, color: .gray, width: 10)
        
        #if targetEnvironment(simulator)
            canvasView.drawingPolicy = .anyInput
        #endif
        
        canvasView.delegate = context.coordinator
//        showToolPicker()
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {

    }
    
    
    func makeCoordinator() -> CanvasCoordinator {
      CanvasCoordinator(canvasView: $canvasView, onSaved: onSaved)
    }
}


class CanvasCoordinator: NSObject {
    var canvasView: Binding<PKCanvasView>
    let onSaved: () -> Void

    init(canvasView: Binding<PKCanvasView>, onSaved: @escaping () -> Void) {
        self.canvasView = canvasView
        self.onSaved = onSaved
    }
}
    

extension CanvasCoordinator: PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        if !canvasView.drawing.bounds.isEmpty {
            onSaved()
        }
    }
}

    
//    func updateUIViewController(_ uiViewController: DrawingCanvasViewController, context: Context) {
//        uiViewController.drawingData = data
//    }
//
//    typealias UIViewControllerType = DrawingCanvasViewController
//    var data: Data
//    var id: UUID
//
//    func makeUIViewController(context: Context) -> DrawingCanvasViewController {
//        let viewController = DrawingCanvasViewController()
//        viewController.drawingData = data
//
//        viewController.drawingChanged = { data in
//            let request: NSFetchRequest<Card> = Card.fetchRequest()
//            let predicate = NSPredicate(format: "id == %@", id as CVarArg)
//            request.predicate = predicate
//            do {
//                let result = try
//                viewContext.fetch(request)
//                let obj = result.first
//                obj?.setValue(data, forKey: "canvasData")
//                do {
//                    try viewContext.save()
//
//                } catch { print(error) }
//
//            }
//            catch { print(error) }
//
//        }
//        return viewController
//    }
//}

