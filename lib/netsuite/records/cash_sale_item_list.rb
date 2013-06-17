module NetSuite
  module Records
    class CashSaleItemList
      #include Support::Fields
      include Namespaces::TranSales

      #fields :items

      def initialize(attributes = {})
        case attributes[:items]
        when Hash
          items << CashSaleItem.new(attributes[:items])
        when Array
          attributes[:items].each { |item| items << CashSaleItem.new(item) }
        end
      end

      def items
        @items ||= []
      end

      def to_record
        { "#{record_namespace}:item" => items.map(&:to_record) }
      end

    end
  end
end
