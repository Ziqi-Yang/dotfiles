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
    "   ▄───▄                                         ▄───▄   ",
    "   █▀█▀█     ███████╗░█████╗░░█████╗░██╗░░██╗    █▀█▀█   ",
    "  ─█▄█▄█─    ╚════██║██╔══██╗██╔══██╗██║░██╔╝   ─█▄█▄█─  ",
    "▄▄▄ ███      ░░███╔═╝███████║██║░░╚═╝█████═╝░     ███ ▄▄▄",
    "█▐█ ████     ██╔══╝░░██╔══██║██║░░██╗██╔═██╗░    ████ █▐█",
    "█   ████     ███████╗██║░░██║╚█████╔╝██║░╚██╗    ████   █",
    "▀▀▀▀▀▀▀▀     ╚══════╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝    ▀▀▀▀▀▀▀▀",
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

  mappings = {
    -- cannot map key to key here
    -- to make things consistent, use map in `polish` function(end of the configuration)
    n = {
      ["<leader>c"] = false,
      ["<leader>d"] = false,
      ["<leader>h"] = false;
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    register = {
      n = {
        ["<leader>"] = {
          ["z"] = {
            name = "extra",
            ["c"] = {
              name = "code",
              ["a"] = "run"
            }
          },
          ["c"] = { name = "code" },
        },
      },
    },
  },


  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    -- Set key bindings
    local map = vim.api.nvim_set_keymap

    -- -- normal mode
    -- code
    map("n", "<leader>cf", "<leader>lf", { desc = "Foramt" })
    map("n", "<leader>cr", "<leader>lr", { desc = "rename" })
    map("n", "<leader>cs", "<leader>ls", { desc = "symbols" })
    map("n", "<A-CR>", "<leader>la", { desc = "actions" })
    map("n", "<leader>cx", "<leader>ld", { desc = "diagnostics" })
    map("n", "<leader>cX", "<leader>lD", { desc = "All Diagnostics" })
    map("n", "<leader>cd", "<leader>lR", { desc = "jump to definition" }) -- definition & reference
    map("n", "<leader>cD", "<leader>lR", { desc = "jump to reference" }) -- definition & reference(same)
    map("n", "<leader>cS", "<leader>lS", { desc = "outline" })
    map("n", "<leader>cG", "<leader>lG", { desc = "workspace symbols" })

    --
    map("n", "s", "<Plug>(easymotion-overwin-f2)", { desc = "vim-easymotion-s" })
    map("n", "f", "<Plug>(easymotion-overwin-f)", { desc = "vim-easymotion-f" })

    -- files
    map("n", "<leader>fr", "<leader>fo", { desc = "recent files" })
    map("n", "<leader>fi", ":e ~/.config/nvim/lua/user/init.lua<CR>", { desc = "edit init.lua" })

    -- lsp
    map("n", "<leader>lm", ":Mason<CR>", { desc = "manage lsp" })

    -- search
    map("n", "<leader>ss", "<leader>fw", { desc = "search(fuzzy)" })
    map("n", "<leader>sS", "<leader>fc", { desc = "search(exact)" })
    map("n", "<leader>sA", "<leader>fW", { desc = "search words in all files" })
    map("n", "<leader>sm", "<leader>fm", { desc = "marks" })

    -- buffer
    map("n", "<leader>bb", "<leader>fb", { desc = "change" })
    map("n", "<leader>bk", "<leader>C", { desc = "kill" })


    -- help
    map("n", "<leader>hk", "<leader>sk", { desc = "keys" })
    map("n", "<leader>hh", "<leader>sh", { desc = "help" })
    map("n", "<leader>hc", "<leader>sc", { desc = "commands" })
    map("n", "<leader>hm", "<leader>sm", { desc = "man" })

    -- insert mode
    map("i", "kk", "<Esc>", { desc = "escape" })


    -- ensure <C-BS> works in termianl nvim
    vim.cmd([[
    noremap! <C-BS> <C-w>
    noremap! <C-h> <C-w> 
    ]])
    map("i", "<C-BS>", "<C-w>", { desc = "back-detele a word" })


    -- autocommands
    vim.api.nvim_create_augroup("code_run", { clear = true })
    vim.api.nvim_create_autocmd("BufWinEnter",
      { desc = "run python in split terminal", group = "code_run", pattern = "*.py",
        command = "nnoremap <silent> <leader>zca :w<CR>:vs term://time python %<CR>i" })
    vim.api.nvim_create_autocmd("BufWinEnter",
      { desc = "run go in split terminal", group = "code_run", pattern = "*.go",
        command = "nnoremap <silent> <leader>zca :w<CR>:vs term://time go run %<CR>i" })
    vim.api.nvim_create_autocmd("BufWinEnter",
      { desc = "run cpp in split terminal", group = "code_run", pattern = "*.cpp",
        command = "nnoremap <silent> <leader>zca :w<CR>:vs term://clang++ % -fsanitize=undefined -o .nvim_run.out && time ./.nvim_run.out && rm ./.nvim_run.out <CR>i" })
    vim.api.nvim_create_autocmd("BufWinEnter",
      { desc = "run c in split terminal", group = "code_run", pattern = "*.c",
        command = "nnoremap <silent> <leader>zca :w<CR>:vs term://clang % -fsanitize=undefined -o .nvim_run.out && time ./.nvim_run.out && rm ./.nvim_run.out <CR>i" })
    vim.api.nvim_create_autocmd("BufWinEnter",
      { desc = "run c in split terminal", group = "code_run", pattern = "*.java",
        command = "nnoremap <silent> <leader>zca :w<CR>:vs term://javac % && java %:r" })
    vim.api.nvim_create_autocmd("BufWinEnter",
      { desc = "run bash script", group = "code_run", pattern = "*.sh",
        command = "nnoremap <silent> <leader>zca :w<CR>:vs term://bash %" })



    -- transparent background
    vim.cmd('autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg " transparent background')
    -- restore cursor postion to the last editing position
    vim.cmd([[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])
  end
}

return config
