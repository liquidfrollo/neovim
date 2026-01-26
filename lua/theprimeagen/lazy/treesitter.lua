return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    ----------------------------------------------------------------------
    -- Core Treesitter setup (this part still works in 0.11)
    ----------------------------------------------------------------------
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "vimdoc",
        "javascript",
        "typescript",
        "c",
        "lua",
        "rust",
        "jsdoc",
        "bash",
      },

      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },

      indent = {
        enable = true,
      },
    })

    ----------------------------------------------------------------------
    -- Neovim 0.11+ custom parser registration
    -- nvim-treesitter no longer exposes parser registration APIs
    ----------------------------------------------------------------------
    vim.treesitter.language.add("templ", {
      install_info = {
        url = "https://github.com/vrischmann/tree-sitter-templ.git",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "master",
      },
    })
  end,
}
