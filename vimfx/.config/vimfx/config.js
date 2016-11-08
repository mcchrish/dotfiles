const options = {
  "mode.normal.scroll_half_page_down": "d <c-d>",
  "mode.normal.scroll_half_page_up": "u <c-u>",
  "mode.normal.tab_select_previous": "J    gT <c-h>",
  "mode.normal.tab_select_next": "K    gt <c-l>",
  "mode.normal.esc": "<force><escape> <force><c-c>",
  "mode.hints.exit": "<escape> <c-c>",
  "mode.ignore.exit": "<s-escape> <force><c-c>",
  "mode.find.exit": "<escape>    <enter> <c-c>"
}

Object.entries(options).forEach(([option, value]) => vimfx.set(option, value))
