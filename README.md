# FormUI

Powerfully simple form builder for UIKit.

## Overview

FormUI provides an easy way to build native forms for iOS. It is inspired by SwiftUI and takes advantage of new technologies like Combine and result builders. However, it is entirely implemented in UIKit which gives it more options for customization.

## Installation

FormUI is still in beta. Install it by downloading the project and dragging it into Xcode.

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

### Handling Row Selection

Pass a handler to the `onSelect(_:)` method of a row. This handler will be called every time the row is selected.

```swift
Row(style: .default) { (cell) in
    cell.textLabel?.text = "Tap Me"
}.onSelect { (tableView, indexPath) in
    print("Hello World")
    tableView.deselectRow(at: indexPath, animated: true)
}
```

### Dynamically Hiding and Showing Rows

FormUI makes it easy to hide and show rows. This is an otherwise complicated task when using the default `UITableView`.

First, define a published variable to keep track of whether the row is hidden.

```swift
@Published var isRowHidden = true
```

Then, pass the projected value of that variable to the `hidden(_:)` method on the row you want to hide. Every time `isRowHidden` changes its value, the row will automatically show or hide itself accordingly.

> For more information on the `Published` property wrapper, read its [documentation](https://developer.apple.com/documentation/combine/published).

```swift
form = Form {
    Section {
        Row(style: .default) { (cell) in
            cell.textLabel?.text = "Tap to Toggle Row"
        }.onSelect { (tableView, indexPath) in
            self.isRowHidden.toggle()
            tableView.deselectRow(at: indexPath, animated: true)
        }

        Row(style: .default) { (cell) in
            cell.textLabel?.text = "This is a hidden row."
        }.hidden($isRowHidden)
    }
}.rowAnimation(.middle)
```

You can hide and show sections in a similar way.

## Author

James Randolph ([@jamesrandolph01](https://twitter.com/jamesrandolph01))

## License

FormUI is released under the MIT license. See [LICENSE](LICENSE) for details.
