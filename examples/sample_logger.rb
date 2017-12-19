#!/usr/bin/ruby
require "json"
require "variety-format-logger"

File.delete("./default.log") if File.file?("./default.log")
File.delete("./json.log") if File.file?("./json.log")
File.delete("./ltsv.log") if File.file?("./ltsv.log")

path = "./default.log"
logger = VarietyFormat::Logger.new(path)
logger.debug("sample logger")

path = "./json.log"
logger = VarietyFormat::Logger.new(path)
logger.format_type = VarietyFormat::Logger::JSON_FORMAT
msg = {}
msg["k1"] = "v1"
msg["k2"] = "v2"
msg["k3"] = "v3"
logger.debug(msg)

path = "./ltsv.log"
logger = VarietyFormat::Logger.new(path)
logger.format_type = VarietyFormat::Logger::LTSV_FORMAT
msg = {}
msg["gender"] = "male"
msg["age"] = 20
msg["birth"] = "1990/08/22"
msg["json"] = {"k1": "v1"}.to_json
logger.debug(msg)
