module Services
  module Listing
    class CreateOrUpdateTags
      def initialize(hashArray)
        @tags_hash = hashArray
      end

      def call
        existing_tags = Tag.where(name: @tags_hash)

        tags_to_create = (@tags_hash - existing_tags.map(&:name)).map { |name| { name: name }}

        created_tags = Tag.create!(tags_to_create)

        # return all the tags
        existing_tags + created_tags
      end
    end
  end
end
