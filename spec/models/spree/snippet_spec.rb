require 'spec_helper'

describe Spree::Snippet do

  describe "without a slug" do
    it "should not be valid" do
      @snippet = FactoryGirl.build :spree_snippet, slug: ''
      @snippet.should_not be_valid
    end
  end

  describe "with a non-unique slug" do
    it "should not be valid" do
      FactoryGirl.create :spree_snippet, slug: "harold"
      @snippet = FactoryGirl.build :spree_snippet, slug: "harold"
      @snippet.should_not be_valid
    end
  end

  describe "with a valid slug" do
    it "should be valid" do
      @snippet = FactoryGirl.build :spree_snippet, slug: "valid, unique slug"
      @snippet.should be_valid
    end
  end
end
