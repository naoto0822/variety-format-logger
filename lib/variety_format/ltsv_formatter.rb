module VarietyFormat
  class LTSVFormatter
    def call(severity, time, progname, msg)
      to_ltsv(msg) + "\n"
    end

    private

    def to_ltsv(msg)
      return to_ltsv_from_hash(msg) if msg.kind_of?(Hash)
      return to_ltsv_from_array(msg) if msg.kind_of?(Array)
      msg
    end

    def to_ltsv_from_hash(hash)
      pairs = []
      hash.each { |k, v|
        pair = "#{k}:#{v}"
        pairs.push(pair)
      }
      pairs.join("\t")
    end

    def to_ltsv_from_array(array)
      array.join("\t")
    end

  end # LTSVFormatter
end # VarietyFormat
