-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>U"] = { ":UndotreeToggle<CR>" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<F2>"] = {
      function()
        -- write buffer into file
        vim.cmd "write"
        -- compile the file if file type is c++/c
        if vim.bo.filetype == "cpp" or vim.bo.filetype == "c" then
          -- compile this code
          vim.cmd "!g++ % -o %:r.o"
        end
      end,
      desc = "Save File and Compile it",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {},
  i = {
    ["<C-a>"] = { 'copilot#Accept("<CR>")', noremap = true, silent = true, expr = true, replace_keycodes = false },
    ["<C-n>"] = { "<Plug>(copilot-next)" },
    ["<C-p>"] = { "<Plug>(copilot-next)" },
    ["<C-d>"] = { "<Plug>(copilot-dismiss)" },
  },
}
