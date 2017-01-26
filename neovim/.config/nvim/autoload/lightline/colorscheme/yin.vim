if exists('g:lightline')
  let s:bg = '#262626'
  let s:fg = '#868686'
  let s:gray0 = '#a0a0a0'
  let s:gray1 = '#686868'
  let s:gray2 = '#525252'
  let s:blue = '#00afd7'
  let s:brown = '#875f00'
  let s:green = '#00875f'
  let s:red = '#870000'

  let s:p = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}}
  let s:p.normal.left = [ [ s:bg, s:gray0, 'bold' ], [ s:bg, s:gray1 ] ]
  let s:p.normal.right = [ [s:bg, s:gray0 ], [ s:bg, s:gray1 ] ]
  let s:p.normal.middle = [ [ s:fg, s:bg ] ]
  let s:p.inactive.right = [ [ s:fg, s:bg ], [ s:fg, s:bg ] ]
  let s:p.inactive.left =  [ [ s:fg, s:bg ], [ s:fg, s:bg ] ]
  let s:p.inactive.middle = [ [ s:fg, s:bg ] ]
  let s:p.insert.left = [ [ s:bg, s:blue, 'bold' ], [ s:bg, s:gray1 ] ]
  let s:p.insert.right = [ [ s:bg, s:blue ], [ s:bg, s:gray1 ] ]
  let s:p.insert.middle = [ [ s:fg, s:bg ] ]
  let s:p.replace.left = [ [ s:bg, s:green, 'bold' ], [ s:bg, s:gray1 ] ]
  let s:p.replace.right = [ [ s:bg, s:green ], [ s:bg, s:gray1 ] ]
  let s:p.replace.middle = [ [ s:fg, s:bg ] ]
  let s:p.visual.left = [ [ s:bg, s:brown, 'bold' ], [ s:bg, s:gray1 ] ]
  let s:p.visual.right = [ [ s:bg, s:brown ], [ s:bg, s:gray1 ] ]
  let s:p.visual.middle = [ [ s:fg, s:bg ] ]
  let s:p.tabline.left = [ [ s:bg, s:gray1 ] ]
  let s:p.tabline.tabsel = [ [ s:bg, s:gray0 ] ]
  let s:p.tabline.middle = [ [ s:bg, s:bg ] ]
  let s:p.tabline.right = [ [ s:bg, s:brown ] ]
  let s:p.normal.error = [ [ s:bg, s:red ] ]
  let s:p.normal.warning = [ [ s:bg, s:brown ] ]

  let g:lightline#colorscheme#yin#palette = lightline#colorscheme#fill(s:p)
endif