This is the repo for the exercise project to be developed in Shanghai team's Modern Mobile Development course

# Installation
Please install the following tools for this project. The latest version should be fine unless specific version is listed.

* git
* mysql
* ruby 2.4 (2.0+ versions should be ok)
* Rubymine (or any editor you preferred for ruby development)

# Setup Command Line Development Environment
Use git to clone this project into a folder. Then in this folder, run the command below in order.

* Create a default mysql dba user `mysql -u root -p < sql/create_default_dba.sql`
* Init environment `gem install bundler; bundle install; rake db:create; rails db:migrate`
* Start Web Application `rails s` (on port 3000)
