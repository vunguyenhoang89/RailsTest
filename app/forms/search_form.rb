# frozen_string_literal: true

class SearchForm
  include Virtus.model
  include ActiveModel::Model
  include ActiveRecord::Sanitization::ClassMethods

  attribute :email, String
  attribute :prog_lang, String
  attribute :language_code, String

  # TODO: Full text search should be considered for keyword search.
  # rubocop:disable Metrics/AbcSize
  def search

    return Developer.none if email.nil? && language_code.nil? && prog_lang.nil?

    query = Developer.all
    query = query.where('email like :search_text', search_text: "%#{sanitize_sql_like(email)}%") if email.present?
    query = query.where('name like :search_text', search_text: "%#{sanitize_sql_like(prog_lang)}%") if prog_lang.present?
    query = query.where('code like :search_text', search_text: "%#{sanitize_sql_like(language_code)}%") if language_code.present?
    query = query.joins(:programming_languages) if prog_lang.present?
    query = query.joins(:languages) if language_code.present?
    query.order(created_at: :desc)
    
  end
  # rubocop:enable  Metrics/AbcSize
end
