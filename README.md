# capistrano_banner

`capistrano_banner` displays application banner, and pause in production stage

## Installation

Gemfile:

    gem 'capistrano_banner'

Then:

    $ bundle

### Note

After version 0.1.0, `capistrano_banner` works well just with capistrano >= 3.

If you're using capistrano =< 2, please use this gem versioned 0.0.x

## Usage

First, create your application banner in config/banner.txt.

Like this:

```zsh
$ gem install artii
$ artii --font=banner3-D yourapp > config/banner.txt
```

(about artii: https://github.com/miketierney/artii )

Then enable in Capfile:

    require 'capistrano/banner'

This line hooks `deploy:banner` task just before `deploy:starting`.

See also [capistrano(3) flow](http://capistranorb.com/documentation/getting-started/flow/).

After all, let's execute cap!

```
$ cap production deploy
  '##:::'##::'#######::'##::::'##:'########:::::'###::::'########::'########::
  . ##:'##::'##.... ##: ##:::: ##: ##.... ##:::'## ##::: ##.... ##: ##.... ##:
  :. ####::: ##:::: ##: ##:::: ##: ##:::: ##::'##:. ##:: ##:::: ##: ##:::: ##:
  ::. ##:::: ##:::: ##: ##:::: ##: ########::'##:::. ##: ########:: ########::
  ::: ##:::: ##:::: ##: ##:::: ##: ##.. ##::: #########: ##.....::: ##.....:::
  ::: ##:::: ##:::: ##: ##:::: ##: ##::. ##:: ##.... ##: ##:::::::: ##::::::::
  ::: ##::::. #######::. #######:: ##:::. ##: ##:::: ##: ##:::::::: ##::::::::
  :::..::::::.......::::.......:::..:::::..::..:::::..::..:::::::::..:::::::::

  This is production stage. Are you ready? (y/N) > 
```

In production stage, capistarano pauses and waits your input.

### Custom banner hook

In another way, you can call banner method in your task:

```
task :foobar do
  CapistranoBanner.banner("./config/custom.txt")
end
```

## Options

`capistrano_banner` respects some capistrano settings:

- `:banner_path` : A path to banner source file. Default to `"./config/banner.txt"`
- `:banner_options` : Set specifc banner options with Hash:
    - `:color => :colorname'` banner color (e.g. :red, :green and :blue ... see https://github.com/flori/term-ansicolor )
    - `:pause => true` anyway pause
    - `:force => true` don't pause even if production env

## LICENSE

See LICENSE.txt.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
