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

First, create your application banner in config/banner.txt.

Like this:

```zsh
$ gem install artii
$ artii --font=banner3-D yourapp > config/banner.txt
```

(about artii: https://github.com/miketierney/artii )

Then, call banner method in the bottom of your deploy.rb

```ruby
require 'capistrano_banner'  # if you wouldn't use bundle exec
set :rails_env, 'production' # rails_env or rack_env must be fixed before call banner
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

In production environment, capistarano pauses and waits your input.

## Options

banner method can take options:

- `:path => 'filepath'` path to your favor banner file
- `:color => :colorname'` banner color (e.g. :red, :green and :blue ... see https://github.com/flori/term-ansicolor )
- `:pause => true` anyway pause
- `:force => true` don't pause even if production env


## Etc

### multistage

If you use capistrano/ext/multistage, you need write `banner` method call to *all* stages. capistrano_banner needs rails_env or rack_env (or recognizes as production environment).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
