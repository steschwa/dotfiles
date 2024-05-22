local utils_diagnostics = require("steschw.utils.diagnostics")
local utils_path = require("steschw.utils.path")
local utils_hl = require("steschw.utils.hl")

local s = vim.diagnostic.severity

--- @class StatuslineFactory
--- @field active boolean
local M = {}

--- @param active boolean
--- @return StatuslineFactory
function M:new(active)
    local this = {
        active = active,
    }
    setmetatable(this, self)
    self.__index = self

    return this
end

--- @return string
function M:get_bg()
    return self.active and utils_hl.get_bg("FelineActive") or utils_hl.get_bg("FelineInactive")
end

--- @class steschw.feline.SeparatorParams
--- @field inset? boolean
--- @field color string

--- @param params steschw.feline.SeparatorParams
function M:get_separator_left(params)
    return {
        str = "",
        hl = {
            bg = params.inset and params.color or self:get_bg(),
            fg = params.inset and self:get_bg() or params.color,
        },
    }
end

--- @param params steschw.feline.SeparatorParams
function M:get_separator_right(params)
    return {
        str = "",
        hl = {
            bg = params.inset and params.color or self:get_bg(),
            fg = params.inset and self:get_bg() or params.color,
        },
    }
end

--- @return string
local function filename_quickfix()
    local res = vim.fn.getqflist({
        title = true,
    })

    if res.title == "" or res.title == ":setqflist()" then
        return " Quickfix "
    end

    return string.format(" %s ", res.title)
end

local function filename_help()
    return " Help "
end

--- @return string
local function filename_oil()
    local dir = require("oil").get_current_dir()
    if dir == nil then
        return " Oil "
    end
    dir = vim.fn.fnamemodify(dir, ":.")

    if dir == "" then
        return " CWD-ROOT "
    end

    return string.format(" %s ", dir)
end

local function filename_buf()
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" then
        return " [No Name] "
    end

    return string.format(" %s ", utils_path.format_path_peak(path))
end

function M:component_filename()
    local bg = self.active and utils_hl.get_bg("FelineFilenameActive")
        or utils_hl.get_bg("FelineFilenameInactive")
    local fg = self.active and utils_hl.get_fg("FelineFilenameActive")
        or utils_hl.get_fg("FelineFilenameInactive")

    return {
        provider = function()
            local ft = vim.bo.filetype
            if ft == "qf" then
                return filename_quickfix()
            elseif ft == "help" then
                return filename_help()
            elseif ft == "oil" then
                return filename_oil()
            end

            return filename_buf()
        end,
        hl = {
            bg = bg,
            fg = fg,
        },
        right_sep = self:get_separator_right({ color = bg }),
    }
end

function M:component_lazy_updates()
    local bg = self.active and utils_hl.get_bg("FelineLazyUpdatesActive")
        or utils_hl.get_bg("FelineLazyUpdatesInactive")
    local fg = self.active and utils_hl.get_fg("FelineLazyUpdatesActive")
        or utils_hl.get_fg("FelineLazyUpdatesInactive")

    --- @return string
    local function provider()
        local ls = require("lazy.status")

        if not ls.has_updates() then
            return ""
        end

        return string.format(" %s ", ls.updates())
    end

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = {
            bg = bg,
            fg = fg,
        },
        left_sep = self:get_separator_left({ color = bg }),
    }
end

function M:component_search_count()
    local bg = self.active and utils_hl.get_bg("FelineSearchCountActive")
        or utils_hl.get_bg("FelineSearchCountInactive")
    local fg = self.active and utils_hl.get_fg("FelineSearchCountActive")
        or utils_hl.get_fg("FelineSearchCountInactive")

    --- @return string
    local function provider()
        if vim.v.hlsearch == 0 then
            return ""
        end

        local ok, result = pcall(vim.fn.searchcount)
        if not ok then
            return ""
        end
        if result.incomplete == 1 then
            return ""
        elseif result.incomplete == 2 then
            return string.format(" %d/%d+ ", result.current, result.total)
        end

        if result.total == 0 then
            return ""
        end

        return string.format(" %d/%d ", result.current, result.total)
    end

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = {
            bg = bg,
            fg = fg,
        },
        left_sep = self:get_separator_right({ inset = true, color = bg }),
        right_sep = self:get_separator_right({ color = bg }),
    }
end

