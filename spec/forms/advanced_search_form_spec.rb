require 'rails_helper'
RSpec.describe DeveloperSearchForm do
  describe '#search' do
    before do
      @developer_1 = create(:developer, email: 'demo1@gmail.com')
      @programming_language_1 = create(:programming_language, name: 'PHP')
      @language = create(:language, code: 'en')
      @developer_2 = create(:developer, email: 'test1@gmail.com')
      @programming_language_2 = create(:programming_language, name: 'Ruby')
      create(:developer_programming_language, developer_id: @developer_1.id, programming_language_id: @programming_language_1.id)
      create(:developer_programming_language, developer_id: @developer_2.id, programming_language_id: @programming_language_2.id)
      create(:developer_language,developer_id: @developer_1.id, language_id: @language.id)
      create(:developer_language,developer_id: @developer_2.id, language_id: @language.id)
    end

    context 'search with empty params' do
      it 'returns empty list' do
        form = DeveloperSearchForm.new
        expect(form.search.size).to eq(0)
      end
    end

    context 'Test for programming_language' do
      it 'Language programming that exists in database' do
        form = DeveloperSearchForm.new(prog_lang: 'php')
        expect(form.search.size).to eq(1)
      end

      it 'Language programming that does not exist in database' do
        form = DeveloperSearchForm.new(prog_lang: 'ruby')
        expect(form.search.size).to eq(0)
      end
    end

    context 'Test search for developer' do
      it 'Email exists in database' do
        form = DeveloperSearchForm.new(email: 'demo1@gmail.com')
        expect(form.search.size).to eq(1)
      end

      it 'Email does not exists in DB' do
        form = DeveloperSearchForm.new(email: 'abc123@gmail.com')
        expect(form.search.size).to eq(0)
      end
    end

    context 'Test for searching developer with programming language and language' do

      it 'Search for en' do
        form = DeveloperSearchForm.new(language_code: 'en')
        expect(form.search.size).to eq(2)
      end

      it 'Search for Ruby - en' do
        form = DeveloperSearchForm.new(prog_lang: 'Ruby', language_code: 'en')
        expect(form.search.size).to eq(1)
      end

      it 'Search for PHP - en' do
        form = DeveloperSearchForm.new(prog_lang: 'PHP', language_code: 'en')
        expect(form.search.size).to eq(1)
      end
    end

  end
end