//
//  DrawingCanvasViewController+Extension.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import Foundation
import PencilKit

extension DrawingCanvasViewController: PKToolPickerObserver, PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        drawingChanged(canvasView.drawing.dataRepresentation())
    }
}
