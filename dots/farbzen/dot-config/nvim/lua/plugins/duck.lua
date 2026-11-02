return {
  "duck.nvim",
  auto_enable = true,
  after = function()
    vim.keymap.set("n", "<leader>dh", function()
      require("duck").hatch()
    end, { desc = "Hatch a duck" })
    vim.keymap.set("n", "<leader>dc", function()
      require("duck").cook()
    end, { desc = "Cook a duck (How could you...)" })
    vim.keymap.set("n", "<leader>dC", function()
      require("duck").cook_all()
    end, { desc = "Cook all the ducks (YOU MONSTER...)" })
  end,
}
