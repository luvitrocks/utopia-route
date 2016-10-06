# utopia-route

> Super simple route middleware for [Utopia](https://github.com/luvitrocks/utopia) server.

## Install

```bash
lit install voronianski/utopia-route
```

## Examples

```lua
local Utopia = require('utopia')
local _ = require('utopia-route')

local app = Utopia:new()

app:use(_.get('/items/:id', function (req, res)
  res:finish('Requested item with id: ' .. req.params.id)
end))

app:listen(8080)
```

Contrived resource-oriented example:

```lua
local Utopia = require('utopia')
local _ = require('utopia-route')

local app = Utopia:new()

local db = {
  tobi = { name = 'tobi', species = 'ferret' },
  loki = { name = 'loki', species = 'ferret' },
  jane = { name = 'jane', species = 'ferret' }
}

local pets = {}

function pets.list (req, res)
  local names = {}

  for i, key in ipairs(db) do
    names[i] = key
  end

  res:finish('pets: ' .. table.concat(names ', '))
end

function pets.show (req, res, nxt)
  local pet = db[req.params.name]

  if not pet then 
    return nxt('cannot find that pet')
  end

  res:finish(pet.name .. ' is a ' .. pet.species)
end

app:use(_.get('/pets', pets.list))
app:use(_.get('/pets/:name', pets.show))

app:listen(3000)
print('listening on port 3000')
```

## License

MIT Licensed

Copyright (c) 2016 Dmitri Voronianski [dmitri.voronianski@gmail.com](mailto:dmitri.voronianski@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
