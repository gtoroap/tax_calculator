describe TaxHandler do

  let(:items) do
    [
      Item.new(2, nil, 'book', 11.55),
      Item.new(3, nil, 'Nintendo Switch', 299.99),
      Item.new(4, 'imported', 'apple', 3.55),
      Item.new(5, 'imported', 'MacBook Pro', 1799.55),
    ]
  end

  subject { described_class.new(items) }

  describe '#classify' do
    context 'when item is tax exempt' do
      it "should return tax 0" do
        item = subject.classify.first
        expect(item.tax).to eq(0)
      end

      it "should return price_plus_taxes same as price" do
        item = subject.classify.first
        expect(item.price_plus_taxes).to eq(item.price)
      end
    end

    context 'when item is taxed' do
      it "should return tax 0.1" do
        item = subject.classify[1]
        expect(item.tax).to eq(0.1)
      end

      it "should return price_plus_taxes as expected" do
        item = subject.classify[1]
        expect(item.price_plus_taxes).to eq(329.99)
      end
    end

    context 'when item is tax exempt also is imported' do
      it "should return tax 0.05" do
        item = subject.classify[2]
        expect(item.tax).to eq(0.05)
      end

      it "should return price_plus_taxes as expected" do
        item = subject.classify[2]
        expect(item.price_plus_taxes).to eq(3.73)
      end
    end

    context 'when item is taxed and also is imported' do
      it "should return tax 0.05" do
        item = subject.classify[3]
        expect(item.tax).to eq(0.15)
      end

      it "should return price_plus_taxes as expected" do
        item = subject.classify[3]
        expect(item.price_plus_taxes).to eq(2069.49)
      end
    end
  end

  describe '#calculate' do
    it "should return sum of all taxes after classify" do
      subject.classify
      expect(subject.calculate).to eq(300.13)
    end
  end

  describe '#totalize' do
    it "should return sum of all prices_plus_taxes" do
      subject.classify
      expect(subject.totalize).to eq(11375.44)
    end
  end

  describe '#ceil_to' do
    it "should return a number rounded" do
      expect(subject.ceil_to(7.125, 1/0.05)).to eq(7.15)
    end
  end
end