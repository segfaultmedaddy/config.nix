{
  pkgs,
  palette,
}:
(pkgs.formats.json { }).generate "opencode-monochrome-theme.json" {
  "$schema" = "https://opencode.ai/theme.json";
  defs = palette;
  theme = {
    primary = "neutral_12";
    secondary = "neutral_8";
    accent = "orange";
    error = "red_2";
    warning = "purple";
    success = "green";
    info = "cyan";
    text = "neutral_12";
    textMuted = "neutral_9";
    background = "neutral_1";
    backgroundPanel = "neutral_0";
    backgroundElement = "neutral_3";
    border = "neutral_2";
    borderActive = "neutral_12";
    borderSubtle = "neutral_2";
    diffAdded = "green";
    diffRemoved = "red_1";
    diffContext = "neutral_7";
    diffHunkHeader = "yellow";
    diffHighlightAdded = "green";
    diffHighlightRemoved = "red_1";
    diffAddedBg = "teal_0";
    diffRemovedBg = "red_0";
    diffContextBg = "neutral_1";
    diffLineNumber = "neutral_7";
    diffAddedLineNumberBg = "teal_0";
    diffRemovedLineNumberBg = "red_0";
    markdownText = "neutral_12";
    markdownHeading = "neutral_12";
    markdownLink = "cyan";
    markdownLinkText = "cyan";
    markdownCode = "neutral_10";
    markdownBlockQuote = "neutral_7";
    markdownEmph = "neutral_10";
    markdownStrong = "neutral_12";
    markdownHorizontalRule = "neutral_5";
    markdownListItem = "neutral_8";
    markdownListEnumeration = "neutral_8";
    markdownImage = "cyan";
    markdownImageText = "neutral_9";
    markdownCodeBlock = "neutral_11";
    syntaxComment = "neutral_7";
    syntaxKeyword = "neutral_8";
    syntaxFunction = "neutral_12";
    syntaxVariable = "neutral_12";
    syntaxString = "neutral_10";
    syntaxNumber = "neutral_12";
    syntaxType = "neutral_8";
    syntaxOperator = "neutral_8";
    syntaxPunctuation = "neutral_8";
  };
}
