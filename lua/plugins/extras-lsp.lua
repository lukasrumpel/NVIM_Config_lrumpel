 return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Typst Config aus deiner alten lsp.lua
        tinymist = {
          settings = {
            formatterMode = "typstyle",
            exportPdf = "onType",
            semanticTokens = "disable",
          },
        },
        -- Vue / Typescript Config
        ts_ls = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                languages = { "vue" },
              },
            },
          },
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        },
        volar = {}, -- Vue Language Server explizit aktivieren
      },
    },
  },
}
