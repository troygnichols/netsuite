module NetSuite
  module Records
    class CustomerCreditCard
      include Support::Fields
      #include Support::RecordRefs
      include Support::Records
      include Namespaces::ListRel

#      actions :get, :add, :delete

      fields :replace_all, :cc_number, :cc_expire_date, :cc_name, :payment_method, :debitcard_issue_no,
             :cc_memo, :validfrom, :cc_default

      #field :custom_field_list, CustomFieldList

      #record_refs :job, :item, :units, :price, :department, :class, :location, :rev_rec_schedule, :tax_code,
      #  :ship_address, :ship_method

      attr_reader :internal_id
      attr_accessor :external_id

      def initialize(attributes_or_record = {})
        case attributes_or_record
        when self.class
          initialize_from_record(attributes_or_record)
        when Hash
          attributes_or_record = attributes_or_record[:credit_card] if attributes_or_record[:credit_card]
          @internal_id = attributes_or_record.delete(:internal_id)
          initialize_from_attributes_hash(attributes_or_record)
        end
      end

      def initialize_from_record(obj)
	self.cc_number	      = obj.cc_number
        @internal_id          = obj.internal_id
      end

    end
  end
end
