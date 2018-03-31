# README

Anonymous Polling Website will let you create polls once you login using Google.

After logging in :
* Anyone can polls and add as many options as they want.
Users cannot vote without logging in. They can edit and delete their own polls.

* Once vote is done the count of option chosen is incremented but their is no log of which option did the user choose.

To run :
* You must have `ruby 2.4.4` installed.
* Clone the repo.
* Run `bundle install` from the directory where it is saved.
* Start server by `rails s` and go to `localhost:3000`.

To run on Docker:
* Build Docker container running: `docker build -t anonapp .`
* Run the container: `docker run -it -p 3000:3000 anonapp` and go to `localhost:3000`
