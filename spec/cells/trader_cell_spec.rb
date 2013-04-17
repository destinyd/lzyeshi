require 'spec_helper'

describe TraderCell do

  context "cell instance" do
    subject { cell(:trader) }

    it { should respond_to(:nav) }
  end

  context "cell rendering" do
    context "rendering nav" do
      subject { render_cell(:trader, :nav) }

      it { should have_selector("h1", :content => "Trader#nav") }
      it { should have_selector("p", :content => "Find me in app/cells/trader/nav.html") }
    end
  end

end
