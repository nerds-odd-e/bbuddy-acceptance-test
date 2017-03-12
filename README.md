This is the repo for the exercise project to be developed in Shanghai team's Modern Mobile Development course

# Installation
Please install the following tools for this project. The latest version should be fine unless specific version is listed. Just a kindly reminder, please use a Mac if you want to run acceptance tests for both Android and iOS. If not, you can only run the Android part.

* git
* mysql
* ruby 2.4 (2.0+ versions should be ok)
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
* Run acceptance tests for Android
    * Start the simulator from Genymotion
    * Build Apk and Run All Unit Tests `android/gradlew clean build -p android`
    * Run acceptance tests `calabash-android run android/app/build/outputs/apk/app-debug.apk -p android`
* Run acceptance tests for iOS
    * Download calabash framework `cd ios; calabash-ios download`
    * Install dependencies by Carthage `cd ios; carthage update`
    * Use Xcode to build the bbuddy-cal target
    * Run acceptance tests `cucumber -p ios`

# Tips for Mac installation
Here are some tips for Mac installations.
* [Homebrew](http://brew.sh/) is recommended for Mac tool and app installations
    * Tools and services can be installed via, for example, `brew install git`
    * Applications can be installed via, for example, `brew cask install genymotion`
* [Rvm](http://rvm.io/) is recommended for handling ruby environment
