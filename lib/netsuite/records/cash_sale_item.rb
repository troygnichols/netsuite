module NetSuite
  module Records
    class CashSaleItem
      include Support::Fields
      #include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::TranSales

      actions :get, :add, :delete

      fields :item, :amount, :line, :quantity_available, :quantity_on_hand, :quantity, :serial_numbers,
        :bin_numbers, :description, :inventory_detail, :rate, :amount, :order_line, :license_code,
        :is_taxable, :defer_rev_rec, :current_percent, :percent_complete, :rev_rec_start_date,
        :rev_rec_end_date, :gross_amt, :cost_estimate, :amount_ordered, :tax_1_amt, :quantity_ordered,
        :quantity_remaining, :tax_rate_1, :tax_rate_2, :gift_cert_from, :gift_cert_recipient_name,
        :gift_cert_message, :gift_cert_number, :ship_group, :item_is_fulfilled, :vsoe_sop_group,
        :vsoe_is_estimate, :vsoe_price, :vsoe_amount, :vsoe_allocation, :vsoe_delivered, :options

      field :custom_field_list, CustomFieldList

      #record_refs :job, :item, :units, :price, :department, :class, :location, :rev_rec_schedule, :tax_code,
      #  :ship_address, :ship_method

      attr_reader :internal_id
      attr_accessor :external_id

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end


      def initialize_from_record(record)
        self.attributes = record.send(:attributes)
      end

      def to_record
        rec = super
        if rec["#{record_namespace}:customFieldList"]
          rec["#{record_namespace}:customFieldList!"] = rec.delete("#{record_namespace}:customFieldList")
        end
        rec
      end

    end
  end
end
