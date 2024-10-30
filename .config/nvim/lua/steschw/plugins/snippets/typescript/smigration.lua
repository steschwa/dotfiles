local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local Fs = require("steschw.plugins.snippets.fs")

local snip = fmt(
    [[
import { AppCompany } from "@farmact/model/src/model/AppCompany";
import { getFirestore } from "firebase-admin/firestore";
import { onRequest } from "firebase-functions/v2/https";
import { MigrationManager } from "../../utils/migrations";

export const ^MigrationName$ = onRequest(
    {
        invoker: "private",
        timeoutSeconds: 1800,
        memory: "8GiB",
        cpu: 2,
    },
    async (req, res) => {
        const manager = MigrationManager.fromRequest(req);

        const companies = await manager.resume(
            getFirestore().collection("companies") as FirebaseFirestore.CollectionReference<AppCompany>
        );

        for (const companyDoc of companies.docs) {
            const context = manager.getContext(companyDoc.id);
            const contextData = {
                skipped: 0,
                updated: 0,
            };

            ^$

            context.setData(contextData);
            await context.flush();
        }

        await manager.run(res);
    }
);
]],
    {
        MigrationName = f(function()
            -- e.g. 20241030_migrateFoobar.ts -> migrateFoobar
            local matches = Fs.filename():match("^%d+_(%w+)%.ts$")
            if not matches then
                return "INVALID_FILENAME"
            end

            return matches
        end),
        i(0),
    },
    {
        delimiters = "^$",
    }
)

return s("smigration", snip)
