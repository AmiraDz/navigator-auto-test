This project was created to enable running of smoke and regression tests of navigator.ba. 

The activities undertaken as part of the testing process were writing and executing scripts for smoke and regression test. 

The scripts were written using RSpec and Capybara and executed using Selenium WebDriver.

Steps to setup environment:
1) Install Ruby library
2) Install bundler 
3) Create project folder and generate a bundle gemfile by running bundle init
4) In gemfile, specify rspec, capybara and selenium-webdriver gems
5) Save gemfile and run bundle install in terminal

Scripts should be run from project root folder (rspec-navigator), entering "rspec ./spec/*rb" to terminal, or just rspec to run all scripts.

Application under test: http://www.navigator.ba/
Project management tool: Trello
Trello board link: https://trello.com/b/JfpMXHsv/qa-amira-dzanovic
