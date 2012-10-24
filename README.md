# CapistranoBanner

display application banner, and pause in production environment

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano_banner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano_banner

## Usage

First, you need create your application banner in config/banner.txt

like this:

```zsh
$ gem install artii
$ rehash
$ artii --font=banner3-D yourapp > config/banner.txt
```

Then, call banner method in the bottom of your deploy.rb

```ruby
set :rails_env, 'production'
set :deploy_to, '/u/apps/yourapp'

# :
# :

banner
```

Let's execute cap!

```
$ cap shell
  '##:::'##::'#######::'##::::'##:'########:::::'###::::'########::'########::
  . ##:'##::'##.... ##: ##:::: ##: ##.... ##:::'## ##::: ##.... ##: ##.... ##:
  :. ####::: ##:::: ##: ##:::: ##: ##:::: ##::'##:. ##:: ##:::: ##: ##:::: ##:
  ::. ##:::: ##:::: ##: ##:::: ##: ########::'##:::. ##: ########:: ########::
  ::: ##:::: ##:::: ##: ##:::: ##: ##.. ##::: #########: ##.....::: ##.....:::
  ::: ##:::: ##:::: ##: ##:::: ##: ##::. ##:: ##.... ##: ##:::::::: ##::::::::
  ::: ##::::. #######::. #######:: ##:::. ##: ##:::: ##: ##:::::::: ##::::::::
  :::..::::::.......::::.......:::..:::::..::..:::::..::..:::::::::..:::::::::

  This is production environment. Are you ready? (y/N) > 
```

If production environment, pause and wait your input.

## Options

banner method can take options:

- `:path => 'filepath'` path to your favor banner file
- `:color => :colorname'` banner color (e.g. :red, :green and :blue ... see https://github.com/flori/term-ansicolor )
- `:pause => true` anyway pause
- `:force => true` don't pause even if production env

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
