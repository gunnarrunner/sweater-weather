## Overview

Sweater Weather is a fictitious backend rails application that has a front end application that calls on its endpoints. The Front end can call on a variety of endpoints that utilize multiple different API's depending on what the goal of the front end. API's used in this application are Unsplash developers for utilization of pictures. Mapquest Developer to give directions for a road trip and the trip timing along with latitude and longitude that was utilized for the Openweather API which was used to get the weather for a desired location or for the road trip. The last API used was a Open Library API to find a number of titles with a certain perameter passed in and to get certain book information. All API's used had an API key that has to be used to access these API endpoints for each application. To do this one has to go to each website and sign up with a profile to get a key and implement that into the app.

Main Learning Goals for this Application:
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer
<br>

## Versions
- Ruby 2.7.2
- Rails 5.2.6

## Gems Used
- rspec-rails
- factory_bot_rails
- faker
- pry
- rubocop-rails
- simplecov
- webmock
- vcr
- shoulda-matchers
- figaro
- faraday
- fast_jsonapi
<br>

## Installation
1. Fork and Clone this repo
2. Change into sweater_weather directory
3. Install all gems using `bundle install`
4. Create and Migrate the database `rails db:{create,migrate,seed}`
5. Create an account with [Open Weather Map](https://openweathermap.org/api/one-call-api), [MapQuest](https://developer.mapquest.com/documentation/geocoding-api/), [Unsplash](https://unsplash.com/developers).
6. After creating accounts for all of these install the figaro gem `bundle exec figaro install`
7. Add API keys for your accounts to `application.yml` that was produced by figaro in the `config folder`
<br>

## Endpoints

For a more responsive and enteractive response installing/using [Postman](https://www.postman.com/) will enhance the experience. For accessing these end points provided you will have to run `rails server` or `rails s` to spin up your localhost url. Then utilizing the base path of `http://localhost:3000/` the end points get supplied at the end of this url and can get the response that the front end desires depending on the type of call.

- `GET /api/v1/forecast?location={location in the US}`
  - For this endpoint it delivers the current forecast as well as the forecast for the next 8 hours as well as the next 5 days. The location can be anywhere in the U.S. as the location can be given as 'denver,co'.
- `GET /api/v1/backgrounds?location={location in the US}`
  -  For this endpoint it delivers a picture of whatever city is dilevered in the param of this request. Similiar to forecast it can be implemented as any location in the world such as 'denver,co'. The credit for Unsplash and the photographer are delivered in the response along with the profiles and urls.
- `GET /api/v1/book-search?location={location in the US}&quantity={Integer}'`
  - For this endpoint it responds with a list of books dependent on the integer passed into the params of the url. The book is dependent on what you pass into the location. Such as typing in 'Egypt' will get you all the books associated with Egypt. It will show the isbn number as well as the title and author.
- `POST /api/v1/users'`
  - This endpoint is being used a post method to register a user if they supply the correct information into the front end registration page. The information is passed through the body of the request and the params of the url due to security concerns and keeping the users information secure. That information passed is then stored in the database if all requirments are met.
- `POST /api/v1/sessions'`
  - This endpoint is another post method that starts a user session if they already exist in the database. The front end is sending a request to authenticate a user and similar to the registration endpoint the information is getting sent through the body to secure the user. If he user exists and authenticated the response sends the front end an api key for that users authentication.
- `POST /api/v1/road_trip`
  - For the last endpoint it is also a post method due to using an api key to authenticate a registed user and being able to supply whomever the information needed. The frontend is needing information for a road trip for a user which needs a origin location and a destination along with an api key. These are needed to find the best and fastest route for the user via MapQuest API. Again inforamtion is stored in the body of the response to protect users information.


# sweater-weather
