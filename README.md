# Flickster

Flickster is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

---
## Flickster Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF
<img src="https://github.com/henrylao/Flickster-IOS/blob/main/docs/unit-2-demo.gif" width=400><br>


### Notes
Describe any challenges encountered while building the app.

## Flickster Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [ ] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### App Walkthrough GIF

<img src="https://github.com/henrylao/Flickster-IOS/blob/main/docs/flickster-core-req-demo.gif" width=400><br>
<img src="https://github.com/henrylao/Flickster-IOS/blob/main/docs/demo-my-iphone.gif" width=400><br>


### Notes
* IOS Swift Storyboard == Android XML
	- a bit more better integrated, Android requires a bit more manual calling of scenes whereas a storyboard can contain multiple/different scenes
* swift == java
* Cocoa touch class for creating a view controller
* Add images by drag and drop into the opened Assets folder
* Launch screen is essentially a static display, can't link w/ code
* Use UITableView
* Adopt a strict approach when following and using the code when practicing/learning the basics
* IMPORTANT: configure project to use Storyboard as the main UI
* ensure DEBUG is disabled ie ensure breakpoints are turned off b/c the DEBUG mode is not the usual intelliji UI
* Outlets are similar to Android's view.findSomeViewVar(R.id.someViewVariable)
* Swift requires casting of objects -- to what extent? does it only apply to strings, UDTs? what about integers, floats, doubles

Pod Notes:
* Usage of pods require opening the xcode project file from the <proj_name>.xcworkspace file instead of the <proj_name>.xcodeproj
* Initialize the pod
```sh
pod init
```
* Installing external dependencies
```sh
pod install
```
* Remove all traces of pods<br>
1. Install tool for removing all traces of pods 
```sh
sudo gem install cocoapods-deintegrate
```
2. Run command in project 
```sh
pod deintegrate
```


Creating a table viewer(Design):
1. Select [+] from top right
2. Select table view and resize appropriately 
3. Do ctrl + drag on table view to the associated controller code

Creating a table viewer(Code):
1. inherit from the necessary classes: UIViewController, UITableViewDataSource, UITableViewDelegate
2. Implement the required funcs as a result of inheritance
3. Implement client fetching of data within the controller viewDidLoad
4. Call reloading of the TableView member variable after the client completes data fetching

Debugging Reminders:
* utilize print statements to be called within each func -- "sprinkling breadcrumbs"
* "key-compliant" error due to outlet
