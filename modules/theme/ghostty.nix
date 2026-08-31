{
  pkgs,
  lib,
  palette,
}:
pkgs.writeText "ghostty-monochrome-theme" (
  lib.concatStringsSep "\n" [
    "background = ${palette.neutral_1}"
    "foreground = ${palette.neutral_11}"
    "cursor-color = ${palette.neutral_12}"
    "cursor-text = ${palette.neutral_1}"
    "selection-background = ${palette.neutral_5}"
    "selection-foreground = ${palette.neutral_12}"
    "search-background = ${palette.neutral_8}"
    "search-foreground = ${palette.neutral_1}"
    "search-selected-background = ${palette.neutral_11}"
    "search-selected-foreground = ${palette.neutral_0}"
    "split-divider-color = ${palette.neutral_5}"
    "palette = 0=${palette.neutral_0}"
    "palette = 1=${palette.red_1}"
    "palette = 2=${palette.green}"
    "palette = 3=${palette.amber}"
    "palette = 4=${palette.teal_1}"
    "palette = 5=${palette.orange}"
    "palette = 6=${palette.teal_1}"
    "palette = 7=${palette.neutral_11}"
    "palette = 8=${palette.neutral_6}"
    "palette = 9=${palette.red_3}"
    "palette = 10=${palette.green}"
    "palette = 11=${palette.yellow}"
    "palette = 12=${palette.cyan}"
    "palette = 13=${palette.orange}"
    "palette = 14=${palette.cyan}"
    "palette = 15=${palette.neutral_12}"
    ""
  ]
)
