require 'benchmark'

module Scube
  module CLI
    module Commands
      class Ping
        REPORT_FORMAT = "`%d' response received after %d ms".freeze

        def initialize args
          fail ArgumentError if args.any?
          @client = Client.new
        end

        def run
          response = nil
          time = Benchmark.realtime { response = @client.send ping_method }
          puts REPORT_FORMAT % [response.status, time * 1000]
          puts response.body if response.body.size > 0
        end

      private

        def ping_method
          :ping
        end
      end
    end
  end
end
