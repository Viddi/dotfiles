return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.isort,
        -- null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.semgrep,
        null_ls.builtins.diagnostics.checkstyle,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.ktlint,
        null_ls.builtins.diagnostics.ktlint,
        null_ls.builtins.formatting.terraform_fmt,
      },
    })
  end,
}
