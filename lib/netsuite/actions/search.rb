module NetSuite
  module Actions
    class Search
      include Support::Requests

      def initialize(klass, options = {})
        @klass   = klass
        @options = options
      end

      private

      def request
        connection.request :platformMsgs, :search do
          soap.namespaces['xmlns:platformMsgs'] = "urn:messages_#{NetSuite::Configuration.api_version}.platform.webservices.netsuite.com"
          soap.namespaces['xmlns:platformCore'] = "urn:core_#{NetSuite::Configuration.api_version}.platform.webservices.netsuite.com"
          soap.namespaces['xmlns:platformCommon'] = "urn:common_#{NetSuite::Configuration.api_version}.platform.webservices.netsuite.com"          
          soap.element_form_default = :unqualified
          soap.header = auth_header
          soap.body   = request_body
        end
      end

      def soap_type
        @klass.to_s.split('::').last.lower_camelcase
      end

      
#      <?xml version="1.0" encoding="UTF-8"?>
#      <Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="urn:core_2012_2.platform.webservices.netsuite.com" xmlns:ns2="urn:common_2012_2.platform.webservices.netsuite.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns3="urn:messages_2012_2.platform.webservices.netsuite.com" xmlns:ns4="ns">
# <Header><searchPreferences xsi:type="SearchPreferences"><bodyFieldsOnly>false</bodyFieldsOnly><returnSearchColumns>true</returnSearchColumns><pageSize>20</pageSize></searchPreferences><passport xsi:type="Passport"><email>david@dhanson.org</email><password>[Content Removed for Security Reasons]</password><account>3543296</account><role internalId="3"/></passport></Header>
# <Body>
#  <search>
#   <searchRecord xsi:type="CustomerSearchBasic">
#    <email operator="contains">
#      <searchValue>dhanson358+n1@gmail.com</searchValue>
#   </email>
#   </searchRecord>
#   </search></Body></Envelope>
      
      
      def request_body
        body = {
          'platformCore:searchRecord' => {
            'email' => {
              'searchValue' => @options[:email]
            },
            :attributes! => {
              'email' => {
                'operator' => 'contains'
              }
            }
          },
          :attributes! => {
            'platformCore:searchRecord' => {
              'xsi:type' => 'platformCommon:CustomerSearchBasic'
            }
          }         
        }

        body
      end

      def success?
        @success ||= response_hash[:status][:@is_success] == 'true'
      end

      def response_body
        @response_body ||= response_hash[:record_list][:record]
      end

      def response_hash
        @response_hash = @response[:search_response][:search_result]
      end
      module Support
          def self.included(base)
            base.extend(ClassMethods)
          end

          module ClassMethods

            def search(options = {})
              response = NetSuite::Actions::Search.call(self, options)
              if response.success?
               return new(response.body)
              else
               raise RecordNotFound, "#{self} with OPTIONS=#{options.inspect} could not be found"
              end
            end

          end
        end

      end

  end
end
