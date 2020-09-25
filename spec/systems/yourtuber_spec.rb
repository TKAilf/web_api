require 'rails_helper'

RSpec.describe "Yourtubers", type: :system do
  discribe "yourtuber#index" do
    before do
      visit yourtuber_index_path
    end

    

    context "必要をクリック" do
      expect(page).to have_field 
      
    end

    context "不必要をクリック" do

    end
  end
end