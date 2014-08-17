AdminRB
========

A single-file simple database viewer for Ruby on Rails development.

Drop in and go! Powered by Sinatra.

Setup
------------
Enter the following commands from your Rails app's root:
```
git clone http://github.com/ATMartin/AdminRB
cd AdminRB
bundle install
```


Usage
-------

Run the following command in the root of your Rails project:
```
ruby AdminRB/app.rb
```
Then browse to your project's root at port 4000 (default).

This app currently assumes it is located in a dedicated directory in your app root! If you move it,
please adjust the `:database` setting to account for the move. Otherwise it WILL NOT WORK!


Settings
-----------
For now, all settings will have to be manually changed inside the `AdminRB.rb` file.

- `:bind`: change the IP address the Sinatra instance binds to.
- `:port`: change the port the Sinatra instance listens on.
- `:database`: change the location of your database file.


Thanks...
-----------
- [Adminer](http://www.adminer.org): Project inspiration
- [Sinatra](http://www.sinatrarb.com): Base server
