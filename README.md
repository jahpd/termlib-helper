# Termlib::Helper

Termlib-helper is a helper based on
[termlib.js](http://www.masswerk.at/termlib) to use on ruby on rails
applications; Thinked to be used integrated with [ace-helper](https://www.github.com/jahpd/ace-helper).

## Installation

Add this line to your application's Gemfile:

    gem 'termlib-helper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install termlib-helper

## Usage

In your helpers, import:

    require termlib/helper

and use in your own functions:

    def create_terminal(opt)
      js = termlib(opt)
      content_tag(:div, js, :id => opt[:id])
    end

in your view files add ace, your mode and theme, as well the code; 

     <%= create_terminal :rows=> 10, :id=> "termDiv", :editor => "coffee_editor", :custom_commands => {
        :run => {
          :help => "run",
          :exec => "console.log('Hello World!')"
        }
     } %>
     
## Contributing

1. Fork it ( https://github.com/[my-github-username]/termlib-helper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
