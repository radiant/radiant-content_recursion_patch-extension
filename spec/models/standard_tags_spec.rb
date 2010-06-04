require File.dirname(__FILE__) + '/../spec_helper'

describe "Standard Tags" do
  dataset :users_and_pages, :file_not_found, :snippets
  describe "<r:content>" do
    it "should allow repetition" do
      page(:recursive_parts).should render('<r:content part="repeat"/>').as('xx')
    end
  end
end
