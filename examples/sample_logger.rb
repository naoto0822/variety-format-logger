#!/usr/bin/ruby
require "variety-format-logger"

path = "./default.log"
logger = VarietyFormat::Logger.new(path)
logger.debug("sample logger")

path = "./json.log"
logger = VarietyFormat::Logger.new(path)
logger.format_type = VarietyFormat::Logger::JSON_FORMAT
msg = {}
msg["k1"] = "v1"
msg["k2"] = "v2"
logger.debug(msg)

path = "./ltsv.log"
logger = VarietyFormat::Logger.new(path)
logger.format_type = VarietyFormat::Logger::LTSV_FORMAT
msg = {}
msg["hoge"] = "foo"
msg["hogehoge"] ="foofoo"
logger.debug(msg)
