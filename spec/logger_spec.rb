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

end
