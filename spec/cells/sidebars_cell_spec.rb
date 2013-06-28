require 'spec_helper'

describe SidebarsCell do

  context "cell instance" do
    subject { cell(:sidebars) }

    it { should respond_to(:recent_commodities) }
    it { should respond_to(:recent_comments) }
  end

  context "cell rendering" do
    context "rendering recent_commodities" do
      subject { render_cell(:sidebars, :recent_commodities) }

      it { should have_selector("h1", :content => "Sidebars#recent_commodities") }
      it { should have_selector("p", :content => "Find me in app/cells/sidebars/recent_commodities.html") }
    end

    context "rendering recent_comments" do
      subject { render_cell(:sidebars, :recent_comments) }

      it { should have_selector("h1", :content => "Sidebars#recent_comments") }
      it { should have_selector("p", :content => "Find me in app/cells/sidebars/recent_comments.html") }
    end
  end

end
