# frozen_string_literal: true

module ActiveRecordExtras
  module Relation
    extend ActiveSupport::Concern

    module ClassMethods
      def create_or_update(attributes)
        assign_or_new(attributes).save
      end

      def create_or_update!(attributes)
        assign_or_new(attributes).save!
      end

      def assign_or_new(attributes)
        obj = first || new
        obj.assign_attributes(attributes)
        obj
      end
    end
  end
end

ActiveRecord::Base.include ActiveRecordExtras::Relation
