local lualine_material = require("lualine.themes.material")

local new_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}

lualine_material.normal.a.bg = new_colors.blue
lualine_material.insert.a.bg = new_colors.green
lualine_material.visual.a.bg = new_colors.violet
lualine_material.command = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black
  },
}


require('lualine').setup({
  options = {
    theme = lualine_material,
  }
})
