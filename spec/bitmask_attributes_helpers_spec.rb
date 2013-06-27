require 'spec_helper'

# Shared examples

##
# Shared examples for checker methods
# @arg [Model] model_class the model class to run the presence methods on
# @arg [String] bitmask the name of the bitmask
# @arg [String] true_value the name of the value which should be true
# @arg [String] false_value the name of the value which should be false
shared_examples_for "a bitmask with presence methods" do
  describe '#value?' do
    let(:model) { model_class.new({ "#{bitmask}" => [true_value.to_sym] }) }
    context 'if the model has the bitmask attribute set' do
      it 'returns true' do
        model.send("#{true_value}?").should be
      end
    end

    context 'if the model does not have the bitmask attribute set' do
      it 'returns false' do
        model.send("#{false_value}?").should_not be
      end
    end
  end
end

##
# Shared examples for scope methods
# @arg [Model] model_class the model class to run the checkers on
# @arg [String] true_value the name of the value which should be true
# @arg [String] false_value the name of the value which should be false
shared_examples_for "a bitmask with scopes" do
  describe '.value' do
    context 'when there are models with the value set' do
      before(:each) { model_class.create({ "#{bitmask}" => [true_value.to_sym] }) }
      it 'returns those models' do
        model_class.send(true_value).should have_at_least(1).result
      end
    end

    context 'when there are no models with the value set' do
      before(:each) { model_class.create({ "#{bitmask}" => [true_value.to_sym] }) }
      it 'returns an empty array' do
        model_class.send(false_value).should have(0).results
      end
    end
  end
end

##
# Shared examples for virtual attributes
# @arg [Model] model_class the model class to run the checkers on
# @arg [String] true_value the name of the value which should be true
# @arg [String] false_value the name of the value which should be false
shared_examples_for "a bitmask with virtual attributes" do
  describe '#value' do
    let(:model) { model_class.new({ "#{bitmask}" => [true_value.to_sym] }) }
    context 'if the model has the bitmask attribute set' do
      it 'returns true' do
        model.send("#{true_value}").should be
      end
    end

    context 'if the model does not have the bitmask attribute set' do
      it 'returns false' do
        model.send("#{false_value}").should_not be
      end
    end
  end

  describe '#value=' do
    let(:model) { model_class.new }
    it 'can set the bitmask attribute to true' do
      model.send("#{false_value}=", true)
      model.send("#{false_value}").should be
    end

    it 'can set the bitmask attribute to false' do
      model.send("#{true_value}=", false)
      model.send("#{true_value}").should_not be
    end
  end
end

# Running tests

describe BitmaskAttributesHelpers do
  let(:bitmask) { :colors }
  let(:true_value) { :raw_umber }
  let(:false_value) { :pet_shop }

  context 'with a bitmask with presence methods' do
    let(:model_class) { CrayonWithPresenceMethods }
    it_behaves_like 'a bitmask with presence methods'
  end

  context 'with a bitmask with scopes' do
    let(:model_class) { CrayonWithScopes }
    it_behaves_like 'a bitmask with scopes'
  end

  context 'with a bitmask with virtual attributes' do
    let(:model_class) { CrayonWithVirtualAttributes }
    it_behaves_like 'a bitmask with virtual attributes'
  end

  context 'with a bitmask with helpers' do
    let(:model_class) { CrayonWithHelpers }
    it_behaves_like 'a bitmask with presence methods'
    it_behaves_like 'a bitmask with scopes'
    it_behaves_like 'a bitmask with virtual attributes'
  end
end
