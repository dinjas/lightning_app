# frozen_string_literal: true

RSpec.shared_examples 'real_model' do
  describe '.new' do
    it 'has a valid factory' do
      expect(factory).to be_valid
    end
  end

  describe '#destroy' do
    it 'can be destroyed' do
      x = factory_create

      expect(x).to be_valid
      expect(x).to be_persisted

      begin
        x.inactivate
      rescue StandardError
        true
      end

      expect(x.destroy).to be_an_instance_of(described_class)
    end
  end
end

RSpec.shared_examples 'abstract_model' do
  describe '.new' do
    it 'does not allow creation' do
      expect { described_class.new }.to raise_error(NotImplementedError)
    end
  end
end
