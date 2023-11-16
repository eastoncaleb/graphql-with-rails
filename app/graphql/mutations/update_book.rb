# frozen_string_literal: true

module Mutations
  class UpdateBook < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :pages, Integer, required: false
    argument :year_published, Integer, required: false

    type Types::BookType

    def resolve(id:, **attributes)
      book = Book.find(id)

      if book.update(attributes)
        book
      else
        raise GraphQL::ExecutionError.new("Update failed: #{book.errors.full_messages.join(', ')}")
      end
    rescue ActiveRecord::RecordNotFound
      raise GraphQL::ExecutionError.new("No book found with ID #{id}")
    end
  end
end
