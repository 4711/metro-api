module Resources
  class Transfer < Resource

    # CONSTANTS

    FILE_NAME = "transfers.txt".freeze

    # ATTRIBUTES

    attribute :from_stop_id, String
    attribute :to_stop_id, String
    attribute :transfer_type, Integer

  end
end
