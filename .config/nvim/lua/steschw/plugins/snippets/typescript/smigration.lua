local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local Fs = require("steschw.plugins.snippets.fs")

local snip = fmt(
    [[
import { AppCompany } from "@farmact/model/src/model/AppCompany";
import { CollectionReference, getFirestore } from "firebase-admin/firestore";
import { log } from "firebase-functions/logger";
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
                orderNotFound: 0,
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
            local migration_name = Fs.filename():sub(#"20240101_" + 1)
            return migration_name
        end),
        i(0),
    },
    {
        delimiters = "^$",
    }
)

return s("smigration", snip)
