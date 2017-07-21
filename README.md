# README

*Generate a Random route by going to “localhost:3000/random”

*Added a Search route that will let you search by name of a business by going to “localhost:3000/businesses?name=insert” insert= name of business you want to search for.

*Added rate limits to API so that it will only allow 3 calls per minute. *disabled because it was messing with my RSPEC’s

*Added Pagination to limit the amount of Business seen per page. “localhost:3000/businesses?page=number” number= the page you want to go to ie: 3 or 4.

*Installation Setup

* git clone
* bundle install
* rails db:create
* rails db:migrate
* rails db:seed
* rails s
