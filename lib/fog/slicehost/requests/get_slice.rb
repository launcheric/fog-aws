module Fog
  module Slicehost
    class Real

      require 'fog/slicehost/parsers/get_slice'

      # Get details of a slice
      #
      # ==== Parameters
      # * slice_id<~Integer> - Id of slice to lookup
      #
      # ==== Returns
      # * response<~Excon::Response>:
      #   * body<~Hash>:
      #     * 'addresses'<~Array> - Ip addresses for the slice
      #     * 'backup-id'<~Integer> - Id of backup slice was booted from
      #     * 'bw-in'<~Float> - Incoming bandwidth total for current billing cycle, in Gigabytes
      #     * 'bw-out'<~Float> - Outgoing bandwidth total for current billing cycle, in Gigabytes
      #     * 'flavor_id'<~Integer> - Id of flavor slice was booted from
      #     * 'id'<~Integer> - Id of the slice
      #     * 'image-id'<~Integer> - Id of image slice was booted from
      #     * 'name'<~String> - Name of the slice
      #     * 'progress'<~Integer> - Progress of current action, in percentage
      #     * 'status'<~String> - Current status of the slice
      def get_slice(slice_id)
        request(
          :expects  => 200,
          :method   => 'GET',
          :parser   => Fog::Parsers::Slicehost::GetSlice.new,
          :path     => "/slices/#{slice_id}.xml"
        )
      end

    end

    class Mock

      def get_slice(id)
        raise Fog::Errors::MockNotImplemented.new("Contributions welcome!")
      end

    end
  end
end
