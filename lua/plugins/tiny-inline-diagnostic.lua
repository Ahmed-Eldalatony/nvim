return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy", -- Or `LspAttach`
  priority = 1000,    -- needs to be loaded in first
  config = function()
    require('tiny-inline-diagnostic').setup({
      preset = "modern",

      transparent_bg = false, -- Set the background of the diagnostic to transparent
      transparent_cursorline = false,
    })

    -- }

    vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
  end
}
