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
            "<leader-r>" = "cmp.mapping.scroll_docs(-4)";
            "<leader-f>" = "cmp.mapping.scroll_docs(4)";
            "<leader-tab>" = "cmp.mapping.complete()";
            "<leader-esc>" = "cmp.mapping.abort()";
            "<CR>" = "cmp.mapping.confirm({ select = false })";
        };
    };
}