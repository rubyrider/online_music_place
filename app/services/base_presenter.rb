class BasePresenter

  attr_reader :object

  def initialize(object = nil)
    @object = object
  end

  def created_date
    object.created_at.strftime('%F')
  end

  # call object method on presenter object
  #
  # @returns active record object methods on current presenter object
  def method_missing(method, *args)
    return nil unless object.respond_to?(method.to_sym)

    object.send method.to_sym, *args
  end

  def to_param
    object.to_param
  end

  def to_s
    object.to_s
  end

  class << self
    # collect and assign every collection in array to presenter object
    #
    # @returns array of decorated object
    def collect(collections)
      collections.collect { |collection| self.new(collection) }
    end
  end
end