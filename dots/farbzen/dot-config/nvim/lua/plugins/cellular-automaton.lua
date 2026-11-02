return {
  "cellular-automaton.nvim",
  auto_enable = true,
  after = function()
    vim.keymap.set("n", "<leader>fml", function()
      vim.cmd("CellularAutomaton make_it_rain")
    end, { desc = "Make it rain" })
    vim.keymap.set("n", "<leader>gol", function()
      vim.cmd("CellularAutomaton game_of_life")
    end, { desc = "Game of life" })
  end,
}
