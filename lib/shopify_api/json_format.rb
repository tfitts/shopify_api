module ActiveResource

  # ActiveResource 3.1 removes root on decoding, so this patch is only needed in 3.0
  if ActiveResource::VERSION::MAJOR == 3 && ActiveResource::VERSION::MINOR == 0
    module Formats
      module JsonFormat
        def decode(json)
          data = ActiveSupport::JSON.decode(json)
          if data.is_a?(Hash) && data.keys.size == 1
            data.values.first
          else
            data
          end
        end
      end
    end
  end
end
