local config = {
  colorscheme = "default_theme",

  options = {
    opt = {
      clipboard = "",
      splitright = false, -- vsplit behaviour
      autochdir = true, -- auto change path to current folder
    },
    g = {
      -- neovide
      neovide_transparency = 0.8,
      neovide_fullscreen = true,
      neovide_cursor_antialiasing = true,
      neovide_cursor_vfx_mode = "railgun",
      neovide_neovide_cursor_vfx_mode = "sonicboom",

      python3_host_prog = "/usr/bin/python3"
    },
  },

  header = {
    "   ▄───▄                                              ",
    "   █▀█▀█     ███████╗░█████╗░░█████╗░██╗░░██╗         ",
    "  ─█▄█▄█─    ╚════██║██╔══██╗██╔══██╗██║░██╔╝         ",
    "▄▄▄ ███      ░░███╔═╝███████║██║░░╚═╝█████═╝░         ",
    "█▐█ ████     ██╔══╝░░██╔══██║██║░░██╗██╔═██╗░    (●̮̮̃•̃)  ",
    "█   ████     ███████╗██║░░██║╚█████╔╝██║░╚██╗    /█\\  ",
    "▀▀▀▀▀▀▀▀     ╚══════╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝    .Π.  ",
  },

  lsp = {
    -- already installed servers
    servers = {
      "pyright",
      "clangd"
    }
  },

  -- Configure plugins
  plugins = {
    init = {
      { "easymotion/vim-easymotion", }, -- I map s in the normal mode
      { "tpope/vim-surround" }, -- default S in the visual mode
      { "dag/vim-fish" },
      { "wakatime/vim-wakatime" },
      { "elkowar/yuck.vim" },
      { "baskerville/vim-sxhkdrc" }
    }
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      n = {
        ["<leader>"] = {
          z = {
            name = "mine",
            c = {
              "code",
              -- can't map here when autocmd has the same map
              -- a = "run code in vs window"
            },
            p = "paste",
            y = "yank"
          }
        },
      },
    },
  },


  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    -- Set key bindings
    vim.keymap.set("n", "<C-s>", ":w!<CR>")
    vim.cmd("nmap s <Plug>(easymotion-overwin-f2)") -- vim-easymotion
    vim.cmd("nmap f <Plug>(easymotion-overwin-f)") -- vim-easymotion
    vim.keymap.set("n", "zp", '"+p')

    vim.keymap.set("i", "kk", "<Esc>")

    -- ensure <C-BS> works in termianl nvim
    vim.cmd([[
    noremap! <C-BS> <C-w>
    noremap! <C-h> <C-w> 
    ]])
    vim.keymap.set("i", "<C-BS>", "<C-w>")

    vim.keymap.set("v", "zy", '"+y')

    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    vim.api.nvim_create_augroup("code_run", { clear = true })
    vim.api.nvim_create_autocmd("BufWinEnter", {
      desc = "run python in split terminal",
      group = "code_run",
      pattern = "*.py",
      command = "nnoremap <silent> <leader>zca :w<CR>:vs term://time python %<CR>i"
    })
    vim.api.nvim_create_autocmd("BufWinEnter", {
      desc = "run go in split terminal",
      group = "code_run",
      pattern = "*.go",
      command = "nnoremap <silent> <leader>zca :w<CR>:vs term://time go run %<CR>i"
    })
    vim.api.nvim_create_autocmd("BufWinEnter", {
      desc = "run cpp in split terminal",
      group = "code_run",
      pattern = "*.cpp",
      command = "nnoremap <silent> <leader>zca :w<CR>:vs term://clang++ % -fsanitize=undefined -o .nvim_run.out && time ./.nvim_run.out && rm ./.nvim_run.out <CR>i"
    })

    vim.api.nvim_create_autocmd("BufWinEnter", {
      desc = "run c in split terminal",
      group = "code_run",
      pattern = "*.c",
      command = "nnoremap <silent> <leader>zca :w<CR>:vs term://clang % -fsanitize=undefined -o .nvim_run.out && time ./.nvim_run.out && rm ./.nvim_run.out <CR>i"
    })

    vim.api.nvim_create_autocmd("BufWinEnter", {
      desc = "run c in split terminal",
      group = "code_run",
      pattern = "*.java",
      command = "nnoremap <silent> <leader>zca :w<CR>:vs term://javac % && java %:r"
    })

    vim.api.nvim_create_autocmd("BufWinEnter", {
      desc = "run c in split terminal",
      group = "code_run",
      pattern = "*.sh",
      command = "nnoremap <silent> <leader>zca :w<CR>:vs term://bash %"
    })

    -- transparent background
    vim.cmd('autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg " transparent background')

    -- restore cursor postion to the last editing position
    vim.cmd([[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])
  end
}

return config
