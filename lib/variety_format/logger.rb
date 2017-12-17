module VarietyFormat
  class Logger < ::Logger
    # for gemspec
    VERSION = "0.1.0".freeze

    # format type
    DEFAULT_FORMAT = "VarietyFormat_Logger_Default".freeze
    JSON_FORMAT = "VarietyFormat_Logger_JSON".freeze
    LTSV_FORMAT = "VarietyFormat_Logger_LTSV".freeze
    
    FORMAT_LIST = [DEFAULT_FORMAT, JSON_FORMAT, LTSV_FORMAT].freeze

    def initialize(*args)
      @type = DEFAULT_FORMAT
      pass_args = Marshal.load(Marshal.dump(args))
      args.each{ |arg|
        pass_args.delete(arg) if FORMAT_LIST.include?(arg)
        @type = JSON_FORMAT if arg == JSON_FORMAT
        @type = LTSV_FORMAT if arg == LTSV_FORMAT
      }
      super(pass_args)

      @formatter = pick_formatter(@type)
    end
    
    def pick_formatter(type)
      # TODO
    end

    private

    def select_formatter_class
      # TODO:
    end

  end
end
