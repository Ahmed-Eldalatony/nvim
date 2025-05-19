return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  opts = {
    global_keymaps = false,
    global_keymaps_prefix = "<leader>m",
    kulala_keymaps_prefix = "",
  },
  keys = {
    { "<leader>ms", desc = "Send request" },
    { "<leader>Ra", desc = "Send all requests" },
    { "<leader>Rs", desc = "Open scratchpad" },
  },
}
