describe Item do
  let(:args) do
    {
      quantity: 2,
      imported: 'imported',
      description: 'book',
      price: 14.25
    }
  end

  subject { described_class.new(args[:quantity], args[:imported], args[:description], args[:price]) }

  context 'when a Item is instantiated' do
    it "should return true" do
      expect(subject).to be_a(Item)
    end

    it "should initialize additional variables" do
      expect(subject.tax).to eq(0)
      expect(subject.taxes).to eq(0)
      expect(subject.price_plus_taxes).to eq(0)
    end
  end
end