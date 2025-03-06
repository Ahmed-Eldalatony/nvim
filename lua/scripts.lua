local keys = { "a", "s", "d", "f", "l" }

for i, key in ipairs(keys) do
  vim.keymap.set("n", "<M-" .. key .. ">", ":ToggleTerm " .. i .. "<CR>", { noremap = true, silent = true })
  -- Insert mode
  vim.keymap.set("i", "<M-" .. key .. ">", "<Esc>:ToggleTerm " .. i .. "<CR>", { noremap = true, silent = true })
  vim.keymap.set(
    "t",
    "<M-" .. key .. ">",
    "<C-\\><C-n>:ToggleTerm " .. i .. "<CR>",
    { noremap = true, silent = true }
  )
end
