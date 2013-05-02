require 'spec_helper'

describe LayoutsCell do

  context "cell instance" do
    subject { cell(:layouts) }

    it { should respond_to(:footer) }
  end

  context "cell rendering" do
    context "rendering footer" do
      subject { render_cell(:layouts, :footer) }

      it { should have_selector("h1", :content => "Layouts#footer") }
      it { should have_selector("p", :content => "Find me in app/cells/layouts/footer.html") }
    end
  end

end
