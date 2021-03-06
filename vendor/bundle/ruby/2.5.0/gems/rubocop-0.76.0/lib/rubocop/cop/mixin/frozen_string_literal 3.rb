# frozen_string_literal: true

module RuboCop
  module Cop
    # Common functionality for dealing with frozen string literals.
    module FrozenStringLiteral
      module_function

      FROZEN_STRING_LITERAL = '# frozen_string_literal:'
      FROZEN_STRING_LITERAL_ENABLED = '# frozen_string_literal: true'
      FROZEN_STRING_LITERAL_TYPES = %i[str dstr].freeze

      def frozen_string_literal_comment_exists?
        leading_comment_lines.any? do |line|
          MagicComment.parse(line).valid_literal_value?
        end
      end

      private

      def frozen_string_literals_enabled?
        ruby_version = processed_source.ruby_version
        return false unless ruby_version

        # TODO: Ruby officially abandon making frozen string literals default
        # for Ruby 3.0.
        # https://bugs.ruby-lang.org/issues/11473#note-53
        # Whether frozen string literals will be the default after Ruby 3.0
        # or not is still unclear as of January 2019.
        # It may be necessary to add this code in the future.
        #
        #   return true if ruby_version >= 3.1
        #
        # And the above `ruby_version >= 3.1` is undecided whether it will be
        # Ruby 3.1, 3.2, 4.0 or others.
        # See https://bugs.ruby-lang.org/issues/8976#note-41 for details.
        leading_comment_lines.any? do |line|
          MagicComment.parse(line).frozen_string_literal?
        end
      end

      def leading_comment_lines
        comments = processed_source.comments

        comments.each_with_object([]) do |comment, leading_comments|
          next if comment.loc.line > 3

          leading_comments << comment.text
        end
      end
    end
  end
end
