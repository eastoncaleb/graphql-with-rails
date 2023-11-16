# frozen_string_literal: true

module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :pages, Integer
    field :rating, Float
    field :year_published, Integer
    field :description, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :author_id, Integer, null: false
    field :published_this_year, Boolean, "Has the book been published this year", null: false

    def published_this_year
      object.year_published == Date.current.year
    end
  end
end
