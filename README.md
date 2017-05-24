<h1>NYU Classrooms</h1>
<p>By Matthew Tessler and Jonathan Philippou</p>

<h2>A Note</h2>
<p>
If you download the repository, the code will not work immediately. You need to get API keys for the Google Maps API and the Google Maps Geocoding API. For our app, we stored these in another Swift file (that we had git ignore). In this Swift file, put the two API keys as constant variables. Google Maps API key variable should be called "apiKey" and the Geocoding API key should be called "gcAPIKey". 


'''swift

let apiKey = "THE_API_KEY_FROM_GOOGLE" // Google Maps
let gcAPIKey = "ANOTHER_API_KEY_FROM_GOOGLE" // Google Geocoding API

'''


Then the code will run. </p>

<h2>Overview</h2>
<p>NYU Classrooms is the simple iOS app for finding where your classes are. Enter an NYU building code and the app will display on a Google Map that location. That address can be exported to the Google Maps app or website. Additionally, users can save their favorite building codes in local storage. Built with Swift, the Google Maps API and Google Maps Geocoding API.</p>


<h2>Functions of app</h2>
<p>
	<ul>
		<li>The map displays marker at address associated with a building code</li>
	  	<li>User can save classes for themselves</li>
	  	<li>We scraped all of the <a href="http://www.nyu.edu/students/student-information-and-resources/registration-records-and-graduation/registration/classroom-locations.html">NYU Building Codes</a> from the web and saved them into a JSON file and a dictionary in Swift</li>
	</ul>
</p>


 
