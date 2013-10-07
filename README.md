# Para

Para is a simple grid system developed for use internally at [finn](http://www.finncomms.com) and borrows heavily from the thinking of our good friend [@csswizardry](http://www.twitter.com/csswizardy)

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
