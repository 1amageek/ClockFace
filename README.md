# ClockFace
ClockFace is a highly customizable Swift component that represents a clock face, divided into sectors, each containing custom content. This View is part of the SwiftUI framework and can be embedded into your iOS or macOS applications. It was designed to be flexible and to be used in any situation where you need a circular layout.

![スクリーンショット 2023-06-06 18 30 23](https://github.com/1amageek/ClockFace/assets/11146538/4ba83ede-1889-40ad-8e11-775a78755894)

## Features
Clock face divided into a specified number of divisions.
Customizable length of marks on the clock face.
Customizable content at each mark.
Easy integration into your SwiftUI application.

## Usage
Here is a simple example of how to use the ClockFace component in your application:

```swift
import SwiftUI
import ClockFace

struct ContentView: View {
    var body: some View {
        ClockFace(0..<12, step: 1, divisions: 60, markLength: 12) { index in
            Text("\(index)")
        }
    }
}
```


This code creates a clock face with 60 divisions, with a text label at each hour position (from 0 to 11). The length of the mark for each hour is 12.

## Customization
You can customize the content of each mark by passing a closure to the ClockFace initializer. The closure receives an integer representing the current mark and returns a View that SwiftUI renders at the position of the mark.

```swift
ClockFace(0..<60, step: 5, divisions: 60, markLength: 12) { index in
    if index % 5 == 0 {
        Text("\(index)")
    } else {
        Rectangle()
            .fill(Color.secondary)
            .frame(width: 1, height: 12)
    }
}
```
