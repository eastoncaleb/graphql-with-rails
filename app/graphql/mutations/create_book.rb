# frozen_string_literal: true

module Mutations
  class CreateBook < BaseMutation
    argument :title, String, required: true
    argument :pages, Integer, required: true
    argument :year_published, Integer, required: false
    argument :author_id, ID, required: true

    type Types::BookType

    def resolve(title:, pages:, year_published:, author_id:)
      author = Author.find(author_id)
      # Check if the author exists
      unless author
        raise GraphQL::ExecutionError.new("Author not found with id: #{author_id}")
      end
      
      book = author.books.build(
        title: title,
        pages: pages,
        year_published: year_published)

      if book.save
        # If the book is saved successfully
        book
      else
        # If the book is not saved due to validation errors
        raise GraphQL::ExecutionError.new("Invalid input: #{book.errors.full_messages.join(', ')}")
      end
    end
  end
end
