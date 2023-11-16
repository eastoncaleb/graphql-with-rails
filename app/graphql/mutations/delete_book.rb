# frozen_string_literal: true

module Mutations
  class DeleteBook < BaseMutation
    argument :id, ID, required: true

    type Types::BookType

    def resolve(id:)
      book = Book.find(id)
      book.destroy

      { id: id }
    rescue ActiveRecord::RecordNotFound
      raise GraphQL::ExecutionError.new("No book found with ID #{id}")
    end
  end
end
