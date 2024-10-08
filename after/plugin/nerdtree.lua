local cwd = vim.fn.getcwd()
local argv = vim.fn.argv()


function get_nerd_dir()
  local nd = nil
  if vim.fn.argc() == 1 then
    local parent_dir = vim.fn.fnamemodify(argv[1], ":h")
    if vim.fn.isdirectory(argv[1]) == 1 then
      nd = argv[1]
    elseif vim.fn.isdirectory(parent_dir) == 1 then
      nd = parent_dir
    end
  end

  if nd == nil then
    nd = cwd
  end
  return nd
end

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.argc() == 1 then
      local parent_dir = vim.fn.fnamemodify(argv[1], ":h")
      if vim.fn.isdirectory(argv[1]) == 0 and vim.fn.isdirectory(parent_dir) == 1 then
        vim.cmd("NERDTree " .. parent_dir)
        return
      elseif vim.fn.isdirectory(argv[1]) == 1 then
        return
      end
    end
    vim.cmd("NERDTree " .. cwd)
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.cmd("wincmd l")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Close nvim if NERDTree is the only buffer remains",
  pattern = "*",
  callback = function()
    if (vim.fn.winnr("$") == 1 and vim.b ~= nil and vim.b.NERDTree ~= nil and vim.b.NERDTree._type == "tab") then
      vim.cmd.q()
    end
  end,
})

vim.keymap.set("n", "<C-n>", function()
  if vim.fn.exists(":NERDTreeToggle") then
    vim.cmd("NERDTreeToggle " .. get_nerd_dir())
  end
end)


vim.keymap.set("n", "<leader>rf", function()
  if string.find(vim.api.nvim_buf_get_name(0), "NERD_tree_tab") == nil then
    if vim.t.NERDTreeBufName ~= nil then
      vim.cmd("NERDTreeFind")
    end
  end
end)

