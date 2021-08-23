//
//  WrappersProperties.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 17/08/21.
//

import SwiftUI

struct WrappersProperties: View {
    var body: some View {
        ItemList()
    }
}

struct WrappersProperties_Previews: PreviewProvider {
    static var previews: some View {
        WrappersProperties()
    }
}

//MARK: - Examples

//@StateObject
//@EnvironmentObject
//@ObservedObject
//@State

//MARK: - @State
class DataSource: ObservableObject {
  @Published var counter = 0
}

struct Counter: View {
    @ObservedObject var dataSource = DataSource()

  var body: some View {
    VStack {
      Button("Increment counter") {
        dataSource.counter += 1
      }
        
      Text("Count is \(dataSource.counter)")
        
    }
  }
}

struct ItemList: View {
  @State private var items = ["hello", "world"]

  var body: some View {
    VStack {
      Button("Append item to list") {
        items.append("test")
      }

      List(items, id: \.self) { name in
        Text(name)
      }

        Counter()
    }
  }
}

//MARK: - @Binding
struct StateView: View {
  @State private var intValue = 0

  var body: some View {
    VStack {
      Text("intValue equals \(intValue)")

      BindingView(intValue: $intValue)
    }
  }
}

struct BindingView: View {
  @Binding var intValue: Int

  var body: some View {
    VStack {
        Button("Increment") {
            intValue += 1
        }.padding()
        Text("intValue equals \(intValue)")
    }
  }
}

//MARK:- @StateObject
class DataProvider: ObservableObject {
  @Published var currentValue = "a value"
}

@available(iOS 14.0, *)
struct DataOwnerView: View {
  @StateObject private var provider = DataProvider()

  var body: some View {
    Text("provider value: \(provider.currentValue)")
  }
}

//MARK:- @ObservedObject
@available(iOS 14.0, *)
struct DataOwnerView2: View {
  @StateObject private var provider = DataProvider()

  var body: some View {
    VStack {
      Text("provider value: \(provider.currentValue)")

      DataUserView(provider: provider)
    }
  }
}

struct DataUserView: View {
  @ObservedObject var provider: DataProvider

  var body: some View {
    // create body and use / modify `provider`
    Text("Hello world")
  }
}

//MARK:- @EnvironmentObject
struct EnvironmentUsingView: View {
  @EnvironmentObject var dependency: DataProvider

  var body: some View {
    Text(dependency.currentValue)
  }
}

@available(iOS 14.0, *)
struct MyApp: App {
  @StateObject var dataProvider = DataProvider()

  var body: some Scene {
    WindowGroup {
      EnvironmentUsingView()
        .environmentObject(dataProvider)
    }
  }
}
