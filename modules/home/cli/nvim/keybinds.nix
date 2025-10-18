{
    programs.nixvim = {
        keymaps = [
            {
                action = ":Telescope<CR>";
                key = "<leader>f";
            }
            {
                action = ":lua vim.diagnostic.open_float()<CR>";
                key = "<leader>n";
            }
            {
                action = ":lua vim.diagnostic.goto_next()<CR>";
                key = "<leader>r";
            }
            {
                action = "<C-\\><C-n>";
                key = "<leader-esc>";
                mode = "t";
            }
        ];
        plugins.cmp.settings.mapping = {
            "C-n" = "cmp.mapping.select_prev_item(select)";
            "<C-i>" = "cmp.mapping.scroll_docs(-4)";
            "<C-u>" = "cmp.mapping.scroll_docs(4)";
            "<C-tab>" = "cmp.mapping.complete()";
            "<esc>" = "cmp.mapping.abort()";
            "<CR>" = "cmp.mapping.confirm({ select = false })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace })";
        };
    };
}
