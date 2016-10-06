return {
  name = "voronianski/utopia-route",
  version = "1.0.0",
  description = "Simple route middleware for Utopia",
  tags = { "utopia", "server", "framework", "route", "router" },
  license = "MIT",
  author = { name = "Dmitri Voronianski", email = "dmitri.voronianski@gmail.com" },
  homepage = "https://github.com/utopia-route",
  dependencies = {
    'voronianski/http-methods',
    'voronianski/utopia-route'
  },
  files = {
    "**.lua",
    "!test*"
  }
}

