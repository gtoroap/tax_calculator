describe ParseItems do
  describe '#from_file' do
    let(:filename) { 'input1.txt' }

    subject { described_class }

    it "should return total parsed lines" do
      expect(subject.from_file(filename).count).to eq(3)
    end

    it "should return an array of Items" do
      items = subject.from_file(filename)
      expect(items.first).to have_attributes(quantity: 2, imported: nil, description: 'book', price: 12.49)
    end

    context 'when file does not exist' do
      let(:filename) { 'dummy.txt' }
      it "should return nil" do
        expect(subject.from_file(filename)).to be nil
      end
    end
  end
end