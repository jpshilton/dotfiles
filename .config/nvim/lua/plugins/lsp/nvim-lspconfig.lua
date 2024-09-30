return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local keymap = vim.keymap
      local builtin = require('telescope.builtin')
  
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
  
          keymap.set("n", "<leader>gR", builtin.lsp_references, { buffer = ev.buf, silent = true, desc = "Show references" })
          keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, silent = true, desc = "Go to declaration" })
          keymap.set("n", "gd", builtin.lsp_definitions, { buffer = ev.buf, silent = true, desc = "Show definitions" })
          keymap.set("n", "gi", builtin.lsp_implementations, { buffer = ev.buf, silent = true, desc = "Show implementations" })
          keymap.set("n", "gt", builtin.lsp_type_definitions, { buffer = ev.buf, silent = true, desc = "Show type definitions" })
          keymap.set("n", "<leader>gs", builtin.lsp_document_symbols, { buffer = ev.buf, silent = true, desc = "Find symbols" })
          keymap.set("n", "<leader>gS", builtin.lsp_workspace_symbols, { buffer = ev.buf, silent = true, desc = "Find symbols" })
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, silent = true, desc = "See available code actions" })
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, silent = true, desc = "Smart rename" })
          keymap.set("n", "<leader>D", function () builtin.diagnostics({ bufnr = 0 }) end, { buffer = ev.buf, silent = true, desc = "Show buffer diagnostics" })
          keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = ev.buf, silent = true, desc = "Show line diagnostics" })
          keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = ev.buf, silent = true, desc = "Go to previous diagnostic" })
          keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = ev.buf, silent = true, desc = "Go to next diagnostic" })
          keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, silent = true, desc = "Show documentation for what is under cursor" })
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", { buffer = ev.buf, silent = true, desc = "Restart LSP" })
        end,
      })
  
      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()
  
      -- Change the Diagnostic symbols in the sign column (gutter)
      -- (not in youtube nvim video)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
  
      mason_lspconfig.setup_handlers({
        -- default handler for installed servers
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["svelte"] = function()
          -- configure svelte server
          lspconfig["svelte"].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.js", "*.ts" },
                callback = function(ctx)
                  -- Here use ctx.match instead of ctx.file
                  client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                end,
              })
            end,
          })
        end,
        ["graphql"] = function()
          -- configure graphql language server
          lspconfig["graphql"].setup({
            capabilities = capabilities,
            filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
          })
        end,
        ["emmet_ls"] = function()
          -- configure emmet language server
          lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
          })
        end,
        ["lua_ls"] = function()
          -- configure lua server (with special settings)
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          })
        end,
      })
    end,
  }