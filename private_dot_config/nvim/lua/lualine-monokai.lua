local Colors = {
  white          = '#e8e8e3',
  pink           = '#F92772',
  green          = '#A6E22D',
  aqua           = '#66d9ef',
  cyan           = '#a1efe4',
  br_cyan        = '#54CED6',
  yellow         = '#E6DB74',
  orange         = '#FD9720',
  purple         = '#ae81ff',
  red            = '#e73c50',
  purered        = '#ff0000',
  darkred        = '#5f0000',
  black          = '#272822',
  gray2          = '#2D2E27',
  gray4          = '#383a3e',
  gray5          = '#3f4145',
  gray7          = '#8f908a',
  gray10         = '#d8d8d3',
}

return {
  normal = {
    a = { fg = Colors.black, bg = Colors.green, gui = 'bold' },
    b = { fg = Colors.gray10, bg = Colors.gray5 },
    c = { fg = Colors.gray7, bg = Colors.gray2 },
  },
  insert = {
	a = { fg = Colors.black, bg = Colors.cyan, gui = 'bold' },
  },
  visual = {
	a = { fg = Colors.black, bg = Colors.pink, gui = 'bold' },
  },
  replace = {
	a = { fg = Colors.black, bg = Colors.purple, gui = 'bold' },
  },
  command = {
	a = { fg = Colors.black, bg = Colors.orange, gui = 'bold' },
  },
  inactive = {
    a = { fg = Colors.black, bg = Colors.gray5, gui = 'bold' },
    b = { fg = Colors.black, bg = Colors.gray5 },
    c = { bg = Colors.black, fg = Colors.gray5 },
  },
}
