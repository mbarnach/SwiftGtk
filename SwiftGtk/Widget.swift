//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Foundation
import Gtk

public class Widget {
    var signals: [UInt] = []
    var widgetPointer: UnsafeMutablePointer<GtkWidget>
    
    public weak var parentWidget: Widget? {
        willSet {
            
        }
        didSet {
            if parentWidget != nil {
                selfCopy = self
                didMoveToParent()
            } else {
                selfCopy = nil
                didMoveFromParent()
                removeSignals()
            }
        }
    }
    var selfCopy: Widget?
    
    init() {
        widgetPointer = nil
    }
    
    private func removeSignals() {
        for handlerId in signals {
            disconnectSignal(widgetPointer, handlerId: handlerId)
        }
    }

    func didMoveToParent() {
        
    }
    
    func didMoveFromParent() {
        
    }
    
    public func showAll() {
        gtk_widget_show_all(widgetPointer)
    }
    
    public func showNow() {
        gtk_widget_show_now(widgetPointer)
    }
    
    public func show() {
        gtk_widget_show(widgetPointer)
    }
    
    public func hide() {
        gtk_widget_hide(widgetPointer)
    }
}