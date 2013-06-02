require 'spec_helper'

describe NetSuite::Records::SalesOrder do
  let(:item) { NetSuite::Records::SalesOrder.new }

  it 'has all the right fields' do
    [
      :created_date, :tran_date, :tran_id, :source, :order_status, :contrib_pct, :sync_sales_teams, :start_date,
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
        :tran_is_vsoe_bundle, :vsoe_auto_calc, :sync_partner_teams
    ].each do |field|
      item.should have_field(field)
    end
  end

  it 'has all the right record refs' do
    [
      :custom_form, :entity, :job, :currency, :dr_accound, :fx_account, :created_from, :opportunity, :sales_rep,
        :partner, :sales_group, :lead_source, :promo_code, :discount_item, :tax_item, :message_sel, :transaction_bill_address,
        :bill_address_list, :ship_address_list, :ship_method, :shipping_tax_code, :handling_tax_code, :payment_method,
        :credit_card, :credit_card_processor, :rev_rec_schedule, :billing_schedule, :class, :department, :subsidiary,
        :interco_transaction, :location, :terms
    ].each do |record_ref|
      item.should have_record_ref(record_ref)
    end
  end


  describe '.get' do
    context 'when the response is successful' do
      let(:response) { NetSuite::Response.new(:success => true, :body => { :tranId => 100 }) }

      it 'returns a InventoryItem instance populated with the data from the response object' do
        NetSuite::Actions::Get.should_receive(:call).with(NetSuite::Records::SalesOrder, :external_id => 1).and_return(response)
        item = NetSuite::Records::InventoryItem.get(:external_id => 1)
        item.should be_kind_of(NetSuite::Records::SalesOrder)
        item.tran_id.should eql(100)
      end
    end

  #   context 'when the response is unsuccessful' do
  #     let(:response) { NetSuite::Response.new(:success => false, :body => {}) }
  # 
  #     it 'raises a RecordNotFound exception' do
  #       NetSuite::Actions::Get.should_receive(:call).with(NetSuite::Records::InventoryItem, :external_id => 1).and_return(response)
  #       lambda {
  #         NetSuite::Records::InventoryItem.get(:external_id => 1)
  #       }.should raise_error(NetSuite::RecordNotFound,
  #         /NetSuite::Records::InventoryItem with OPTIONS=(.*) could not be found/)
  #     end
  #   end
  # end
  # 
  # describe '#add' do
  #   let(:item) { NetSuite::Records::InventoryItem.new(:cost => 100, :is_inactive => false) }
  # 
  #   context 'when the response is successful' do
  #     let(:response) { NetSuite::Response.new(:success => true, :body => { :internal_id => '1' }) }
  # 
  #     it 'returns true' do
  #       NetSuite::Actions::Add.should_receive(:call).
  #           with(item).
  #           and_return(response)
  #       item.add.should be_true
  #     end
  #   end
  # 
  #   context 'when the response is unsuccessful' do
  #     let(:response) { NetSuite::Response.new(:success => false, :body => {}) }
  # 
  #     it 'returns false' do
  #       NetSuite::Actions::Add.should_receive(:call).
  #           with(item).
  #           and_return(response)
  #       item.add.should be_false
  #     end
  #   end
  # end
  # 
  # describe '#delete' do
  #   context 'when the response is successful' do
  #     let(:response) { NetSuite::Response.new(:success => true, :body => { :internal_id => '1' }) }
  # 
  #     it 'returns true' do
  #       NetSuite::Actions::Delete.should_receive(:call).
  #           with(item).
  #           and_return(response)
  #       item.delete.should be_true
  #     end
  #   end
  # 
  #   context 'when the response is unsuccessful' do
  #     let(:response) { NetSuite::Response.new(:success => false, :body => {}) }
  # 
  #     it 'returns false' do
  #       NetSuite::Actions::Delete.should_receive(:call).
  #           with(item).
  #           and_return(response)
  #       item.delete.should be_false
  #     end
  #   end
  # end
  # 
  # describe '#to_record' do
  #   before do
  #     item.cost = 100
  #     item.is_inactive = false
  #   end
  #   it 'can represent itself as a SOAP record' do
  #     record = {
  #       'listAcct:cost'       => 100,
  #       'listAcct:isInactive' => false
  #     }
  #     item.to_record.should eql(record)
  #   end
  # end
  # 
  # describe '#record_type' do
  #   it 'returns a string representation of the SOAP type' do
  #     item.record_type.should eql('listAcct:InventoryItem')
  #   end
  # end

end
