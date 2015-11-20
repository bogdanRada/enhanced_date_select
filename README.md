enhanced_date_select
====================

[![Gem Version](https://badge.fury.io/rb/enhanced_date_select.svg)](http://badge.fury.io/rb/enhanced_date_select) [![Build Status](https://travis-ci.org/bogdanRada/enhanced_date_select.png?branch=master,develop)](https://travis-ci.org/bogdanRada/enhanced_date_select) [![Coverage Status](https://coveralls.io/repos/bogdanRada/enhanced_date_select/badge.svg?branch=master)](https://coveralls.io/r/bogdanRada/enhanced_date_select?branch=master) [![Code Climate](https://codeclimate.com/github/bogdanRada/enhanced_date_select/badges/gpa.svg)](https://codeclimate.com/github/bogdanRada/enhanced_date_select) [![Repo Size](https://ruby-gem-downloads-badge.herokuapp.com/repo_size/bogdanRada/enhanced_date_select)](https://github.com/bogdanRada/enhanced_date_select) [![Gem Downloads](https://ruby-gem-downloads-badge.herokuapp.com/enhanced_date_select?type=total)](https://github.com/bogdanRada/enhanced_date_select) [![Maintenance Status](http://stillmaintained.com/bogdanRada/enhanced_date_select.png)](https://github.com/bogdanRada/enhanced_date_select)

Overview
--------

An enhanced date select form helper that allows you to use the full [HTML specification](http://www.w3.org/TR/html5) for date_select helper methods from rails. This is more than what you get with the default Rails date select helper because it can allow values to persist in dropdowns even if you submit a invalid value.

Features
--------

-	Fully customizable HTML5 attributes for date_select .

Requirements
------------

1.	[Ruby 1.9.x or Ruby 2.x.x](http://www.ruby-lang.org)
2.	[Ruby On Rails](http://rubyonrails.org)

Compatibility
-------------

-	Rails >3.0 only. MRI 1.9, 2.x.

-	JRuby is not offically supported.

-	Ruby 1.8 is not officially supported.

We will accept further compatibilty pull-requests but no upcoming versions will be tested against it.

Rubinius support temporarily dropped due to Rails 4 incompatibility.

Setup
-----

Type the following from the command line to install:

```ruby
  gem install enhanced_date_select
```

Add the following to your Gemfile:

```ruby
gem "enhanced_date_select"
```

Usage
-----

Use the **enhanced_date_select** instead of **date_select** helper methods in your views. Example:

```ruby
form.enhanced_date_select :birthday,
{
  :prompt =>
  {
    :day => "please select one",
    :month => "please select one",
    :year => "please select one"
  },
  :value =>
  {
    :year => @year,
    :month => @month,
    :day => @day
  },
  :order => [:day, :month, :year],
  :start_year => Time.now.year,
  :end_year => 1940
},
{
 :class => "input_3cols"
}
```

...or alternatively:

```ruby
form.enhanced_date_select :birthday,
{
  :prompt =>
  {
    :day => "please select one",
    :month => "please select one",
    :year => "please select one"
  },
  :value => Date.new(2011,02,01),
  :order => [:day, :month, :year],
  :start_year => Time.now.year,
  :end_year => 1940
},
{
 :class => "input_3cols"
}
```

The **enhanced_date_select** takes all the standard options as the default Rails date_select method. The only difference is that it expects an hash with values for year, month and day instead of an date object.

Testing
-------

To test, do the following:

1.	cd to the gem root.
2.	bundle install
3.	bundle exec rake

Contributions

---

Please log all feedback/issues via [Github Issues](http://github.com/bogdanRada/enhanced_date_select/issues). Thanks.

Contributing to enhanced_date_select
------------------------------------

-	Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
-	Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
-	Fork the project.
-	Start a feature/bugfix branch.
-	Commit and push until you are happy with your contribution.
-	Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
-	Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2012 bogdanRada. See LICENSE.txt for further details.
