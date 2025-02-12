local Terminal = require("toggleterm.terminal").Terminal

-- Table to store floating terminals by their index
local terminals = {}

local function open_new_floating_terminal()
    local id = #terminals + 1  -- Assign a unique ID
    local term = Terminal:new({
        direction = "float",
        hidden = true,  -- Keep it hidden until triggered
        on_open = function(term)
            vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<C-i><C-n>", { noremap = true, silent = true })
        end,
    })
    terminals[id] = term
    term:toggle()
end

-- Function to switch between floating terminals by number
local function toggle_floating_terminal(id)
    if terminals[id] then
        terminals[id]:toggle()
    else
        print("No terminal with ID " .. id)
    end
end

-- Keybindings
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua open_new_floating_terminal()<CR>", { noremap = true, silent = true })
for i = 1, 9 do
    vim.api.nvim_set_keymap("n", "<leader>" .. i, "<cmd>lua toggle_floating_terminal(" .. i .. ")<CR>", { noremap = true, silent = true })
end