function M:component_file_changes()
    local bg = self.active and utils_hl.get_bg("FelineFileChangesActive")
        or utils_hl.get_bg("FelineFileChangesInactive")
    local fg = self.active and utils_hl.get_fg("FelineFileChangesActive")
        or utils_hl.get_fg("FelineFileChangesInactive")

    --- @return string
    local function provider()
        ---@diagnostic disable-next-line: param-type-mismatch
        local buf_info = vim.fn.getbufinfo("%")
        if #buf_info ~= 1 then
            return ""
        end

        if buf_info[1].changed == 1 then
            return " ● "
        end

        return ""
    end

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = {
            bg = bg,
            fg = fg,
        },
    }
end

--- @param severity number
function M:component_diagnostics(severity)
    local function provider()
        local sign = utils_diagnostics.get_sign_by_severity(severity)
        local sign_prefix = vim.trim(sign and sign.text or "")

        local diagnostics = vim.diagnostic.get(0, { severity = severity })
        if #diagnostics == 0 then
            return ""
        end

        return string.format(" %s:%d ", sign_prefix, #diagnostics)
    end

    local fg = ({
        [vim.diagnostic.severity.ERROR] = utils_hl.get_fg("DiagnosticError"),
        [vim.diagnostic.severity.WARN] = utils_hl.get_fg("DiagnosticWarn"),
        [vim.diagnostic.severity.INFO] = utils_hl.get_fg("DiagnosticInfo"),
        [vim.diagnostic.severity.HINT] = utils_hl.get_fg("DiagnosticHint"),
    })[severity]

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = function()
            return {
                bg = self:get_bg(),
                fg = fg,
            }
        end,
    }
end

function M:component_grapple()
    local bg = self.active and utils_hl.get_bg("FelineGrappleActive")
        or utils_hl.get_bg("FelineGrappleInactive")
    local fg = self.active and utils_hl.get_fg("FelineGrappleActive")
        or utils_hl.get_fg("FelineGrappleInactive")

    local function provider()
        local g = require("grapple")

        if not g.exists() then
            return ""
        end

        return string.format("  %s ", g.name_or_index())
    end

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = {
            bg = bg,
            fg = fg,
        },
        left_sep = self:get_separator_right({ inset = true, color = bg }),
        right_sep = self:get_separator_right({ color = bg }),
    }
end

function M:component_qf()
    local bg = self.active and utils_hl.get_bg("FelineQfActive")
        or utils_hl.get_bg("FelineQfInactive")
    local fg = self.active and utils_hl.get_fg("FelineQfActive")
        or utils_hl.get_fg("FelineQfInactive")

    --- @return string
    local function provider()
        local ft = vim.bo.filetype
        if ft ~= "qf" then
            return ""
        end

        local res = vim.fn.getqflist({
            idx = 0,
            size = true,
        })

        return string.format(" %d of %d ", res.idx, res.size)
    end

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = {
            bg = bg,
            fg = fg,
        },
        left_sep = self:get_separator_right({ inset = true, color = bg }),
        right_sep = self:get_separator_right({ color = bg }),
    }
end

function M:component_gap()
    return {
        hl = {
            bg = self:get_bg(),
        },
    }
end

return {
    "freddiehaddad/feline.nvim",
    deps = { "cbochs/grapple.nvim" },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyCheck",
            callback = function()
                vim.cmd("redrawstatus!")
            end,
        })

        vim.api.nvim_create_autocmd("DiagnosticChanged", {
            callback = function()
                vim.cmd("redrawstatus!")
            end,
        })
    end,
    config = function()
        local f = require("feline")

        local active_factory = M:new(true)
        local inactive_factory = M:new(false)

        -- TODO: git hunks component
        -- TODO: maybe git changes component

        local components = {
            active = {
                {
                    active_factory:component_file_changes(),
                    active_factory:component_filename(),
                    active_factory:component_qf(),
                    active_factory:component_grapple(),
                    active_factory:component_search_count(),
                    active_factory:component_diagnostics(s.ERROR),
                    active_factory:component_diagnostics(s.WARN),
                    active_factory:component_diagnostics(s.INFO),
                    active_factory:component_diagnostics(s.HINT),
                    active_factory:component_gap(),
                },
                {
                    active_factory:component_lazy_updates(),
                },
            },
            inactive = {
                {
                    inactive_factory:component_file_changes(),
                    inactive_factory:component_filename(),
                    inactive_factory:component_qf(),
                    inactive_factory:component_grapple(),
                    inactive_factory:component_gap(),
                },
            },
        }

        f.setup({
            components = components,
            disable = {
                filetypes = {
                    "^NvimTree$",
                },
            },
            force_inactive = {},
        })
    end,
}
