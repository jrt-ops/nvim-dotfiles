--groups
local wk = require("which-key")
wk.add({
  { "<leader>f", group = "file" },
  { "<leader>t", group = "terminal" },
  { "<leader>g", group = "git" },
})

-- save and quit
wk.add({
  {
    mode = { "n" },
    { "<leader>w", "<cmd>w<cr>", desc = "[w]rite" },
    { "<leader>q", "<cmd>q<cr>", desc = "[q]uit" },
  }
})

-- telescope commands
local telescope = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "[f]iles" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "[h]elp" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "[b]uffers" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "[g]rep" })
vim.keymap.set("n", "<leader>fv", telescope.git_files, { desc = "[v]ersioned files" })
vim.keymap.set("n", "<leader>fn", function()
  telescope.find_files {
    cwd = vim.fn.stdpath("config")
  }
end, { desc = "[n]vim files" })
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope<CR>", { desc = "[t]elescope" })

-- quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "quickfix next" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "quickfix prev" })

-- toggle quickfix menu
vim.keymap.set("n", "<M-o>",
  function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
      if win["quickfix"] == 1 then
        qf_exists = true
        break
      end
    end
    if qf_exists then
      vim.cmd("cclose")
    else
      vim.cmd("copen")
    end
  end, { desc = "Toggle Quickfix List" })

--terminal
vim.keymap.set("n", "<leader>ts",
  function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd("wincmd J")
    vim.api.nvim_win_set_height(0, 15)
  end, { desc = "[s]mall terminal" })

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
