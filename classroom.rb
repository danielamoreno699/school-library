class Classroom
    attr_accessor :label
    attr_reader :label

    def initialize(label)
        @label = label
    end
end