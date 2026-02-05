require "string-extensions"
require "util"

_G.fs = require "fs"

_G.cfg = require "cfg_default"
if fs.existsSync "cfg.lua" then
    if not pcall(function() require "cfg" end) then
        print "cfg.lua failed to load"
        os.exit(1)
    end
    cfg = table.patch(_G.cfg, require "cfg")
end

_G.l = require "logger" (cfg.log_level)

local ch = require "coro-http"
local json = require "json"
local querystring = require "querystring"

---@class querydata
local querydatasample = {
	hash = "9b491f134a1318802142d9af3f23a7d8",
	transactionId = "InsertTrIdHere",
	serial = "06546fb9f0de0486",
	action = "checkTransaction"
}

App = require "weblit-app"

	.bind({
		host = cfg.host,
		port = cfg.port
	})

	.use(require "weblit-logger")
	.use(require "weblit-auto-headers")

	.route({
		method = "POST",
		path = "/service.php" -- gravitybox.ceco.sk.eu.org/service.php
	}, function(req, res, go)
		---@class querydata
		local data = querystring.parse(req.body)
		-- Has to be caps for some reason.
		if data.transactionId == "YES" then
			res.code = 200
			res.headers["Content-Type"] = "application/json"
			res.body = json.encode({
				message = "henlo :3",
				status = "OK",
				-- TRANSACTION_VALID, TRANSACTION_INVALID, TRANSACTION_VIOLATION, TRANSACTION_BLOCKED
				trans_status = "TRANSACTION_VALID"
			})
		else
			res.code = 400
			res.headers["Content-Type"] = "application/json"
			res.body = json.encode({
				message = "henlo :3",
				status = "OK",
				-- TRANSACTION_VALID, TRANSACTION_INVALID, TRANSACTION_VIOLATION, TRANSACTION_BLOCKED
				trans_status = "TRANSACTION_INVALID"
			})
		end
	end)

	.route({
		method = "GET",
		path = "/hosts.txt"
	}, function(req, res, go)
		local _, body = ch.request("GET", "https://ipv4.myip.wtf/text", {})
		if body then
			local ip = body:match("%d+[.]%d+[.]%d+[.]%d+")
			if ip then
				res.code = 200
				res.body = ip.." gravitybox.ceco.sk.eu.org\n"
				return
			end
		end
		res.code = 503
		res.reason = "Internal Server Error"
		res.body = res.reason
	end)

	.start()
