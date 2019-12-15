# 介绍

GradientButton 是一个用 Swift 写的 iOS 渐变按钮，之前在上一家公司的时候写的，这两天用 Swift 重写了一下，现在开源出来。

## 系统要求：

- iOS 8.0 及以上
- tvOS 9.0 及以上
- Swift 5.1 以上

## 安装

GradientButton 支持 CocoaPods、Carthage 和 Swift Package Manage

![Demo](https://github.com/azone/GradientButton/raw/master/demo.gif)

### GitHub 仓库

你可以拉取 [GradientButton 仓库](https://github.com/azone/GradientButton)，然后引入 `GradientButton.xcodeproj` 到您的项目来构建动态或者静态库，也可以将 `Sources` 文件夹下的文件直接拖进您的项目中。

### CocoaPods

[CocoaPods](https://cocoapods.org/) 是 Cocoa 的依赖管理工具。使用和安装请访问他们的网站。如果想使用 CocoaPods 将 `GradientButton` 集成进你的 Xcode 项目，请在您的 `Podfile` 文件中加入：

```ruby
pod 'WYZGradientButton'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) 是一个构建你的依赖和给你提供二进制框架的去中心化的依赖管理工具。想要通过 Carthage 将 GradientButton 集成至您的 Xcode 项目，请在您的 `Cartfile` 文件中指定：

```
github "azone/GradientButton" "master"
```

### Swift Package Manager（推荐）

[Swift Package Manager](https://swift.org/package-manager/) 是 Swift 官方推出的自动分发 Swift 代码的工具，已经集成进了 Swift 编译器中了。

Swift 包设置好后，在 `Package.swift` 中添加依赖：

```swift
dependencies: [
    .package(url: "https://github.com/azone/GradientButton.git", from: "0.2.0")
]
```

**如果您使用的是 Xcode 11.0 以上版本，可以简单的通过“File → Swift Packages → Add Package Depandency…”来添加。**


## 使用

### 设置基本的渐变

```swift
let button = GradientButton(type: .system)
// set gradient for normal state
let startColor = #colorLiteral(red:1.0, green:0.5647, blue:0.0, alpha:1.0)
let endColor: #colorLiteral(red:1.0, green:0.3137, blue:0.0, alpha:1.0)
let colors = [startColor, endColor]
let gradient = GradientButton.Gradient(colors: colors)
button.setGradient(gradient, for: .normal)

// set gradient for highlight state
let highlight = GradientButton.Gradient(colors: colors.map({ $0.withAlphaComponent(0.8) }))
button.setGradient(highlight, for: .highlighted)

button.setTitle("Button with gradient", for: .normal)
```

### 设置渐变并增加阴影

```swift
let button = GradientButton(type: .system)
// set gradient for normal state
let startColor = #colorLiteral(red:1.0, green:0.5647, blue:0.0, alpha:1.0)
let endColor: #colorLiteral(red:1.0, green:0.3137, blue:0.0, alpha:1.0)
let colors = [startColor, endColor]
let gradient = GradientButton.Gradient(colors: colors)
button.setGradient(gradient, for: .normal)

// set gradient for highlight state
var highlight = GradientButton.Gradient(colors: colors.reversed())
button.setGradient(highlight, for: .highlighted)

// set shadow for normal state
let shadow = NSShadow()
shadow.shadowColor = startColor
shadow.shadowBlurRadius = 8
button.setShadow(shadow, for: .normal)

// set shadow for highlight state
let highlightShadow = NSShadow()
highlightShadow.shadowColor = endColor
highlightShadow.shadowBlurRadius = 8
button.setShadow(highlightShadow, for: .highlighted)

button.setTitle("Button with gradient and shadow", for: .normal)
```

### 设置边框和单一背景色

*单一背景色本质上也是渐变色，只是开始和结束的颜色相同而已*

```swift
let button = GradientButton(type: .custom)
button.titleLabel?.font = .systemFont(ofSize: 15)

// border for normal state
let border = GradientButton.Border(color: #colorLiteral(red:1.0, green:0.5647, blue:0.0, alpha:1.0))
button.setBorder(border, for: .normal)
        
// border for highlight state
let highLightBorder = GradientButton.Border(color: #colorLiteral(red:1.0, green:0.3137, blue:0.0, alpha:1.0))
button.setBorder(highLightBorder, for: .highlighted)

// set background color for normal state
button.setBackgroundColor(.white, for: .normal)
// set background color for highlight state
button.setBackgroundColor(#colorLiteral(red:1.0, green:0.3137, blue:0.0, alpha:1.0), for: .highlighted)

button.setTitleColor(#colorLiteral(red:1.0, green:0.5647, blue:0.0, alpha:1.0), for: .normal)
button.setTitleColor(.white, for: .highlighted)

button.setTitle("Button with border and background color", for: .normal)
```

### 设置纵向渐变

```swift
let button = GradientButton(type: .system)

let startColor = #colorLiteral(red:1.0, green:0.5647, blue:0.0, alpha:1.0)
let endColor = #colorLiteral(red:1.0, green:0.3137, blue:0.0, alpha:1.0)
let colors = [startColor, endColor]
let gradient = GradientButton.Gradient(colors: colors, endPoint: .init(x: 0, y: 1))
button.setGradient(gradient, for: .normal)

var highlight = gradient
highlight.colors = colors.map({ $0.withAlphaComponent(0.8) })
button.setGradient(highlight, for: .highlighted)
```

### 嫌设置的太麻烦？GradientButton 提供了全局设置的支持

本来想使用 `UIAppearance` 来支持的，但是经过多次验证发现 Swift 下无法提供支持，如果想支持必须使用 `Objective-C` 来写，或者我使用的方式不对？还请各位大牛给与指点！

*网上搜了一下说是使用 @objc dynamic，我试了一下也是不行的。即使行，方法就没有办法了。我也看了官方文档，说是方法名需要满足一定的规则即可支持，我定义的方法已经是文档的规则了，但是...*

```swift
// set default appearance for global
let appreance = GradientButton.defaultAppearance
let startColor = #colorLiteral(red:0.1647, green:0.5137, blue:0.9529, alpha:1.0)
let endColor = #colorLiteral(red:0.3294, green:0.4784, blue:0.9804, alpha:1.0)
let gradient = GradientButton.Gradient(colors: [startColor, endColor])
appreance.setGradient(gradient, for: .normal)

let highlightStartColor = #colorLiteral(red:0.3373, green:0.6118, blue:0.9686, alpha:1.0)
let highlightEndColor = #colorLiteral(red:0.502, green:0.6157, blue:0.9961, alpha:1.0)
let highlightGradient = GradientButton.Gradient(colors: [highlightStartColor, highlightEndColor])
appreance.setGradient(highlightGradient, for: .highlighted)

let button = GradientButton(type: .system)
button1.setTitle("Button with default appearance", for: .normal)
```

最终效果如 Demo gif 所示

## 许可

GradientButton 是根据 MIT 许可发布的。详情请看 [LICENSE](https://github.com/azone/GradientButton/blob/master/LICENSE)。


