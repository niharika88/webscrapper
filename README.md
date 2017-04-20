# README

This is an api to parse a page and index the contents. 

This follows a certain criteria :

-> content that is found inside the tags h1, h2 and h3 and the links .

-> content should be listed down and stored.


Two Api endpoints:

 ```
 POST /pages pages#create
1. This receives a url, indexes the content and stores it in the database.
   Content includes only header tags (H1, H2 and H3) and links urls.
  
  ```
   


```
GET /pages.json pages#index
2. This endpoint lists previously stored urls

 ``` 


Setup
=======
Pre Installations: 

- Ruby (version 2.3.1p112 )
- Rails (versions 5)
- PostgreSQL
- rvm
- bundler


Steps for configuration
=======================

clone the repo

`git clone ....`

Enter the application

`$ cd webscrapper`

Run 

`bundle install`


Database creation
=====================

```
rake db:create
```

Database initialization
=======================

```
# Run migrations
rake db:migrate
```

Application Init
=================

Run the app:
```
$ rails s -p <your-port>

```

Run test cases
================
The application contain a suite of RSpec tests.
Run `rspec` to run all RSpec tests.

For creating data use
======================
``` 
curl POST -d "page_url="https://github.com/plataformatec/devise/issues/779"" http://localhost:3000/pages

```
Parameter
===========

``` 
page_url = <your -url of choice >

```
Listing the stored contents (Index)
=====================================
```
http://localhost:3000/pages.json 

```
Screenshots
===============

1. Create/Post data to the server for indexing the content from a url:

![Alt text](app/assets/images/Screen%20Shot%202017-04-20%20at%206.03.06%20AM.png?raw=true "curl / create")

2.Server query/response after Post

![Alt text](app/assets/images/Screen%20Shot%202017-04-20%20at%206.03.32%20AM.png?raw=true "curl / response")

3.Server Snapshot On create Insert query

![Alt text](app/assets/images/Screen%20Shot%202017-04-20%20at%206.03.54%20AM.png?raw=true " server")

4. Indexed Content

![Alt text](app/assets/images/Screen%20Shot%202017-04-20%20at%206.02.23%20AM.png?raw=true "index")
