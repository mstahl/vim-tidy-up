# vim-tidy-up

A Vim plugin for tidying up bits of code for better readability.

## Installation

With pathogen:

    cd ~/.vim/bundle
    git clone git@github.com:mstahl/vim-tidy-up.git

If you don't use Pathogen, move the `vim-tidy-up.vim` script into your plugins
directory, wheresoever it may live.

## Usage

Tidy up your Ruby code (or maybe someday other kinds of code) with Tidy Up.
Got a table in your Cucumber scenario that looks all janky like this one right
here?

    |this|table|be|messed|up|yo|
    |472848|  8| 372   |891| 4456|     9999|

Well, consider this your lucky day, 'cause you can tidy that sumbitch up with a
couple of swift keystrokes! Select the lines in visual mode and type `,tt` to
get:

    | this   | table | be  | messed | up   | yo   |
    | 472848 | 8     | 372 | 891    | 4456 | 9999 |

BAM!

Are your hashrockets dabbled all over the place willy-nilly like you've just
given up and stopped caring? Dry those tears; Tidy Up is here to rescue you and
your code from looking derelict and desheveled.

    some_hash = {
      :some_key => "These hashrockets are",
      :some_longer_key => "all over the place",
      :another_key => "up in here"
    }

That looks awful! Let's tidy that situation right up. Type `,tt` to get those
hashrockets firing off in unison.

    some_hash = {
      :some_key        => "These hashrockets are",
      :some_longer_key => "all over the place",
      :another_key     => "up in here"
    }

Looks great. Thanks, Tidy Up! But what about the newfangled Javascript-style
hashes the kids are using these days? Not to worry. Tidy Up has you covered.

    some_hash = {
      some_key: "These hashrockets are",
      some_longer_key: "all over the place",
      another_key: "up in here"
    }

Select the middle part of the hash, hit `,tt` and voilà!

    some_hash = {
      some_key:        "These hashrockets are",
      some_longer_key: "all over the place",
      another_key:     "up in here"
    }

What about all your variable assignments scattered all over the place? Bring
'em in line with Tidy Up. Turn this...

    foo = "foo"
    bar=  "bar"
    quux   = 38941
    some_ridiculous_name = 3.14159

...into this...

    foo                  = "foo"
    bar                  = "bar"
    quux                 = 38941
    some_ridiculous_name = 3.14159

## Copyright

(c) 2013 Max Thom Stahl

Released under the MIT license. See LICENSE for more details.
