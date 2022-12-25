require("mason-null-ls").setup({
    ensure_installed = { "stylua", "eslint_d", "prettier", "jq", "hadolint" },
    automatic_setup = true,
})
