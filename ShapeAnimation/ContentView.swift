//
//  ContentView.swift
//  ShapeAnimation
//
//  Created by Mike Pollard on 29/09/2023.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var shapeAnimation
    @State private var size: CGFloat = 100

    var body: some View {
        VStack {
            Spacer()

            Button("Change") {
                withAnimation(.linear(duration: 1.0)) {
                    size = size == 100 ? 200 : 100
                }
            }

            Spacer()

            if size == 100 {
                Circle()
                    .fill(.red)
                    .frame(width: size, height: size)
            } else {
                Rectangle()
                    .fill(.blue)
                    .frame(width: size, height: size)
            }

            Spacer()

            if size == 100 {
                Circle()
                    .fill(.red)
                    .matchedGeometryEffect(id: "shape", in: shapeAnimation)
                    .frame(width: size, height: size)
            } else {
                Rectangle()
                    .fill(.blue)
                    .matchedGeometryEffect(id: "shape", in: shapeAnimation)
                    .frame(width: size, height: size)
            }

            Spacer()

            RoundedRectangle(cornerRadius: size == 100 ? size / 2 : 0)
                .fill(size == 100 ? .red : .blue)
                .frame(width: size, height: size)

            Spacer()
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
