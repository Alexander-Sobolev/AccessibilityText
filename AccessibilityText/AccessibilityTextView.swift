//
//  AccessibilityTextView.swift
//  AccessibilityText
//
//  Created by Alexander Sobolev on 27.8.23..
//

import SwiftUI

struct AccessibilityTextView: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 30))
                            
                            Text("Welcome to my app")
                                .truncationMode(.tail)
                        }
                        .font(.title)
                        
                        Text("This is some longer text that expands to multiple lines")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(3)
                            .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                    }
//                    .frame(height: 100)
                    .background(.red)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Title Welcome")
        }
    }
}

extension ContentSizeCategory {
    
    var customMinScaleFactor: CGFloat {
        switch self {
        case .extraSmall, .small, .medium:
            return 1.0
        case .large, .extraLarge, .extraExtraLarge:
            return 0.8
        default:
            return 0.6
        }
    }
}

struct AccessibilityTextView_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilityTextView()
    }
}
