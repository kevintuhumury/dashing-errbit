# Dashing widget for Errbit

Errbit widget for [Dashing](http://shopify.github.com/dashing), which shows the number of unresolved errors for a specified project. [Errbit](http://errbit.github.io/errbit/) is an open source, self-hosted error catcher. In other words a tool for collecting and managing errors from other applications. An example of the widget can be viewed [below](https://github.com/kevintuhumury/dashing-errbit#preview).

## Dependencies

The widget uses [Compass](http://compass-style.org/) to easily apply CSS3, like `gradients`, `text-shadow` and `border-radius`. In order for that to work with Dashing, we also need [Sprockets Sass](https://github.com/petebrowne/sprockets-sass). So both Compass and Sprockets Sass are dependencies of the Errbit widget. To add these dependencies, add `sprockets-sass` and `compass` to the Gemfile of your Dashing dashboard:

```ruby
gem "sprockets-sass"
gem "compass"
```

This widget has also been [Haml](http://haml.info/)ified (we're using a HAML template in the `/widgets/errbit` directory instead of an HTML template), so besides the above you'll also need to add `haml` to the Gemfile (if you haven't already):

```ruby
gem "haml"
```

To be able to use the above dependencies, you'll also need to require them in your `config.ru` file. It's really important that both `sprockets-sass` and `compass` are required __before__ dashing itself. `haml` can be required after it. So the first few lines of your `config.ru` should look something like the following:

```ruby
require 'sprockets-sass'
require 'compass'
require 'dashing'
require 'haml'

configure do
...
```

Now run `bundle install`.

## Usage

To use this widget, copy `errbit.coffee`, `errbit.haml` and `errbit.sass` into the `/widgets/errbit` directory of your dashboard. Copy `errbit.png` to the `/assets/images` directory, put the `/jobs/errbit.rb` file in the `/jobs` folder and the `lib/errbit.rb` file into the `lib` directory. If there isn't one yet, create it.

To include the widget on your dashboard, add the following snippet to the dashboard layout file:

```ruby
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="errbit" data-view="Errbit"></div>
</li>
```
When you're using a Hamlified dashboard layout (hey, you're already using a Hamlified widget, so why not Hamlify your dashboard layout?), you could also do the following:

```ruby
%li(data-row="1" data-col="1" data-sizex="1" data-sizey="1")
  %div(data-id="errbit" data-view="Errbit")
```

## Copyright

Copyright 2013 Kevin Tuhumury. Released under the MIT License.
