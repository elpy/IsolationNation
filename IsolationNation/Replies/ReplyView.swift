/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ReplyView: View {
  var messageID: String
  var username: String
  var messageBody: String
  var createdAt: Date?

  let dateFormatter = DateFormatter()

  func dateFormatted(_ date: Date?) -> String {
    guard let date = date else { return "" }
    dateFormatter.dateFormat = "HH:mm EEEE MMMM d"
    return dateFormatter.string(from: date)
  }

  var body: some View {
    Group {
      HStack(alignment: .top) {
        UserAvatar(username: username)
          .frame(width: 25, height: 25, alignment: .center)
        VStack(alignment: .leading) {
          HStack(alignment: .lastTextBaseline) {
            Text(username)
              .font(.caption)
              .fontWeight(.bold)
            Text(dateFormatted(createdAt))
              .font(.caption)
          }
          Text(messageBody)
            .font(.body)
        }
      }
    }
    .padding()
    .background(Color.backgroundColor)
  }
}

struct ReplyView_Previews: PreviewProvider {
  static var previews: some View {
    ReplyView(
      messageID: "0",
      username: "Charlie",
      messageBody: "Absolutely - do you want to give me a list?",
      createdAt: Date()
    )
  }
}
