# Moya Laconic Plugin

A [Moya](https://github.com/Moya/Moya) [plugin](https://github.com/Moya/Moya/blob/master/docs/Plugins.md) for one-line logs.

## Usage

MoyaLaconicPlugin logs your Moya requests and their responses using a short message for each.  
In an application with many network calls, sometimes it is enough to just know when a request is fired and when its response comes back.
  
Let your [Moya targets](https://github.com/Moya/Moya/blob/master/docs/Targets.md) conform to the [Laconic protocol](https://github.com/phi161/MoyaLaconicPlugin/blob/master/MoyaLaconicPlugin/Classes/Laconic.swift) and assign an identifier to your endpoints:

```
extension HTTPCatTarget: Laconic {
    var primaryIdentifier: String {
        return "🐈"
    }
    var secondaryIdentifier: String {
        switch self {
        case .catOk:
            return "😸"
        case .catNotFound:
            return "😿"
        }
    }
}
```

You are free to assign any string to your endpoints, they will appear in the following order: `pluginIdentifier``primaryIdentifier``secondaryIdentifier`

MoyaLaconicPlugin will use these and write into the Console an one-line message, together with the status code of each response:

```
1982-03-19 22:10:46.692489+0300 MoyaLaconicPlugin_Example[3565:3675403] 💭🐈🔜😿
1982-03-19 22:10:46.766139+0300 MoyaLaconicPlugin_Example[3565:3675154] 💭🐈🔙✅😿 (HTTP 200)
```

By default, the plugin uses:

* 💭 as a top-level identifier to help filter out messages related to networking
* 🔜 for requests
* 🔙 for resposnes
* ✅ for representing `.success`
* ❌ for representing `.failure`

It's easy to use your own strings by using the plugin's initializer:

```swift
LaconicPlugin(pluginIdentifier: "*️⃣", requestIdentifier: "➡️", responseIdentifier: "⬅️", successIdentifier: "🆗", failureIdentifier: "🆖")
```

Then the logs above would become:

```
1982-03-19 22:10:46.692489+0300 MoyaLaconicPlugin_Example[3565:3675403] *️⃣🐈➡️😿
1982-03-19 22:10:46.766139+0300 MoyaLaconicPlugin_Example[3565:3675154] *️⃣🐈⬅️🆗😿 (HTTP 200)
```


To activate the plugin, add it in the array of plugins when creating the Moya provider:

```swift
provider = MoyaProvider<MultiTarget>(plugins: [ LaconicPlugin(), /* other plugins */ ])
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MoyaLaconicPlugin is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MoyaLaconicPlugin'
```

## License

MoyaLaconicPlugin is available under the MIT license. See the LICENSE file for more info.
