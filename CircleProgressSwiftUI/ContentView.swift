//
//  ContentView.swift
//  CircleProgressSwiftUI
//
//  Created by Jinwoo Kim on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var progressStartPoint: CircleProgressView.ProgressStartPoint = .top
    @State private var progressColor: Color = .blue
    @State private var progressLineWidth: CGFloat = 20.0
    @State private var showProgressTray: Bool = false
    @State private var progress: Double = 0.3
    @State private var progressBackgroundColor: Color = .gray
    
    var body: some View {
        VStack {
            CircleProgressView(progress: progress)
                .progressStartPoint(progressStartPoint)
                .progressColor(progressColor)
                .progressLineWidth(progressLineWidth)
                .showProgressTray(showProgressTray)
                .progressBackgroundColor(progressBackgroundColor)
            
            Form {
                Section {
                    Button("progressStartPoint = .top") { 
                        progressStartPoint = .top
                    }
                    Button("progressStartPoint = .left") { 
                        progressStartPoint = .left
                    }
                    Button("progressStartPoint = .bottom") { 
                        progressStartPoint = .bottom
                    }
                    Button("progressStartPoint = .right") { 
                        progressStartPoint = .right
                    }
                }
                
                Section {
                    Button("progressColor = .blue") { 
                        progressColor = .blue
                    }
                    Button("progressColor = .red") { 
                        progressColor = .red
                    }
                }
                
                Section {
                    Button("progressLineWidth += 5.0") { 
                        progressLineWidth += 5.0
                    }
                    Button("progressLineWidth -= 5.0") { 
                        progressLineWidth -= 5.0
                    }
                }
                
                Section {
                    Button("showProgressTray.toggle()") { 
                        showProgressTray.toggle()
                    }
                }
                
                Section {
                    Button("progress += 0.1") { 
                        progress += 0.1
                    }
                    Button("progress += 0.1 (Animation)") { 
                        withAnimation { 
                            progress += 0.1
                        }
                    }
                    Button("progress -= 0.1") { 
                        progress -= 0.1
                    }
                    Button("progress -= 0.1 (Animation)") { 
                        withAnimation { 
                            progress -= 0.1
                        }
                    }
                }
                
                Section {
                    Button("progressBackgroundColor = .gray") { 
                        progressBackgroundColor = .gray
                    }
                    Button("progressBackgroundColor = .black") { 
                        progressBackgroundColor = .black
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
