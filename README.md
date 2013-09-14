# Errbit Dashing widget

Errbit widget for [Dashing](http://shopify.github.com/dashing), which shows the number of unresolved errors for a specified project. [Errbit](http://errbit.github.io/errbit/) is an open source, self-hosted error catcher. In other words a tool for collecting and managing errors from other applications. Depending on the number of projects you've added, it will 'slide' through them (if you've got more than one). An example of the widget can be viewed [below](https://github.com/kevintuhumury/dashing-errbit#preview).

## Dependencies

This widget has been [Haml](http://haml.info/)ified (we're using a HAML template in the `/widgets/errbit` directory instead of an HTML template), so besides the above you'll also need to add `haml` to the Gemfile (if you haven't already):

```ruby
gem "haml"
```

and require it in your `config.ru` file right below the require of dashing itself. So the first few lines of your `config.ru` should look something like the following:

```ruby
require 'dashing'
require 'haml'

configure do
...
```

Now run `bundle install`.

## Usage

To use this widget, copy `errbit.coffee`, `errbit.haml` and `errbit.sass` into the `/widgets/errbit` directory of your dashboard. Copy `errbit.png` to the `/assets/images` directory, put the `/jobs/errbit.rb` file in the `/jobs` folder and the `lib/errbit.rb` file into the `lib` directory. If there isn't one yet, create it.

The last thing to do, is to copy the `config.yml` into the root of your Dashing directory. We'll fill in the correct settings in the next step.

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

## Configuration

To actually use the widget on your own Dashboard, you'll need to have access to an Errbit server. If you've got one, great! You've already copied the `config.yml` to the root of the Dashing directory. So, let's enter the correct settings in our `config.yml` file.

The `config.yml` file should look something like the following:

```yaml
:errbit:
  :projects:
    :project_1:
      :api_key: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    :project_2:
      :api_key: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  :base_uri: "https://errbit.example.com"
  :date_format: "%d/%m %H:%M"
```

It's all pretty self explanatory, but let's go through the available configuration settings. We'll start at the bottom with `base_uri` and `date_format`. The `base_uri` is basically the URL of your Errbit server. `date_format` is used to format the date of the last occurred error. By default it will output something like the following: `26/09 18:01`.

The important part (besides the `base_uri`) of the configuration file is the `projects` element. You can add as many projects as you want, since the widget will 'slide' through them.

As you can see, each project needs an Errbit API key. You can find an API key on it's project page in your Errbit application. Just login to your Errbit instance, go to the project page of which you want to show the unresolved errors in this widget and the API key should be right below the project title (at the top of the page).

## Preview

![image](https://f.cloud.github.com/assets/412952/1143396/f50263e2-1d38-11e3-9e1a-411fe5865a1b.png)

## Copyright

Copyright 2013 Kevin Tuhumury. Released under the MIT License.
