## Planet Explore - Star Wars Planet Finder App (iOS)

This application can be able to view all Star wars planet details.

## Demo of App
![Demo App](/demo/demo.gif)

## Architecture and libraries
The Project follows the MVVM architectural pattern and uses the [RxSwift](https://github.com/ReactiveX/RxSwift) and RxCocoa libraries to configure the bindings between views and view models. On the network layer, uses [Alamofire](https://github.com/Alamofire) library.

__The general explanation of the MVVM pattern are the following:__

All the transformation of the data necessary to represent the model's data into the app's views will be implemented by the ViewModels and exposed to the ViewController as properties. The responsibility of ViewController is to bind the properties of viewModel to the views and redirects all the user interactions to the ViewModel. In this way, the state of the application will always be synchronized between the Views and the ViewModels.

__The main rules proposed by the MVVM pattern are:__
- Every Model is owned by a ViewModel and ignores the existence of the ViewModel.
- Every ViewModel is owned by a ViewController and ignores the existence of the ViewController.
- The ViewController owns the ViewModel and mustn't know anything about the model.

__The key benefits of the pattern are:__
- Provides a good encapsulation of the business logic and the model's data-transformation.
- Facilitates the creation of unitary tests.
- The ViewControllers are lighter compared to the MVC pattern (so you can avoid the so called Massive ViewController problem).

## List of Classes group by responsibilities:

__View__
- MainVC : Shows the list of the Star wars planets.
- PlanetDetailVC : Shows the detail of a Planet.

__View Models__
- PlanetViewModel : Business logics of Planets View functionality.

__Model__
- Planet : contains a model which serve as DTOs (data transfer objects) to get all planets API data.

__Network layer: API queries__
- PlanetRemoteService : the get all planets, provides an implementation of get all planet details functions.



