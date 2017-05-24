# NYU Classrooms
By Matthew Tessler and Jonathan Philippou

### NOTE
If you download the repository, the code will not work immediately. You need to get API keys for the Google Maps API and the Google Maps Geocoding API. For our app, we stored these in another Swift file (that we had git ignore). In this Swift file, put the two API keys as constant variables (" let apiKey = "" "). Google Maps API key variable should be called "apiKey" and the Geocoding API key should be called "gcAPIKey". Then the code will run. 

### Overview
NYU Classrooms is the simple iOS app for finding where your classes are. Enter an NYU building code and the app will display on a Google Map that location. That address can be exported to the Google Maps app or website. Additionally, users can save their favorite building codes in local storage. Built with Swift, the Google Maps API and Google Maps Geocoding API.


### Functions of app
  * The map displays marker at address associated with a building code
  * User can save classes for themselves
  * We scraped all of the [NYU Building Codes](http://www.nyu.edu/students/student-information-and-resources/registration-records-and-graduation/registration/classroom-locations.html) from the web and saved them into a JSON file and a dictionary in Swift


 
