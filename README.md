# Sample Bloc Pattern With Single State

This project is an application that utilizes the BLoC architecture pattern with a single state, Dio
for network management, and Drift for local database storage.

# The Project Contain the following technologies and libraries

[Bloc Patterns using single state](https://pub.dev/packages/flutter_bloc) along with repositories
and services, separates business logic, data access, and UI by using streams to handle state and
manage data flow. ([Bloc Pattern Documentation](https://bloclibrary.dev/getting-started/)) <br />
[Dio Network Manager](https://pub.dev/packages/dio) is responsible for making requests and
retrieving data from the remote server. <br />
[Drift Database](https://drift.simonbinder.eu/docs/getting-started/) is responsible for saving the
retrieved data from the remote server, querying data from the local database, and supporting offline
functionality. ([Drift Database Documentation](https://pub.dev/packages/drift)) <br />
[Cached Network Image](https://pub.dev/packages/cached_network_image) is a package that it is
responsible for loading the images and supports offline functionality.  <br />

> [!IMPORTANT]  
> Similar project with :point_right: [SampleDriftDatabaseWithBlocPattern](https://github.com/NicosNicolaou16/SampleDriftDatabaseWithBlocPattern) :point_left: <br />

# Versioning

Flutter SDK version: 3.32.4 <br />
Dart Version: 3.8.1 <br />

# Feeds/Urls/End Point (parsing some data from the response)

## (Links References for Ends Points)

https://github.com/r-spacex/SpaceX-API (GitHub) <br />
https://docs.spacexdata.com/?version=latest (Postman) <br />

# References

https://bloclibrary.dev/#/flutterinfinitelisttutorial <br />
https://bloclibrary.dev/#/gettingstarted <br />
https://bloclibrary.dev/#/fluttertimertutorial?id=flutter-timer-tutorial <br />
https://ppantaleon.medium.com/flutter-blocbuilder-vs-blocconsumer-vs-bloclistener-a4a3ce7bfa9a <br />
https://stackoverflow.com/questions/59188021/why-usually-theres-a-repository-layer-on-bloc-pattern <br />
https://stackoverflow.com/questions/73811123/how-to-stop-dio-get-when-the-internet-is-off <br />
https://stackoverflow.com/questions/61381265/stop-showing-error-from-http-or-dio-request <br />
https://pub.dev/packages/dio#handling-errors <br />