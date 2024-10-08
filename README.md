# Weather Forecast Application
<a href="https://github.com/modish90"><img alt="License" src="https://img.shields.io/static/v1?label=GitHub&message=rakesh-kumar&color=C51162"/></a><br>
Weather is an Android application used to get all the weather information and developed using Jetpack Compose. It uses [openweathermap API](https://openweathermap.org/api).

## 📐✏️ Architecture
The app is built with the Model-View-ViewModel (MVVM) + Event Driven + Repository + Clean architecture which is used to separate the app's user interface, logic, and data.

- **Model**: Represents the data and the business logic of the app. It's the actual data and data sources, like databases or network requests.
- **View**: Represents the UI of the app. In your app, it would be the Jetpack Compose components that display the weather data to the user.
- **ViewModel**: It holds the data that the View needs, exposing this data through StateFlow.
- **UseCases**: every feature has use cases for the application like getweatherdata, searchbycityname etc.
- **Repository**: This is an additional layer between the ViewModel and the data source (in this case, the OpenWeatherMap API). The Repository centralizes the data fetching mechanism, so if in the future we decide to add another data source, such as a local database for offline caching, the ViewModel wouldn't need to know where the data is coming from. The Repository will handle data retrieval, whether it's from the API, local database, or other sources.
- **InMemoryCache**: InMemoryCache implemented using hashmap to save the search in case not available and from next onwards data will be served from saved inmemory data rather than calling the api. this way we improve the performace of the application and user experience as well.


To visualize the flow:

- User opens the app and sees the main weather screen with weather details of the default city - London.
- User types a city name into the search bar.
- The app's ViewModel, through the use cases and use cases internally calls the data layer which consists the Repository, makes a call to the OpenWeatherMap API.
- The API returns the weather data for the requested city.
- The Repository passes this data to the ViewModel.
- The ViewModel updates the View (the screen) with the fetched weather data, displaying it to the user.

In essence, this architecture ensures a separation of concerns, promoting a more scalable and maintainable codebase. It decouples the UI from the data and business logic, allowing each component to evolve independently.



