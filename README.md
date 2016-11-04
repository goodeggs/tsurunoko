# Tsurunoko

An experiment in re-architecting persimmon, the Good Eggs shopping iOS app, using Redux.

[NPR on tracking the elusive chocolate persimmon](http://www.npr.org/sections/thesalt/2012/11/08/164696316/tracking-the-elusive-chocolate-persimmon)

## Install
- Download the project
- Open workspace in Xcode
- Run

## Key Patterns

### `ReSwift` (Redux)
- Global `Store` of immutable state
- Notifies subscribers on change
- Listens for `Action`s
- `Reducer`s - pure functions used to update state

### `Component`
A pattern for assigning clear responsibility to a set of parts, roughly equivalent to a ViewController + DataSource in Persimmon

#### `ComponentInterface`
- Essentially a factory that creates and links together the parts that make up a `Component`
- Inputs are a `Store` (injected into the `Presenter` and `Router`) and a `ViewController` (injected into the `Router`, used for presentation)
- Currently where `Action`s originating from the `Component` are defined but I expect there will be `Action`s triggered from multiple `Component`s so this will probably change

#### `Presenter`
- Mediates between a `ViewController` and the `Store`
- Strong reference to the `Store`
- `ViewController` controls subscribe / unsubscribe from `Store` updates
- Exposes an interface of domain methods which the `ViewController` calls when appropriate, translates these into `Action`s and dispatches them to the `Store`
- Weak reference to the `ViewController` via an interface which only exposes a render method
- Translates `Store` state into a `ViewModel` and passes it to render method on `ViewController`

#### `Router`
- In charge of creating (via the `ComponentInterface`) and presenting the next `Component`
- Also dismisses the next `Component`
- Sets the next `Component`'s `Router` to handle subsequent route changes
- Injects the `Store` and presenting `ViewController` into the next `Component`
- Triggered by a change in the `Store`’s `NavigationState`

#### `ViewController`
- In charge of displaying `View`s and low level user interactions triggered by them (e.g. button tap)
- Has a strong reference to a `Presenter` on which it calls methods on in response to `View` interactions
- Defines a `render` method and updates all `View`s when this is called, may store the `ViewModel` provided, and re-render from this state at an arbitrary time (e.g. table view) but should have no other state
- UI commonly defined by a single storyboard file, could also be an `UIAlertController` or some other `UIKit` `UIViewController` subclass
- Can consist of multiple child `ViewController`s

#### `ViewModel`
- POSO stated in terms of the properties on the `View`s 


#### `View`
- Either a `UIView` (most of the time) or a `UIViewController`

## The Best Parts

- `ViewController` easily testable due to minimal interdependencies
- Fully specifies navigation state allowing routing to arbitrary screens
- Separates `DataModel` from `ViewModel`
- Improves logging by making state changes adopt a uniform method and interceptable by middleware
- Decouples component creation from `Router`
- Separates monolithic `Router` into composable hierarchy
- Minimal surface area between and within `Component`s
- Avoid reaching up the `ViewController` hierarchy to perform complex screen transitions
- Encourages all `View`s to render at the same time to display a consistent state
- Decouples data load and view render, all `ViewController`s should be able to display some sort of empty state
- Minimal setup needed in `AppDelegate` (a common place for catch-all logic)

## Road Map

- `ComponentInterface` needs some work to be testable (too many static methods)
- Validate claims of improved testability by adding some unit tests
- Multiple navigation route hierarchy to match the functionality of tab bar
- Example of same action triggered from multiple screens
- Example of same component displayed on navigation stack vs modal
- Actions resulting in async 
- Describing the state of a network interaction / data freshness
- Optimistic state updates prior to network response
- Multi-component transitions with some portions animated and others not
- Some patterns for how to represent component specific state and granularity of reducer

## Inspiration
- https://github.com/ReSwift/ReSwift
- https://github.com/ReSwift/ReSwift-Todo-Example
- https://medium.com/mobile-travel-technologies/architecting-mobile-apps-with-b-viper-modules-e94e277c8d68
