if exists('g:lightline')
  let s:bg = '#262626'
  let s:fg = '#bcbcbc'
  let s:black = '#1c1c1c'
  let s:gray0 = '#e4e4e4'
  let s:gray1 = '#8a8a8a'
  let s:gray2 = '#525252'
  let s:blue = '#00afd7'
  let s:brown = '#875f00'
  let s:green = '#00875f'
  let s:red = '#870000'

  let s:p = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}}
  let s:p.normal.left = [ [ s:black, s:gray0, 'bold' ], [ s:bg, s:gray1 ] ]
  let s:p.normal.right = [ [s:black, s:gray0 ], [ s:bg, s:gray1 ] ]
  let s:p.normal.middle = [ [ s:fg, s:bg ] ]
  let s:p.inactive.right = [ [ s:fg, s:bg ], [ s:fg, s:bg ] ]
  let s:p.inactive.left =  [ [ s:fg, s:bg ], [ s:fg, s:bg ] ]
  let s:p.inactive.middle = [ [ s:fg, s:bg ] ]
  let s:p.insert.left = [ [ s:black, s:blue, 'bold' ], [ s:black, s:gray1 ] ]
  let s:p.insert.right = [ [ s:black, s:blue ], [ s:black, s:gray1 ] ]
  let s:p.insert.middle = [ [ s:fg, s:bg ] ]
  let s:p.replace.left = [ [ s:black, s:green, 'bold' ], [ s:black, s:gray1 ] ]
  let s:p.replace.right = [ [ s:black, s:green ], [ s:black, s:gray1 ] ]
  let s:p.replace.middle = [ [ s:fg, s:bg ] ]
  let s:p.visual.left = [ [ s:black, s:brown, 'bold' ], [ s:black, s:gray1 ] ]
  let s:p.visual.right = [ [ s:black, s:brown ], [ s:black, s:gray1 ] ]
  let s:p.visual.middle = [ [ s:fg, s:bg ] ]
  let s:p.tabline.left = [ [ s:black, s:gray1 ] ]
  let s:p.tabline.tabsel = [ [ s:black, s:gray0 ] ]
  let s:p.tabline.middle = [ [ s:bg, s:bg ] ]
  let s:p.tabline.right = [ [ s:black, s:brown ] ]
  let s:p.normal.error = [ [ s:black, s:red ] ]
  let s:p.normal.warning = [ [ s:black, s:brown ] ]

  let g:lightline#colorscheme#yin#palette = lightline#colorscheme#fill(s:p)
endif
