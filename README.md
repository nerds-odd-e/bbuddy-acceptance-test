This is the repo for the exercise project to be developed in Shanghai team's Modern Mobile Development course

# Installation
Please install the following tools for this project. The latest version should be fine unless specific version is listed. Just a kindly reminder, please use a Mac if you want to run acceptance tests for not only Android and Angular, but also iOS.

* git
* mysql
* [Rvm](http://rvm.io/) and ruby 2.4 (2.0+ versions should be ok)
* Rubymine (or any editor you preferred for ruby development)
* Genymotion (or any Android simulator you preferred)
    * Please install a simulator since there is no pre-installed simulator, e.g. Google Galaxy Nexus-4.1.1-API 16-720 * 1280
* [Carthage](https://github.com/Carthage/Carthage)
* Xcode 8.2.1 (latest version)
    * Please make sure there is at least one simulator installed (iOS 10.2 should be installed already)
    * After install the latest Xcode, please run `xcode-select --install` to install some required libraries 
* Android Studio
    * Please install the missing Android SDK as suggested by Android Studio

# Setup Command Line Development Environment
Use git to clone this project into a folder. Then in this folder, run the command below in order.

* Common setup
    * Create a default mysql dba user `mysql -u root -p < sql/create_default_dba.sql`
    * Ruby setup `gem install bundler; bundle install; rake db:create; rails db:migrate`
    * server setup `./script/add_api_for_acceptance_tests.sh path/to/bbuddy-api`
* Run acceptance tests for Android
    * Start the simulator from Genymotion
    * Build Apk and Run All Unit Tests
    * Run acceptance tests `calabash-android run path/to/apk -p android`
* Run acceptance tests for iOS
    * Download calabash framework `calabash-ios download; cp calabash.framework path/to/bbuddy-ios`
    * Use Xcode to build the bbuddy-cal target
    * Run acceptance tests `cucumber -p ios`
* Run acceptance tests for Angular
    * Make the angular project workable first
    * Run acceptance tests `cucumber -p angular`

# Tips for Mac installation
Here are some tips for Mac installations.
* [Homebrew](http://brew.sh/) is recommended for Mac tool and app installations
    * Tools and services can be installed via, for example, `brew install git`
    * Applications can be installed via, for example, `brew cask install genymotion`
