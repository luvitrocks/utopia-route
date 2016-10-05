# utopia-route

## Example

```lua
local Utopia = require('utopia')
local _ = require('utopia-route')

local app = Utopia:new()

app.use(_.get('/items/:id', function (req, res, nxt)
  res:finish('Requested items with id: ' .. req.params.id)
end))

app.listen(8080)
```
