require 'spec_helper'
require 'hydra/works/pcdm_use_validator'
require 'hydra/works/models/file_set'

describe Hydra::Works::PcdmUseValidator do
  subject(:pcdm_use_validator) { described_class.new(file_set) }
  let(:file_set) { instance_double(Hydra::Works::FileSet.new) }

  before do
    # Stub the allowed PCDM uses to known test values.
    allow(pcdm_use_validator).to receive(:allowed_pcdm_uses).and_return(["valid use", "another valid use"])
  end

  describe '#validate!' do
    context "with an invalid pcdm use" do
      before do
        allow(pcdm_use_validator).to receive(:pcdm_uses).and_return(["invalid use"])
      end

      it 'raises an error' do
        expect { pcdm_use_validator.validate! }.to raise_error Hydra::Works::PcdmUseValidator::InvalidPcdmUse
      end
    end
  end

  describe '.validate!' do
    xit 'instantiates the class with the FileSet instance and calls #validate!'
  end
end
