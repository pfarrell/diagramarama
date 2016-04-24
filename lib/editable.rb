module Editable
  def editable_attributes
    self.values.select {|k,v| ![:id,:created_at,:updated_at].include? k}
  end

  def merge_params(params)
    symd = Hash[params.map {|k,v| [k.to_sym, parse(k.to_sym, v)] }.select{|k,v| ![:id, :splat, :captures, :track_id].include? k}]
    self.values.merge!(symd)
    self
  end

  def parse(key, value)
    return if self.db_schema[key].nil?
    case
      when self.db_schema[key][:db_type] == 'integer'
        value.to_i
      else
        value
    end
  end
end
