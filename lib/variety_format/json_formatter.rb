module VarietyFormat
  class JSONFormatter < ::Logger::Formatter
    def call(severity, time, progname, msg)
      msg.to_json + "\n"
    end
  end # JSONFormatter
end # VarietyFormat
