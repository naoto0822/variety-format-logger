require "spec_helper"
require "json"

RSpec.describe VarietyFormat::Logger do
  it "has a version number" do
    expect(VarietyFormat::VERSION).not_to be nil
  end

  it "init logger" do
    path = "./spec/sample.log"
    File.delete(path) if File.file?(path)
    logger = VarietyFormat::Logger.new(path)
    expect(logger).not_to be nil
    File.delete(path)
  end

  it "default log" do
    path = "./spec/default.log"
    File.delete(path) if File.file?(path)
    logger = VarietyFormat::Logger.new(path)
    logger.debug("specspec")
    msg = ""
    File.open(path, "r:UTF-8") { |file|
      file.each { |line|
        msg = line.split(" ")[6] if line.include?("specspec")
      }
    }
    expect(msg).to eq "specspec"
    File.delete(path)
  end

  it "json log" do
    path = "./spec/json.log"
    File.delete(path) if File.file?(path)
    logger = VarietyFormat::Logger.new(path)
    logger.format_type = VarietyFormat::Logger::JSON_FORMAT
    j = {}
    j["k1"] = "v1"
    j["k2"] = "v2"
    logger.debug(j)
    out = {}
    File.open(path, "r:UTF-8") { |file|
      file.each_with_index { |line, i|
        next if i == 0
        out = JSON.parse(line)
      }
    }
    expect(out["k1"]).to eq "v1"
    expect(out["k2"]).to eq "v2"
    File.delete(path)
  end

  it "ltsv log" do
    path = "./spec/ltsv.log"
    File.delete(path) if File.file?(path)
    logger = VarietyFormat::Logger.new(path)
    logger.format_type = VarietyFormat::Logger::LTSV_FORMAT
    params = {}
    params["gender"] = "female"
    params["age"] = 20
    params["name"] = "humi"
    logger.debug(params)
    out = {}
    File.open(path, "r:UTF-8") { |file|
      file.each_with_index { |line, i|
        next if i == 0
        arr = line.gsub("\n", "").split("\t").map{|pair| pair.split(":") }
        out = Hash[arr]
      }
    }
    expect(out["gender"]).to eq "female"
    expect(out["age"]).to eq "20"
    expect(out["name"]).to eq "humi"
    File.delete(path)
  end
end
