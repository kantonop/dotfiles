require('onedark').setup  {
    -- Main options --
    style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'

    -- Lualine options --
    lualine = {
        transparent = true, -- lualine center bar transparency
    },
}
require('onedark').load()
