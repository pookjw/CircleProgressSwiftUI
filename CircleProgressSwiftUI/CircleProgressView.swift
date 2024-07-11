//
//  CircleProgressView.swift
//  CircleProgressSwiftUI
//
//  Created by Jinwoo Kim on 7/12/24.
//

import SwiftUI
import ObjectiveC

struct CircleProgressView: UIViewRepresentable {
    fileprivate var progressStartPoint: ProgressStartPoint = .top
    fileprivate var progressColor: UIColor = .systemBlue
    fileprivate var progressLineWidth: CGFloat = 2.0
    fileprivate var showProgressTray: Bool = false
    fileprivate var progress: Double
    fileprivate var progressBackgroundColor: UIColor = .init(white: 0.78, alpha: 1.0)
    
    init(progress: Double) {
        self.progress = progress
    }
    
    func makeUIView(context: Context) -> UIView {
        let uiView = (objc_lookUpClass("_UICircleProgressView") as! UIView.Type).init()
        set(view: uiView, progressStartPoint: progressStartPoint.rawValue)
        set(view: uiView, progressColor: progressColor)
        set(view: uiView, progressLineWidth: progressLineWidth)
        set(view: uiView, showProgressTray: showProgressTray)
        set(view: uiView, progress: progress, animated: false)
        set(layer: uiView.layer, progressBackgroundColor: progressBackgroundColor)
        return uiView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        let isInAnimation = context.transaction.animation != nil
        let layer = uiView.layer
        
        set(view: uiView, progressStartPoint: progressStartPoint.rawValue)
        set(view: uiView, progressColor: progressColor)
        set(view: uiView, progressLineWidth: progressLineWidth)
        set(view: uiView, showProgressTray: showProgressTray)
        set(view: uiView, progress: progress, animated: isInAnimation)
        set(layer: layer, progressBackgroundColor: progressBackgroundColor)
        
        layer.setNeedsDisplay()
    }
}

extension CircleProgressView {
    enum ProgressStartPoint {
        case top
        case right
        case bottom
        case left
        
        fileprivate var rawValue: Int {
            switch self {
            case .top:
                0
            case .right:
                1
            case .bottom:
                2
            case .left:
                3
            }
        }
    }
}

extension CircleProgressView {
    func progressStartPoint(_ progressStartPoint: ProgressStartPoint) -> CircleProgressView {
        var copy = self
        copy.progressStartPoint = progressStartPoint
        return copy
    }
    
    func progressColor(_ progressColor: Color) -> CircleProgressView {
        return self.progressColor(uiColor: UIColor(progressColor))
    }
    
    func progressColor(uiColor progressColor: UIColor) -> CircleProgressView {
        var copy = self
        copy.progressColor = progressColor
        return copy
    }
    
    func progressLineWidth(_ progressLineWidth: CGFloat) -> CircleProgressView {
        var copy = self
        copy.progressLineWidth = progressLineWidth
        return copy
    }
    
    func showProgressTray(_ showProgressTray: Bool) -> CircleProgressView {
        var copy = self
        copy.showProgressTray = showProgressTray
        return copy
    }
    
    func progressBackgroundColor(_ progressBackgroundColor: Color) -> CircleProgressView {
        return self.progressBackgroundColor(uiColor: UIColor(progressBackgroundColor))
    }
    
    func progressBackgroundColor(uiColor progressBackgroundColor: UIColor) -> CircleProgressView {
        var copy = self
        copy.progressBackgroundColor = progressBackgroundColor
        return copy
    }
}

fileprivate func set(view: UIView, progressStartPoint: Int) {
    let cmd = sel_registerName("setProgressStartPoint:")
    let method = class_getInstanceMethod(type(of: view), cmd)
    let imp = method_getImplementation(method!)
    let casted = unsafeBitCast(imp, to: (@convention(c) (Any, Selector, Int) -> Void).self)
    casted(view, cmd, progressStartPoint)
}

fileprivate func set(view: UIView, progressColor: UIColor) {
    let cmd = sel_registerName("setProgressColor:")
    let method = class_getInstanceMethod(type(of: view), cmd)
    let imp = method_getImplementation(method!)
    let casted = unsafeBitCast(imp, to: (@convention(c) (Any, Selector, UIColor) -> Void).self)
    casted(view, cmd, progressColor)
}

fileprivate func set(view: UIView, progressLineWidth: CGFloat) {
    let cmd = sel_registerName("setProgressLineWidth:")
    let method = class_getInstanceMethod(type(of: view), cmd)
    let imp = method_getImplementation(method!)
    let casted = unsafeBitCast(imp, to: (@convention(c) (Any, Selector, CGFloat) -> Void).self)
    casted(view, cmd, progressLineWidth)
}

fileprivate func set(view: UIView, showProgressTray: Bool) {
    let cmd = sel_registerName("setShowProgressTray:")
    let method = class_getInstanceMethod(type(of: view), cmd)
    let imp = method_getImplementation(method!)
    let casted = unsafeBitCast(imp, to: (@convention(c) (Any, Selector, Bool) -> Void).self)
    casted(view, cmd, showProgressTray)
}

fileprivate func set(view: UIView, progress: Double, animated: Bool) {
    let cmd = sel_registerName("setProgress:animated:completion:")
    let method = class_getInstanceMethod(type(of: view), cmd)
    let imp = method_getImplementation(method!)
    let casted = unsafeBitCast(imp, to: (@convention(c) (Any, Selector, Double, Bool, Any?) -> Void).self)
    casted(view, cmd, progress, animated, nil)
}

fileprivate func set(layer: CALayer, progressBackgroundColor: UIColor) {
    let cmd = sel_registerName("setProgressBackgroundColor:")
    let method = class_getInstanceMethod(type(of: layer), cmd)
    let imp = method_getImplementation(method!)
    let casted = unsafeBitCast(imp, to: (@convention(c) (Any, Selector, UIColor) -> Void).self)
    casted(layer, cmd, progressBackgroundColor)
}
