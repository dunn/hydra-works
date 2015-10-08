module Hydra::Works::Characterization
  module Image
    extend ActiveSupport::Concern

    autoload :ImageSchema, 'hydra/works/models/characterization/image_schema.rb'

    included do
      # Apply the image schema. This will add properties defined in the schema.
      apply_schema ImageSchema, AlreadyThereStrategy
    end
  end
end