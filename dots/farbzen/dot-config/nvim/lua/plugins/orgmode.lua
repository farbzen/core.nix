return {
  "orgmode",
  auto_enable = true,
  after = function()
    require("orgmode").setup({
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/refile.org",
      win_split_mode = "float",
      win_border = "rounded",
      mappings = {
        global = {
          org_agenda = { "<leader>oa", desc = "Open orgmode agenda" },
          org_capture = { "<leader>oc", desc = "Open orgmode capture" },
        },
      },
    })
  end,
}
