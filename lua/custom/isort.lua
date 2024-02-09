return {
  'fisadev/vim-isort',
  ft = 'python',
  config = function ()
    vim.g.vim_isort_mav = ''

    vim.api.nvim_create_autocmd({ "BufWritePer" },{
      pattern = '*.py',
      callback = function ()
        vim.cmd('Isort')
      end
    })
  end
}
