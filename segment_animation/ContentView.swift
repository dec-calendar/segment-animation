//
//  ContentView.swift
//  segment_animation
//
//  Created by 大澤清乃 on 2024/12/04.
//

import SwiftUI

struct ContentView: View {
    @State private var state: SegmentedControlState = .option1
    @Namespace private var segmentedControl
    var body: some View {
        HStack(spacing: 10) {
            ForEach(SegmentedControlState.allCases) { state in
                Button {
                    withAnimation {
                        self.state = state
                    }
                } label: {
                    Text(state.rawValue)
                        .padding(10)
                }
                .matchedGeometryEffect(
                    id: state,
                    in: segmentedControl)
            }
        }
        .background(
            Capsule()
                .fill(.background.tertiary)
                .matchedGeometryEffect(
                    id: state,
                    in: segmentedControl,
                    isSource: false)
        )
        .padding(4)
        .background(.indigo)
        .clipShape(Capsule())
        .buttonStyle(.plain)
    }
}

#Preview {
    ContentView()
}

enum SegmentedControlState: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case option1 = "Option 1"
    case option2 = "Option 2"
    case option3 = "Option 3"
}
