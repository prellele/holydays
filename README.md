holydays
=============

[![Dependency Status](https://gemnasium.com/prellele/holydays.png)](https://gemnasium.com/prellele/holydays)
[![Code Climate](https://codeclimate.com/github/prellele/holydays.png)](https://codeclimate.com/github/prellele/holydays)

a simple webapp to manage vacation, e.g. in a company. You could sign up and see 
when your employees listed their vacation or create your own vacation by simply 
clicking on a day-header. Every toggle of a day is logged in a table and could be 
displayed by every user.

### load all german holidays in you db

    bundle exec rake db:load_german_holidays


### some screenshots 

#### /users/sign_in 
![](http://prellele.de/holydays/sign_in_small.png)

#### /users/sign_up 
![](http://prellele.de/holydays/sign_up_small.png)

#### /calendar
![](http://prellele.de/holydays/calendar_small.png)

#### /log_datas
![](http://prellele.de/holydays/log_small.png)
