# Para

> ORIGIN from Greek para ‘beside’;

Para is a simple grid system developed for use internally at [finn](http://www.finncomms.com) and borrows heavily from the thinking of our good friend [@csswizardry](http://www.twitter.com/csswizardy) creator of [inuit css](www.github.com/csswizardy/inuit.css) and [csswizardry-grids](http://www.github.com/csswizardry/csswizardry-grids).

Para adds basic grids to your project as a compass extension.

## Installation

Add this line to your application's Gemfile:

    gem 'para-grids'

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

We define the breakpoints above for you as defaults, but you can set them to be whatever you like. 

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
  <div class="grid__item one-whole portable-one-third">...</div>
  <div class="grid__item one-whole portable-two-thirds">...</div>
</div>
```

### Pushing and Pulling

Para also includes the ability to create push- and pull- classes for your namespaced grid widths. It's as simple as adding:

```sass
@include setup-push-pull();
```

You can include a namespace inside the mixin to achieve classes that match your namespaced grid widths (e.g. `@include setup-push-pull('palm-');`).

Using these classes follows the same BEM format as the grid widths:

```html
<div class="grid">
  <div class="grid__item one-third push-two-thirds">...</div>
  <div class="grid__item two-thirds pull_one-third">...</div>
</div>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Big Thanks

Once again, big thanks to Harry for his awesome work that has been a big influence on this project. [Check him out](http://www.csswizardy.com) - he's a very clever fella!
