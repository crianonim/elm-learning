# Random number generation

## Steps

### Install `elm/random`

```
npm run elm install elm/random
```

and import it in your `Main.elm`

```elm
import Random
```

### Model to include `die` as an Int

```elm
type alias Model = {die:Int}
```

### `Msg` to have values for rolling the die and accepting the result

```elm
type Msg
    = Roll
    | NewDie Int
```

### respond to the messages in the `update`:

```elm
        Roll ->
            ( model, Random.generate NewDie (Random.int 1 6) )
        NewDie x -> ( {model|die=x}, Cmd.none)
```

`Random.generate` is a `Cmd` that takes a message constructor and a Generator `(Random.int 1 6)`

I also added the command to the init:
```elm
init _ =
    ( { die=1 }
    , Random.generate NewDie (Random.int 1 6)
    )
```
