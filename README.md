# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

📝 `NOTE - PASTE PART 2 SNIPPET HERE:` Paste the README template for part 2 of this assignment here at the top. This will show a history of your development process, which users stories you completed and how your app looked and functioned at each step.

---

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [ ] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [ ] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [ ] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [ ] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.

### App Walkthrough GIF
`TODO://` Add the URL to your animated app walkthough `gif` in the image tag below, `YOUR_GIF_URL_HERE`. Make sure the gif actually renders and animates when viewing this README. (🚫 Remove this paragraph after after adding gif)

<img src="YOUR_GIF_URL_HERE" width=250><br>

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
* Remove all traces of pods
	1. 
```sh
sudo gem install cocoapods-deintegrate
```
	2. 
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
