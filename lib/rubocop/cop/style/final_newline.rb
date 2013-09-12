# encoding: utf-8

module Rubocop
  module Cop
    module Style
      # This cop enforces the presence of a final newline in each source file.
      class FinalNewline < Cop
        MSG = 'Source files should end with a newline(\n).'

        def investigate(processed_source)
          final_line = processed_source.raw_lines.to_a.last

          unless final_line.end_with?("\n")
            convention(nil,
                       source_range(processed_source.buffer,
                                    processed_source[0...-1],
                                    final_line.length - 1, 1))
          end
        end
      end
    end
  end
end
