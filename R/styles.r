
## ----------------------------------------------------------------------
## Styles

codes <- list(
  reset = list(0, c(0, 22, 23, 24, 27, 28, 29, 39, 49)),
  bold = list(1, 22), # 21 isn't widely supported and 22 does the same thing
  blurred = list(2, 22),
  italic = list(3, 23),
  underline = list(4, 24),
  inverse = list(7, 27),
  hidden = list(8, 28),
  strikethrough = list(9, 29),

  black = list(30, 39),
  red = list(31, 39),
  green = list(32, 39),
  yellow = list(33, 39),
  blue = list(34, 39),
  magenta = list(35, 39),
  cyan = list(36, 39),
  white = list(37, 39),
  silver = list(90, 39),

  blackBright = list(90, 39),
  redBright = list(91, 39),
  greenBright = list(92, 39),
  yellowBright = list(93, 39),
  blueBright = list(94, 39),
  magentaBright = list(95, 39),
  cyanBright = list(96, 39),
  whiteBright = list(97, 39),
  silverBright = list(98, 39),

  bgBlack = list(40, 49),
  bgRed = list(41, 49),
  bgGreen = list(42, 49),
  bgYellow = list(43, 49),
  bgBlue = list(44, 49),
  bgMagenta = list(45, 49),
  bgCyan = list(46, 49),
  bgWhite = list(47, 49),

  bgBlackBright = list(100, 49),
  bgRedBright = list(101, 49),
  bgGreenBright = list(102, 49),
  bgYellowBright = list(103, 49),
  bgBlueBright = list(104, 49),
  bgMagentaBright = list(105, 49),
  bgCyanBright = list(106, 49),
  bgWhiteBright = list(107, 49)
)

## ANSI fg color -> R color

ansi_fg_r <- c(
  "black" = "black",
  "red" = "red",
  "green" = "green",
  "yellow" = "yellow",
  "blue" = "blue",
  "magenta" = "magenta",
  "cyan" = "cyan",
  "white" = "white",
  "silver" = "grey",
  "blackBright" = "black",
  "redBright" = "red",
  "greenBright" = "green",
  "yellowBright" = "yellow",
  "blueBright" = "blue",
  "magentaBright" = "magenta",
  "cyanBright" = "cyan",
  "whiteBright" = "white",
  "silverBright" = "grey"
)

ansi_fg_rgb <- col2rgb(ansi_fg_r)

ansi_bg_r <- c(
  "bgBlack" = "black",
  "bgRed" = "red",
  "bgGreen" = "green",
  "bgYellow" = "yellow",
  "bgBlue" = "blue",
  "bgMagenta" = "magenta",
  "bgCyan" = "cyan",
  "bgWhite" = "white",
  "bgBlackBright" = "black",
  "bgRedBright" = "red",
  "bgGreenBright" = "green",
  "bgYellowBright" = "yellow",
  "bgBlueBright" = "blue",
  "bgMagentaBright" = "magenta",
  "bgCyaBrightn" = "cyan",
  "bgWhiteBright" = "white"
)

ansi_bg_rgb <- col2rgb(ansi_bg_r)

# code can have length > 1, used to generate the closing tags for reset

make_chr_ansi_tag <- function(code)
  paste0('\u001b[', chr(code), 'm', collapse="")

make_chr_style <- function(code) {
  list(
    open = make_chr_ansi_tag(codes[[code]][[1]]),
    close = make_chr_ansi_tag(codes[[code]][[2]])
  )
}

builtin_styles <- lapply(names(codes), make_chr_style)
names(builtin_styles) <- names(codes)
