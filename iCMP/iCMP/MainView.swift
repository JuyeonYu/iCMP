//
//  MainView.swift
//  iCMP
//
//  Created by  유 주연 on 8/13/24.
//

import SwiftUI

struct MainView: View {
  @State private var timer: Timer? = nil
  @State private var inputText: String = ""
  @State private var copieds: [ClipboardContent] = [.init(string: "")]
  var body: some View {
    VStack {
      ScrollView {
        LazyVStack(
          spacing: 15, content: {
            ForEach(0 ..< copieds.count, id: \.self) { row in
              let copied = copieds[row]
              Text(copied.string)
                .background(copied.os == OS.current.rawValue ? .gray : .yellow)
            }
          }
        )
      }
      .background(.red)
      
        HStack {
          TextField("", text: $inputText)
          Button("copy") {
            
          }
        }
      }
      
      .padding()
        .task {
          pollingClipboard()
        }
    }
  
  private func pollingClipboard() {
    timer = .scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
      var copied: String?
      
#if os(iOS)
//      if let string = UIPasteboard.general.string {
//        copied = string
//      }
      if UIPasteboard.general.string != copieds.last?.string {
print(123)
      }
#elseif os(macOS)
      let pasteboard = NSPasteboard.general
      if let string = pasteboard.string(forType: .string) {
        copied = string
      }
      
#endif
      
      
      if let copied, copied != copieds.last?.string {
        copieds.append(.init(string: copied))
        
      }
    })
  }
  
  
}

#Preview {
  MainView()
}
