module NetSuite
  module Records
    class CustomerCreditCardsList
      #include Support::Fields
      include Namespaces::ListRel

      #fields :items

      def initialize(attributes = {})
        case attributes[:credit_cards]
        when Hash
          items << CustomerCreditCard.new(attributes[:credit_cards])
        when Array
          attributes[:credit_cards].each { |item| items << CustomerCreditCard.new(item) }
        end
      end

      def items
        @items ||= []
      end

      def to_record
        { "#{record_namespace}:creditCards" => items.map(&:to_record) }
      end

    end
  end
end
