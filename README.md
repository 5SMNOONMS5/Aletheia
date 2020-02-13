# Aletheia

The goal is to save time for your day. 
This project contains a bunch of code to help your common problems like get Screen bounds, size, width and value from .plist files. 
Beside that, this project is a umbrella framework. For now [Log](https://github.com/delba/Log) is include by default, but you also clone this project with  [Alamofire](https://github.com/Alamofire/Alamofire) and [Kingfisher](https://github.com/onevcat/Kingfisher).

[![CI Status](https://img.shields.io/travis/chen stephen/Aletheia.svg?style=flat)](https://travis-ci.org/chen stephen/Aletheia)
[![Version](https://img.shields.io/cocoapods/v/Aletheia.svg?style=flat)](https://cocoapods.org/pods/Aletheia)
[![License](https://img.shields.io/cocoapods/l/Aletheia.svg?style=flat)](https://cocoapods.org/pods/Aletheia)
[![Platform](https://img.shields.io/cocoapods/p/Aletheia.svg?style=flat)](https://cocoapods.org/pods/Aletheia)


## Example

To run the example project, clone the repo, navigate to `Example` folder and run `pod install` from the Example directory first.

## Requirements

## Installation

Aletheia is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Aletheia'
```

Installation with [Alamofire](https://github.com/Alamofire/Alamofire) and [Kingfisher](https://github.com/onevcat/Kingfisher)

```ruby
pod 'Aletheia/Network'
```

## How to use

#### Import

```swift
import Aletheia
```

#### Namespace

Aletheia using `al` as a namespace to encapsulate functions.

For string

```swift
let aDate = "2019-02-13"
aDate.al.toDateStringFormat("yyyy", oldFormat: "yyyy-MM-dd") /// 2019   

let aURL = "https://www.example.com"
aURL.al.toURL()   /// Optional(https://www.example.com) ( URL Type )
```

For date

```swift
let date = Date().al.toString() /// 2020-02-13 14:10:50
```

For Screen

```swift
ALScreen.width
ALScreen.height
```

For System

```swift

ALSystems.getAppVersion

ALSystems.getAppBundleID
```

## Author

chen stephen, tasb00429@gmail.com

## License

Aletheia is available under the MIT license. See the LICENSE file for more info.
