NOTE: RUN THIS BEFORE RAILS S
  - bin/rails assets:precompile

### rails new __APPNAME__
  - creates ruby application

### bundle
  - install gems (dependencies)

### rails
  - run server

### HTTP requests
  - GET
  - POST
  - PUT/PATCH
  - DELETE

### MVC Architecture
  GET /about HTTP/1.1
  Host: 127.0.0.1

  ## Routes
    matchers for the URL that is requested
    GET for "/about"

    I see you requested "/about", we'll give that to the AboutController to handle

  ## Models
    database wrapper

    User
      query for records
      wrap individual records (give validation)

  ## Views
    response body content:
      HTML
      CSV
      PDF
      XML
    This is what gets send back to the browser and displayed

  ## Controllers
    decide how to process a request and define a response

## Defining routes
  config>routes.rb

  get "about", to: "about#index", as: :about # creates

  when "about" route is encountered, it will look in the controller with the about controller from "about#index" with index action (method)

  In the controller
    it should be AboutController, matching the about_controller

    file name: about_controller.rb
    code:
    class AboutController < ApplicationController
    end

  It will now go to the views folder, finding the about folder, finding the html, matching the action name "index"

  Note: no action in the controller, will render the page corresponding that controller and action


# in rendering, the content of your routes are in the body while the wrapper is in application.html.erb from views>layouts

## Adding bootstrap
  - go to getbootstrap.com
  - in the application.html.erb add the html cdn

# using render partial
  - example: render partial "shared/navbar"
  - the file name must be shared>_navbar.html.erb since it is a partial, meaning just part of a page
