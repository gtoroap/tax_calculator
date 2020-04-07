describe Order do
  let(:filename) { 'input1.txt' }

  subject { described_class.new(filename) }

  context 'when a Order is instantiated' do
    it "should return true" do
      expect(subject).to be_a(Order)
    end
  end

  describe '#output' do
    context 'when file does not exist' do
      let(:filename) { 'dummy.txt' }
      it "should return nil" do
        expect(subject.output).to be nil
      end
    end

    it "should return total lines of content" do
      expect(subject.output.count).to eq(5)
    end

    it "should return output messages when file is valid" do
      expect(subject.output.first).to eq('2 book: 24.98')
      expect(subject.output.last).to eq('Total: 42.32')
    end
  end
end