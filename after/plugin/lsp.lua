vim.lsp.enable({
  "ts_ls",
  "rust_analyzer",
  "ruff",
  "pyright",
  "terraformls",
  "phpactor",
  "clangd",
  "gopls",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, remap = false }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
    vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params(0, "utf-8")
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
    for _, res in pairs(result or {}) do
      for _, action in pairs(res.result or {}) do
        if action.edit then
          vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
})
