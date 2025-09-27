" modified version of the seoul256 theme created by JB Kopecky (https://github.com/jbkopecky)

let g:airline#themes#meltheme#palette = {}

function! airline#themes#meltheme#refresh() abort
	let s:A = airline#themes#get_highlight('Special')
	let s:N2 = airline#themes#get_highlight2(['StatusLineNC', 'bg'], ['StatusLineNC', 'fg'])
	let s:N3 = airline#themes#get_highlight2(['CursorLine', 'fg'], ['CursorLine', 'bg'])
	let s:M = airline#themes#get_highlight2(['Special', 'fg'], ['CursorLine', 'bg'])
	let s:N = airline#themes#get_highlight2(['StatusLine', 'bg'], ['StatusLine', 'fg'])
	let s:I = airline#themes#get_highlight2(['TabLineSel', 'fg'], ['TabLineSel', 'bg'])
	let s:R = airline#themes#get_highlight2(['Structure', 'bg'], ['Structure', 'fg'])
	let s:V = airline#themes#get_highlight2(['ErrorMsg', 'fg'], ['ErrorMsg', 'bg'])
	let s:W = airline#themes#get_highlight2(['airline_warning', 'bg'], ['airline_warning', 'fg'])

	let g:airline#themes#meltheme#palette.normal = airline#themes#generate_color_map(s:N, s:N2, s:N3)
	let g:airline#themes#meltheme#palette.normal.airline_warning = s:W
	let g:airline#themes#meltheme#palette.normal.airline_term = s:N3
	let g:airline#themes#meltheme#palette.normal_modified = { 'airline_c': s:M }
	let g:airline#themes#meltheme#palette.normal_modified.airline_warning = s:W
	let g:airline#themes#meltheme#palette.normal_modified.airline_term = s:N3

	let g:airline#themes#meltheme#palette.insert = airline#themes#generate_color_map(s:I, s:N2, s:N3)
	let g:airline#themes#meltheme#palette.insert.airline_warning = g:airline#themes#meltheme#palette.normal.airline_warning
	let g:airline#themes#meltheme#palette.insert.airline_term = g:airline#themes#meltheme#palette.normal.airline_term
	let g:airline#themes#meltheme#palette.insert_modified = g:airline#themes#meltheme#palette.normal_modified

	let g:airline#themes#meltheme#palette.replace = airline#themes#generate_color_map(s:R, s:N2, s:N3)
	let g:airline#themes#meltheme#palette.replace.airline_warning = g:airline#themes#meltheme#palette.normal.airline_warning
	let g:airline#themes#meltheme#palette.replace.airline_term = g:airline#themes#meltheme#palette.normal.airline_term
	let g:airline#themes#meltheme#palette.replace_modified = g:airline#themes#meltheme#palette.normal_modified

	let g:airline#themes#meltheme#palette.visual = airline#themes#generate_color_map(s:V, s:N2, s:N3)
	let g:airline#themes#meltheme#palette.visual.airline_warning = g:airline#themes#meltheme#palette.normal.airline_warning
	let g:airline#themes#meltheme#palette.visual.airline_term = g:airline#themes#meltheme#palette.normal.airline_term
	let g:airline#themes#meltheme#palette.visual_modified = g:airline#themes#meltheme#palette.normal_modified

	let g:airline#themes#meltheme#palette.terminal = g:airline#themes#meltheme#palette.insert
	let g:airline#themes#meltheme#palette.terminal_modified = g:airline#themes#meltheme#palette.normal_modified

	let g:airline#themes#meltheme#palette.inactive = airline#themes#generate_color_map(s:N3, s:N3, s:N3)
	let g:airline#themes#meltheme#palette.inactive.airline_term = s:N3
	let g:airline#themes#meltheme#palette.inactive_modified = { 'airline_c': s:M }
	let g:airline#themes#meltheme#palette.inactive_modified.airline_term = s:N3

	let g:airline#themes#meltheme#palette.accents = { 'red': s:A }

	let s:TF = airline#themes#get_highlight2(['Normal', 'bg'], ['Normal', 'bg'])
	let g:airline#themes#meltheme#palette.tabline = {
		\ 'airline_tab':  s:N2,
		\ 'airline_tabsel':  s:N,
		\ 'airline_tabtype':  s:V,
		\ 'airline_tabfill':  s:TF,
		\ 'airline_tabhid':  s:N3,
		\ 'airline_tabmod':  s:I
	\ }
endfunction

call airline#themes#meltheme#refresh()
