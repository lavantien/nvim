local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {
                -- Optional
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },                  -- Required
            { "hrsh7th/cmp-nvim-lsp" },              -- Required
            { "L3MON4D3/LuaSnip" },                  -- Required
        },
    })
    use({
        "mfussenegger/nvim-dap",
        "jay-babu/mason-nvim-dap.nvim",
        'leoluz/nvim-dap-go',
        requires = {
            "williamboman/mason.nvim",
        }
    })
    use {
        "rcarriga/nvim-dap-ui",
        'folke/neodev.nvim',
        'theHamsta/nvim-dap-virtual-text',
        requires = {
            "mfussenegger/nvim-dap",
        }
    }
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.x",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    })
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }


    use("folke/tokyonight.nvim")
    use({
        "rose-pine/neovim",
        as = "rose-pine",
    })
    use({
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup({})
        end,
    })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })

    use {
        'nmac427/guess-indent.nvim',
        config = function() require('guess-indent').setup {} end,
    }

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("jose-elias-alvarez/null-ls.nvim")
    use("j-hui/fidget.nvim")

    --use("theprimeagen/harpoon")
    use("theprimeagen/refactoring.nvim")
    use("nvim-treesitter/nvim-treesitter-context")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    use("Exafunction/codeium.vim")
    use("wakatime/vim-wakatime")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
