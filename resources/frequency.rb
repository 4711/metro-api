module Resources
  class Frequency < Resource

    # CONSTANTS

    FILE_NAME = "frequencies.txt".freeze

    # ATTRIBUTES

    attribute :trip_id, Integer
    attribute :start_time, Time
    attribute :end_time, Time
    attribute :headway_seconds, Integer
    attribute :exact_times, Integer

  end
end
