return {
  "pentatonic.nvim",
  after = function()
    require("pentatonic").setup({ volume = 0.05 })
  end,
}
