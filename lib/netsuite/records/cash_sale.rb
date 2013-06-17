module NetSuite
  module Records
    class CashSale
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::TranSales

      # https://system.netsuite.com/help/helpcenter/en_US/SchemaBrowser/indexv2012_2_0.html
      # https://webservices.netsuite.com/xsd/transactions/v2012_2_0/sales.xsd

      actions :get, :add, :delete

      fields :created_date, :last_modified_date, :tran_date, :tran_id, :source, :contrib_pct, :start_date,
      	:end_date, :other_ref_num, :memo, :sales_effective_date, :exclude_commission, :undep_funds, :rev_rec_start_date,
      	:rev_rec_end_date, :total_cost_estimate, :est_gross_profit, :est_gross_profit_percent, :exchange_rate,
      	:currency_name, :discount_rate, :is_taxable, :tax_rate, :to_be_printed, :to_be_emailed, :to_be_faxed,
      	:fax, :message, :bill_address, :ship_address, :fob, :ship_date, :shipping_code, :shipping_tax_1_rate,
      	:shipping_tax_2_rate, :handling_tax_1_rate, :handling_cost, :handling_tax_2_rate, :linked_tracking_numbers,
      	:tracking_numbers, :recognized_revenue, :deferred_revenue, :rev_rec_on_rev_commitment, :sync_sales_teams,
      	:pay_pal_status, :cc_number, :cc_expire_date, :cc_name, :cc_street, :cc_zip_code, :cc_approved, :auth_code,
      	:pay_pal_tran_id, :sub_total, :cc_is_purchase_card_bin, :ignore_avs, :cc_process_as_purchase_card,
      	:item_cost_disc_rate, :item_cost_disc_amount, :item_cost_tax_rate_1, :item_cost_tax_rate_2, :item_cost_disc_taxable,
      	:item_cost_disc_tax_1_amt, :item_cost_disc_print, :exp_cost_disc_rate, :exp_cost_disc_amount, :exp_cost_disc_taxable,
      	:exp_cost_discprint, :exp_cost_tax_rate_1, :time_disc_rate, :exp_cost_tax_rate_2, :exp_cost_disc_tax_1_amt, 
      	:time_disc_amount, :time_disc_taxable, :time_disc_print, :discount_total, :tax_total, :time_tax_rate_1,
      	:alt_shipping_cost, :alt_handling_cost, :total, :time_disc_tax_1_amt, :cc_security_code, :time_tax_rate_2,
      	:charge_it, :debit_card_issue_no, :three_d_status_code, :pn_ref_num, :paypal_auth_id, :status, :paypal_process,
      	:email, :tax_2_total, :valid_form, :vat_reg_num, :gift_cert_applied, :tran_is_vsoe_bundle, :vsoe_auto_calc,
      	:sync_partner_terms, :cc_avs_street_match, :cc_avs_zip_match, :cc_security_code_match, :revenue_status,
      	:transaction_ship_address, :transaction_bill_address
        
      # record_refs :custom_form, :entity, :posting_period, :created_from, :opportunity, :department, :class, :location,
      # 	:subsidiary, :sales_rep, :partner, :lead_source, :rev_rec_schedule, :currency, :account, :promo_code, :discount_item,
      # 	:tax_item, :message_sel, :bill_address_list, 
      # 	:ship_address_list, :ship_mehod, :shipping_tax_code, :handling_tax_code, :sales_group, 
      # 	:payment_method, :credit_card, :credit_card_processor, :item_cost_discount, :item_cost_tax_code, :exp_cost_discount,
      # 	:time_discount, :exp_cost_tax_code, :time_tax_code, :job, :billing_schedule

      record_refs :entity, :custom_form, :location, :payment_method

      #field :custom_field_list, CustomFieldList
      field :item_list, CashSaleItemList

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
