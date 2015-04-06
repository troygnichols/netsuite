module NetSuite
  module Records
    class OpportunityItem
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::TranSales

      fields :line, :quantity_available, :quantity_on_hand, :quantity, :description, :rate, :amount, :alt_sales_alt,
      		:rev_rec_terms_in_months, :from_job, :is_estimate, :cost_estimate, :gross_amt, :tax_1_amt, :tax_rate_1, :tax_rate_2,
  			:expected_ship_date

      field :custom_field_list, CustomFieldList

      record_refs :job, :item, :units, :price, :department, :location, :tax_code

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end

      def initialize_from_record(record)
        self.attributes = record.send(:attributes)
      end

      # def to_record
      #   rec = super
      #   if rec["#{record_namespace}:customFieldList"]
      #     rec["#{record_namespace}:customFieldList!"] = rec.delete("#{record_namespace}:customFieldList")
      #   end
      #   rec
      # end
    end
  end
end
