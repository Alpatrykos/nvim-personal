local lsp = require('lsp-zero').preset({})

lsp.preset("recommended")

lsp.ensure_installed({
    'gopls',
    'omnisharp',
})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
    vim.keymap.set("n", "<leader>vd", function () vim.diagnostic.open_float() end)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
    vim.keymap.set("n", "<leader>vnr", function() vim.lsp.buf.rename() end)
    vim.keymap.set("n", "<leader>vff", function() vim.lsp.buf.format() end)
    vim.keymap.set("i", "C-h", function() vim.lsp.buf.signature_help() end)
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
