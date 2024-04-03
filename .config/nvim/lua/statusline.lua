--[[
TODO:
* only show basic information for non-focused windows
]]

function sl_mode()
  local modestrings = {
    ['n']  = 'N',
    ['no'] = 'N·OP',
    ['v']  = 'V',
    ['V']  = 'V·L',
    [''] = 'V·B',
    ['s']  = 'S',
    ['S']  = 'S·L',
    [''] = 'S·B',
    ['i']  = 'I',
    ['R']  = 'R',
    ['Rv'] = 'V·R',
    ['c']  = 'Cmd',
    ['cv'] = 'V·Ex',
    ['ce'] = 'Ex',
    ['r']  = 'P',
    ['rm'] = 'M',
    ['r?'] = 'Conf',
    ['!']  = 'Sh',
    ['t']  = 'T',
  }

  return modestrings[vim.fn.mode()]:upper()
end

function sl_modified()
  return vim.bo.modified and '+' or ''
end

function sl_ftype()
  return vim.bo.filetype:gsub('[[]]', '')
end

function sl_lends()
  return vim.bo.fileformat:gsub('[[]]', '')
end

function sl_fenc()
  return vim.bo.fileencoding
end

function sl_gitstatus()
  local gstat = vim.b['gitsigns_status_dict']
  if gstat ~= nil then
    local added = gstat['added']
    local changed = gstat['changed']
    local removed = gstat['removed']
    local branch = gstat['head']
    local result = branch

    if added ~= nil and added > 0 then
      result = result..string.format(' +%d', added)
    end
    if changed ~= nil and changed > 0 then
      result = result..string.format(' ~%d', changed)
    end
    if removed ~= nil and removed > 0 then
      result = result..string.format(' -%d', removed)
    end

    return vim.trim(result)
  end
  return ''
end

function sl_click_buf(w, n, b, m)
  if b == 'l' then
    local builtin = require'telescope.builtin'
    local themes = require'telescope.themes'
    builtin.buffers(themes.get_ivy{})
  end
end

function sl_click_fname(w, n, b, m)
  if b == 'l' then
    local builtin = require'telescope.builtin'
    local themes = require'telescope.themes'
    builtin.find_files(themes.get_ivy{
      no_ignore=true,
      no_ignore_parent=true,
      hidden=true,
    })
  end
end

function sl_click_ft(w, n, b, m)
  if b == 'l' then
    local builtin = require'telescope.builtin'
    local themes = require'telescope.themes'
    builtin.filetypes(themes.get_dropdown{})
  end
end

function sl_click_ff(w, n, b, m)
  if b == 'l' then
    -- TODO: I would love to figure out how to replace this with a nvim popup
    -- menu...
    vim.ui.select({ 'Unix (LF)', 'DOS (CRLF)', 'Mac (CR)' }, {
      prompt = 'Select file format:',
    }, function(choice)
      if choice ~= nil then
        vim.bo.fileformat = string.match(choice:lower(), '%S+')
      end
    end)
  end
end

function sl_click_git(w, n, b, m)
  if b == 'l' then
    local builtin = require'telescope.builtin'
    builtin.git_status()
  end
end

function _G.statusline()
  return table.concat({
    '%1*%( %{v:lua.sl_mode()} %)', --mode
    '%2*%-( %@v:lua.sl_click_buf@%n:%X %<%@v:lua.sl_click_fname@%([%R] %)%f%{v:lua.sl_modified()}%X %)', --file name
    '%1*%( %@v:lua.sl_click_ft@%{v:lua.sl_ftype()}%X %)', --file type
    '%( %@v:lua.sl_click_ff@%{v:lua.sl_lends()}%X %)', --line endings
    '%( %{v:lua.sl_fenc()} %)', --file encoding
    '%=',
    '%( %@v:lua.sl_click_git@[%{v:lua.sl_gitstatus()}]%X %)', --git
    '%( %p%% %)', --percentage through the file
    '%2*%( %l:%c%V %)', --line/column/virtual column
  })
end

vim.opt.statusline = '%{%v:lua.statusline()%}'
