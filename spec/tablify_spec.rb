require 'spec_helper'

module TidyUp
  module Cucumber
    describe Cucumber do
      describe "#tablify" do

        it 'should tablify a simple table' do
          table = %{
            |this|is|a|really|messy|table|
            |and|it|needs|some|cleaning|up|
          }

          TidyUp::Cucumber.tablify(table).should == %{
            | this | is | a     | really | messy    | table |
            | and  | it | needs | some   | cleaning | up    |
          }
        end

      end
    end
  end
end
