return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
-- ys - surround text with something
-- ds" - remove double quote from quote text
-- cs"' - replace double quote with single quote
-- cst - replace and specify what to replace with
