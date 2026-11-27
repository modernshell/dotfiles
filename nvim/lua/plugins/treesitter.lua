-- https://github.com/modernshell/dotfiles/nvim
-- modern.shell@gmail.com
-- ~/.config/nvim/lua/plugins/treesitter.lua
-- neovim 0.12

-- Tree-sitter plugin
vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
    },
})

local ts = require("nvim-treesitter")

-- Configure installation directory
ts.setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
})

-- Language parsers
local parsers = {
    -- Neovim
    "lua",
    "vim",
    "vimdoc",
    "query",

    -- Programming
    "python",
    "bash",
    "perl",
    "regex",
    "sql",

    -- Configuration
    "json",
    "yaml",
    "toml",
    "ini",
    "xml",

    -- DevOps
    "dockerfile",
    "terraform",
    "hcl",
    "make",
    "gitignore",
    "gitcommit",

    -- Documentation
    "markdown",
    "markdown_inline",

    -- Web
    "html",
    "css",
    "javascript",
}

-- Install missing parsers
ts.install(parsers)

-- Create autocommand group
local group = vim.api.nvim_create_augroup(
    "TreesitterConfig",
    { clear = true }
)

-- Enable Tree-sitter features
vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(args)
        local buf = args.buf

        -- Skip special buffers
        if vim.bo[buf].buftype ~= "" then
            return
        end

        -- Skip large files (> 1 MiB)
        local size = vim.fn.getfsize(
            vim.api.nvim_buf_get_name(buf)
        )

        if size > 1024 * 1024 then
            return
        end

        -- Resolve parser language
        local lang = vim.treesitter.language.get_lang(
            vim.bo[buf].filetype
        )

        if not lang then
            return
        end

        -- Enable syntax highlighting
        local ok = pcall(vim.treesitter.start, buf, lang)

        if not ok then
            return
        end

        -- Enable indentation if supported
        local has_indent, query = pcall(
            vim.treesitter.query.get, lang, "indents"
        )

        if has_indent and query then
            vim.bo[buf].indentexpr =
                "v:lua.require'nvim-treesitter'.indentexpr()"
        end

        -- Enable code folding
        vim.wo[0][0].foldmethod = "expr"
        vim.wo[0][0].foldexpr =
            "v:lua.vim.treesitter.foldexpr()"

        -- Keep folds open by default
        vim.wo[0][0].foldlevel = 99
    end,
})
