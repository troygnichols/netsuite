module NetSuite
  module Records
    class Opportunity
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::TranSales

      # https://system.netsuite.com/help/helpcenter/en_US/srbrowser/Browser2014_1/schema/record/opportunity.html

      actions :get, :add, :update, :upsert, :delete, :search

      fields :title, :tran_id, :source, :contrib_pct, :sync_sales_teams, :probability, :tran_date, :expected_close_date,
            :days_open, :currency_name, :exchange_rate, :projected_total, :range_low, :range_high, :proj_alt_sales_amt,
            :alt_sales_range_low, :alt_sales_range_high, :weighted_total, :action_item, :memo, :tax_total, :is_budged_approved,
            :tax_2_total, :total_cost_estimate, :est_gross_profit, :est_gross_profit_percent, :ship_is_residential, :close_date,
            :created_date, :last_modified_date, :status, :vat_reg_num, :sync_partner_teams

      record_refs :custom_form, :currency, :entity, :job, :sales_rep, :partner, :sales_group, :lead_source,
            :entity_status, :forecast_type, :win_loss_reason, :sales_readiness, :buying_time_frame,
            :buying_reason, :ship_address_list, :department, :location, :subsidiary

      field :item_list, OpportunityItemList

      #field :custom_field_list, CustomFieldList

      attr_reader   :internal_id
      attr_accessor :external_id

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end

    end
  end
end