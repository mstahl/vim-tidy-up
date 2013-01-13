# vim-tidy-up

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

Are your hashrockets dabbled all over the place willy-nilly like you've just given
up and stopped caring? Dry those tears; Tidy Up is here to rescue you and your code
from looking derelict and desheveled.

    some_hash = {
      :some_key => "These hashrockets are",
      :some_longer_key => "all over the place",
      :another_key => "up in here"
    }

That looks awful! Let's tidy that situation right up. Type `,th` to get those
hashrockets firing off in unison.

    some_hash = {
      :some_key        => "These hashrockets are",
      :some_longer_key => "all over the place",
      :another_key     => "up in here"
    }

Looks great. Thanks, Tidy Up!
