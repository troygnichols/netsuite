module NetSuite
  module Records
    class OpportunityItemList
      #include Support::Fields
      include Namespaces::TranSales

      #fields :items

      def initialize(attributes = {})
        case attributes[:items]
        when Hash
          items << OpportunityItem.new(attributes[:items])
        when Array
          attributes[:items].each do |item|
            items << OpportunityItem.new(item)
          end
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
