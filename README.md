# dashing-statuscake

Statuscake widget for Dashing. Inspired by https://github.com/Edools/dashing-pingdom

##  Setup

- Copy the contents of the *jobs*, *widgets* and *config* folder into the the jobs, widgets and config (maybe you need create it) folders in your dashing project.

- Edit the statuscake.yml file to configure the checks. The configuration looks like this:

```yaml
checks:
  - 00000
api_key: replace me
api_user:  and me too
```

- Edit your *gemfile* to add dependencies:

```ruby
gem 'statuscake'
gem 'activesupport'
gem 'time_diff'
gem 'rest-client'
```
and run `bundle install`.

#### Appearance according to status

![image](http://imgur.com/KqXyAdJ.png)
![image](http://imgur.com/8gIwhpG.png)
![image](http://imgur.com/BnZWILu.png)

#### Adding this widget to your dashboard

Add the following to your *dashboard.erb* file, and adjust the attributes to place it where you want. The *data-id* value is ended by the ID of the check (same used in statuscake.yml).

```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="statuscake-status-ID" data-view="Statuscakestatus" data-title="Status Title"></div>
</li>
```

## For best viewing

The layout of these widgets is inspired by [Geckoboard](http://geckoboard.com). So, for best viewing is strongly recommended to change the dimensions of standard widgets. To do this, edit the file `assets/application.coffee` for something like:

```coffee
Dashing.widget_base_dimensions ||= [230, 230]
Dashing.numColumns ||= 5
```



## Licence

This widget is released under the [MIT License](http://www.opensource.org/licenses/MIT) as was the Pingdom widget mentioned previously.

