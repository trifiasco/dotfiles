local home = vim.fn.expand("~/tbox/notes")
-- NOTE for Windows users:
-- - don't use Windows
-- - try WSL2 on Windows and pretend you're on Linux
-- - if you **must** use Windows, use "/Users/myname/zettelkasten" instead of "~/zettelkasten"
-- - NEVER use "C:\Users\myname" style paths
require('telekasten').setup({
    home         = home,

    -- if true, telekasten will be enabled when opening a note within the configured home
    take_over_my_home = true,

    -- auto-set telekasten filetype: if false, the telekasten filetype will not be used
    --                               and thus the telekasten syntax will not be loaded either
    auto_set_filetype = true,

    -- dir names for special notes (absolute path or subdir name)
    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',

    -- image (sub)dir for pasting
    -- dir name (absolute path or subdir name)
    -- or nil if pasted images shouldn't go into a special subdir
    image_subdir = "img",

    -- markdown file extension
    extension    = ".md",

    -- following a link to a non-existing note will create it
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,

    -- template for new notes (new_note, follow_link)
    -- set to `nil` or do not specify if you do not want a template
    template_new_note = home .. '/' .. 'templates/new_note.md',

    -- template for newly created daily notes (goto_today)
    -- set to `nil` or do not specify if you do not want a template
    template_new_daily = home .. '/' .. 'templates/daily.md',

    -- template for newly created weekly notes (goto_thisweek)
    -- set to `nil` or do not specify if you do not want a template
    template_new_weekly= home .. '/' .. 'templates/weekly.md',

    -- image link style
    -- wiki:     ![[image name]]
    -- markdown: ![](image_subdir/xxxxx.png)
    image_link_style = "markdown",

    -- integrate with calendar-vim
    plug_into_calendar = true,
    calendar_opts = {
        -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
        weeknm = 4,
        -- use monday as first day of week: 1 .. true, 0 .. false
        calendar_monday = 1,
        -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
        calendar_mark = 'left-fit',
    },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = "#tag",

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = "dropdown",

    -- tag list theme:
    -- get_cursor: small tag list at cursor; ivy and dropdown like above
    show_tags_theme = "dropdown",

    -- when linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links = true,

    -- template_handling
    -- What to do when creating a new note via `new_note()` or `follow_link()`
    -- to a non-existing note
    -- - prefer_new_note: use `new_note` template
    -- - smart: if day or week is detected in title, use daily / weekly templates (default)
    -- - always_ask: always ask before creating a note
    template_handling = "always_ask",

    -- path handling:
    --   this applies to:
    --     - new_note()
    --     - new_templated_note()
    --     - follow_link() to non-existing note
    --
    --   it does NOT apply to:
    --     - goto_today()
    --     - goto_thisweek()
    --
    --   Valid options:
    --     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
    --              all other ones in home, except for notes/with/subdirs/in/title.
    --              (default)
    --
    --     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
    --                    except for notes with subdirs/in/title.
    --
    --     - same_as_current: put all new notes in the dir of the current note if
    --                        present or else in home
    --                        except for notes/with/subdirs/in/title.
    new_note_location = "smart",

    -- should all links be updated when a file is renamed
    rename_update_links = true,
})

-- mappings for telekasten

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>zf', [[<cmd>lua require('telekasten').find_notes()<CR>]], opts)
map('n', '<leader>zd', [[<cmd>lua require('telekasten').find_daily_notes()<CR>]], opts)
map('n', '<leader>zw', [[<cmd>lua require('telekasten').find_weekly_notes()<CR>]], opts)
map('n', '<leader>zg', [[<cmd>lua require('telekasten').search_notes()<CR>]], opts)

map('n', '<leader>zT', [[<cmd>lua require('telekasten').goto_today()<CR>]], opts)
map('n', '<leader>zW', [[<cmd>lua require('telekasten').goto_thisweek()<CR>]], opts)

map('n', '<leader>zn', [[<cmd>lua require('telekasten').new_note()<CR>]], opts)
map('n', '<leader>zN', [[<cmd>lua require('telekasten').new_template_note()<CR>]], opts)

map('n', '<leader>zc', [[<cmd>lua require('telekasten').show_calendar()<CR>]], opts)
map('n', '<leader>zt', [[<cmd>lua require('telekasten').toggle_todo()<CR>]], opts)

map('n', '<leader>zr', [[<cmd>lua require('telekasten').rename_note()<CR>]], opts)
map('n', '<leader>za', [[<cmd>lua require('telekasten').show_tags()<CR>]], opts)
map('n', '<leader>zb', [[<cmd>lua require('telekasten').show_backlinks()<CR>]], opts)
map('n', '<leader>zF', [[<cmd>lua require('telekasten').find_friends()<CR>]], opts)
map('n', '<leader>zz', [[<cmd>lua require('telekasten').follow_link()<CR>]], opts)

map('n', '<leader>z', [[<cmd>lua require('telekasten').panel()<CR>]], opts)


-- nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
-- nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
-- nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
-- nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
-- nnoremap <leader>zT :lua require('telekasten').goto_today()<CR>
-- nnoremap <leader>zW :lua require('telekasten').goto_thisweek()<CR>
-- nnoremap <leader>zw :lua require('telekasten').find_weekly_notes()<CR>
-- nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
-- nnoremap <leader>zN :lua require('telekasten').new_templated_note()<CR>
-- nnoremap <leader>zy :lua require('telekasten').yank_notelink()<CR>
-- nnoremap <leader>zc :lua require('telekasten').show_calendar()<CR>
-- nnoremap <leader>zC :CalendarT<CR>
-- nnoremap <leader>zi :lua require('telekasten').paste_img_and_link()<CR>
-- nnoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>
-- nnoremap <leader>zb :lua require('telekasten').show_backlinks()<CR>
-- nnoremap <leader>zF :lua require('telekasten').find_friends()<CR>
-- nnoremap <leader>zI :lua require('telekasten').insert_img_link({ i=true })<CR>
-- nnoremap <leader>zp :lua require('telekasten').preview_img()<CR>
-- nnoremap <leader>zm :lua require('telekasten').browse_media()<CR>
-- nnoremap <leader>za :lua require('telekasten').show_tags()<CR>
-- nnoremap <leader># :lua require('telekasten').show_tags()<CR>
-- nnoremap <leader>zr :lua require('telekasten').rename_note()<CR>
--
-- -- on hesitation, bring up the panel
-- nnoremap <leader>z :lua require('telekasten').panel()<CR>
--
-- -- " we could define [[ in **insert mode** to call insert link
-- -- " inoremap [[ <cmd>:lua require('telekasten').insert_link()<CR>
-- -- " alternatively: leader [
-- inoremap <leader>[ <cmd>:lua require('telekasten').insert_link({ i=true })<CR>
-- inoremap <leader>zt <cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>
-- inoremap <leader># <cmd>lua require('telekasten').show_tags({i = true})<cr>

-- " ----- the following are for syntax-coloring [[links]] and ==highlighted text==
-- " ----- (see the section about coloring in README.md)
--
-- " for gruvbox
-- hi tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline
-- hi tkBrackets ctermfg=gray guifg=gray
--
-- " real yellow
-- hi tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold guibg=yellow guifg=darkred gui=bold
-- " gruvbox
-- "hi tkHighlight ctermbg=214 ctermfg=124 cterm=bold guibg=#fabd2f guifg=#9d0006 gui=bold
--
-- hi link CalNavi CalRuler
-- hi tkTagSep ctermfg=gray guifg=gray
-- hi tkTag ctermfg=175 guifg=#d3869B
