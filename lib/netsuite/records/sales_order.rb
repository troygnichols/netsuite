module NetSuite
  module Records
    class SalesOrder
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::ListAcct

      # https://system.netsuite.com/help/helpcenter/en_US/SchemaBrowser/indexv2012_2_0.html
      # https://webservices.netsuite.com/xsd/transactions/v2012_2_0/sales.xsd

      actions :get, :add, :delete

      fields :created_date, :tran_date, :tran_id, :source, :order_status, :contrib_pct, :sync_sales_teams, :start_date,
        :end_date, :other_ref_num, :memo, :sales_effective_date, :exclude_commission, :total_cost_estimate, :est_gross_profit,
        :est_gross_profit_percent, :exchange_rate, :currency_name, :discount_rate, :is_taxable, :tax_rate, :to_be_printed,
        :to_be_emailed, :email, :to_be_faxed, :fax, :message, :transaction_bill_address, :bill_address_list, :bill_address, :ship_address, :fob, :ship_date, :actual_ship_date,
        :shipping_cost, :shipping_tax_1_rate, :is_multi_ship_to, :shipping_tax_2_rate, :handling_tax_1_rate, :handling_tax_2_rate,
        :handling_cost, :tracking_numbers, :linked_tracking_numbers, :ship_complete, :shopper_ip_address, :save_on_auth_decline,
        :recognized_revenue, :deferred_revenue, :rev_rec_on_rev_commitment, :cc_number, :cc_expire_date, :cc_name, :cc_street,
        :cc_zip_code, :pay_pal_status, :pay_pal_tran_id, :cc_approved, :get_auth, :auth_code, :alt_sales_total, :ignore_avs,
        :payment_event_date, :payment_event_updated_by, :sub_total, :discount_total, :tax_total, :alt_shipping_cost, :alt_handling_cost,
        :total, :rev_rec_start_date, :rev_rec_end_date, :paypal_auth_id, :balance, :paypal_process, :cc_security_code, :three_d_status_code,
        :debit_card_issue_no, :last_modified_date, :pn_ref_num, :status, :tax_2_total, :valid_from, :vat_reg_num, :gift_cert_applied,
        :tran_is_vsoe_bundle, :vsoe_auto_calc, :sync_partner_teams, :item_list
        
      record_refs :custom_form, :entity, :rev_rec_schedule
      #   
      # 
      # record_refs :custom_form, :entity, :job, :currency, :dr_accound, :fx_account, :created_from, :opportunity, :sales_rep,
      #   :partner, :sales_group, :lead_source, :promo_code, :discount_item, :tax_item, :message_sel, :transaction_bill_address,
      #   :bill_address_list, :ship_address_list, :ship_method, :shipping_tax_code, :handling_tax_code, :payment_method,
      #   :credit_card, :credit_card_processor, :rev_rec_schedule, :billing_schedule, :class, :department, :subsidiary,
      #   :interco_transaction, :location, :terms

      #field :item_list, ItemList
      # field :custom_field_list, CustomFieldList

      attr_reader :internal_id
      attr_accessor :external_id

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end

    end
  end
end
