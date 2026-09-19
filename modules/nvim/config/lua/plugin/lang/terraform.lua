return {
    treesitter = { "terraform" },
    servers = {
        terraformls = {},
    },
    formatters_by_ft = {
        terraform = { "tofu_fmt" },
        ["terraform-vars"] = { "tofu_fmt" },
    },
    linters_by_ft = {
        terraform = { "tofu" },
    },
}
