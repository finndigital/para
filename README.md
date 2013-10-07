# Para

Para is a simple grid system developed for use internally at [finn](http://www.finncomms.com) and borrows heavily from the thinking of our good friend [@csswizardry](http://www.twitter.com/csswizardy) creator of [inuit css](www.github.com/csswizardy/inuit.css) and [csswizardry-grids](http://www.github.com/csswizardry/csswizardry-grids).

Para adds basic grids to your project as a compass extension.

## Installation

Add this line to your application's Gemfile:

    gem 'para'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install para

## Usage

Setting up a grid using the defaults is as simple as

```sass
@import "compass";
@import "para";

@include initialise-grid(); //we are English!

@inlude setup-grid();
```

### Getting Responsive

Para includes features to help make your grids respond to device widths and you can set them up as follows

```sass
@import "compass";
@import "para";

@include initialise-grid();

@include setup-grid();
$tablet: '(min-width: 500px)';

@include media-query($tablet){
  @include setup-grid('tablet-');
}
```

Of course, there are neater ways of doing this, and we favour the following:

```sass
@import "compass";
@import "para";

$breakpoints: palm, tablet, portable, desk, wide, huge;
$vars: $palm, $tablet, $portable, $desk, $wide, $huge;

@for $i from 1 through length($breakpoints){
  @include media-query(#{nth($vars, $i)}){
    @include setup-grid("#{nth($breakpoints, $i)-"});
   }
}
```

### In your html

To use the grids that para spits out, simply scaffold as follows:

```html
<div class="grid">
  <div class="grid__item one-third">Column 1</div>
  <div class="grid__item two-thirds">Column 2</div>
</div>
```

When you run `setup-grid()` what you are actually doing is creating a namespaced set of widths that can be used as secondary classes to define column sizes. Sounds complicated, but it's very simple.

Currently para supports columns up to `eigths` but more may well be added in the future.

To use a namespaced grid such as those created in the second responsive example above, simply work from mobile outwards and use the namespaced classes to size as you want.

```html
<div class="grid">
  <div class="grid__item one-whole portable-one-third">One whole on all devices that don't match the "portable" media query and one third on those that do.</div>
  <div class="grid__item one-whole portable-two-thirds">One whole on all devices that don't match the "portable" media query and two thirds on those that do.</div>
</div>
```

### Pushing and Pulling

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
