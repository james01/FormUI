# FormUI

[![CocoaPods](https://img.shields.io/cocoapods/v/FormUI)](https://cocoapods.org/pods/FormUI)
![Platform](https://img.shields.io/cocoapods/p/FormUI?logo=Apple)

Powerfully simple form builder for UIKit.

---

## Overview

FormUI provides an easy way to build native forms for iOS. It is inspired by SwiftUI and takes advantage of new technologies like Combine and result builders. However, it is entirely implemented in UIKit which gives it more options for customization.

FormUI aims to be lightweight and unopinionated. It solves the troublesome parts of making forms—like counting sections and hiding rows—but leaves you to fill in the details for your specific use case.

---

## Examples

| ![New Event](https://raw.githubusercontent.com/james01/FormUI/main/Docs/Images/Event.gif) | ![Profile](https://raw.githubusercontent.com/james01/FormUI/main/Docs/Images/Profile.gif) | ![Display Settings](https://raw.githubusercontent.com/james01/FormUI/main/Docs/Images/Display.gif) |
| :---------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------: |

---

## Requirements

- iOS 13.0+
- Swift 5.3+

---

## Installation

### Swift Package Manager

To install FormUI using the [Swift Package Manager](https://swift.org/package-manager/), add the following value to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/james01/FormUI.git", .upToNextMajor(from: "0.1.1"))
]
```

---

## Usage

### Creating a Form

Create a form by subclassing `FormViewController`.

```swift
import FormUI

class MyFormViewController: FormViewController {

    convenience init() {
        self.init(style: .grouped)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        form = Form {
            Section {
                Row(style: .default) { (cell) in
                    cell.textLabel?.text = "Hello World"
                }
            }
        }
    }
}
```

> The `Form` and `Section` initializers take advantage of the _result builder_ feature of Swift that was unofficially introduced in Swift 5.1, and officially introduced in Swift 5.4.

### Handling Row Selection

Handle row selection by passing a handler to the `onSelect(_:)` method of a row. This handler will be called every time the row is selected.

```swift
Row(style: .default) { (cell) in
    cell.textLabel?.text = "Tap Me"
}.onSelect { (tableView, indexPath) in
    tableView.deselectRow(at: indexPath, animated: true)
    print("Hello World")
}
```

### Dynamically Hiding and Showing Rows

FormUI makes it easy to hide and show rows. This is an otherwise complicated task when using the default `UITableView`.

First, define a published variable to keep track of whether the row is hidden.

```swift
@Published var isRowHidden = true
```

Then, pass the projected value of that variable (i.e., `$isRowHidden`) to the `hidden(_:)` method on the row you want to hide. Every time `isRowHidden` changes its value, the row will automatically show or hide itself.

> For more information on the `Published` property wrapper, see its [documentation](https://developer.apple.com/documentation/combine/published).

```swift
Section {
    Row(style: .default) { (cell) in
        cell.textLabel?.text = "Tap to Toggle Row"
    }.onSelect { (tableView, indexPath) in
        tableView.deselectRow(at: indexPath, animated: true)
        self.isRowHidden.toggle()
    }

    Row(style: .default) { (cell: UITableViewCell) in
        cell.textLabel?.text = "Hidden"
    }.hidden($isRowHidden)

    Row(style: .default) { (cell) in
        cell.textLabel?.text = "Not Hidden"
    }
}
```

<img src="https://raw.githubusercontent.com/james01/FormUI/main/Docs/Images/Hidden.gif" width="292" />

You can hide and show sections in a similar way.

### Using `ForEach`

Oftentimes you'll want to generate rows or sections from a static data source such as an enum. Use `ForEach` in these situations.

```swift
enum Theme: String, CaseIterable {
    case light
    case dark
    case system
}

...

Section(header: "Theme") {
    ForEach(Theme.self) { (theme) -> Row in
        Row(style: .default) { (cell) in
            cell.textLabel?.text = theme.rawValue.capitalized
        }
    }
}
```

<img src="https://raw.githubusercontent.com/james01/FormUI/main/Docs/Images/ForEach.png" width="292" />

`ForEach` can also be used with an array of data.

```swift
let desserts = [
    "🍪 Cookies",
    "🍫 Chocolate",
    "🍦 Ice Cream",
    "🍭 Candy",
    "🍩 Doughnuts",
    "🍰 Cake"
]

...

Section(header: "Desserts") {
    ForEach(0..<desserts.count) { (n) -> Row in
        Row(style: .default) { (cell) in
            cell.textLabel?.text = desserts[n]
        }
    }
}
```

<img src="https://raw.githubusercontent.com/james01/FormUI/main/Docs/Images/ForEach2.png" width="292" />

---

## Author

James Randolph ([@jamesrandolph01](https://twitter.com/jamesrandolph01))

---

## License

FormUI is released under the MIT license. See [LICENSE](LICENSE) for details.
