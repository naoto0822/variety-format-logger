module VarietyFormat
  class Logger < ::Logger
    # for gemspec
    VERSION = "0.1.0".freeze

    # format type
    DEFAULT_FORMAT = "VarietyFormat_Logger_Default".freeze
    JSON_FORMAT = "VarietyFormat_Logger_JSON".freeze
    LTSV_FORMAT = "VarietyFormat_Logger_LTSV".freeze

    def initialize(*)
      super
      self.format_type = DEFAULT_FORMAT
    end

    def format_type=(value)
      @format_type = value
      @formatter = pick_formatter(@format_type)
    end

    private

    def pick_formatter(type)
      formatter = select_formatter_class(type)
      formatter.new
    end

    def select_formatter_class(type)
      case type
      when JSON_FORMAT
        VarietyFormat::JSONFormatter
      when LTSV_FORMAT
        VarietyFormat::LTSVFormatter
      else
        ::Logger::Formatter
      end
    end
  end # Logger
end # VarietyFormat
