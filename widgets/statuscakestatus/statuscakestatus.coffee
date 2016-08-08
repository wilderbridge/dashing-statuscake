class Dashing.Statuscakestatus extends Dashing.Widget

  @accessor 'arrow', ->
    if @get('current') == "up"
      'value-up icon-caret-up'
    else if @get('current') == "pau"
      'value-paused icon-question'
    else if @get('current') == "down"
      'value-down icon-caret-down'

  @accessor 'value', ->
    if @get('current') == "up"
      'value value-up'
    else if @get('current') == "pau"
      'value value-paused'
    else if @get('current') == "down"
      'value value-down'
