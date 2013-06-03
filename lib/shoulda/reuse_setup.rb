require "shoulda/reuse_setup/version"
require "shoulda"
require "shoulda/context"

context_class = (defined?(Shoulda::Context::Context) ? Shoulda::Context::Context : Shoulda::Context)
context_class.class_eval do
  attr_accessor :previous_setup

  # does not preserve state from the transaction or other global changes (Time.zone/I18n.locale etc)
  def reuse_setup(&block)
    setup do
      raise "cannot nest reuse_setup" if @_used_reuse_setup
      @_used_reuse_setup = true

      @shoulda_context.previous_setup ||= begin
        instance_exec(&block)
        variables = instance_variables - [:@method_name, :@internal_data, :@_result, :@shoulda_context, :@_used_reuse_setup]
        variables.map{|k| [k, instance_variable_get(k)] }
      end
      @shoulda_context.previous_setup.each { |k,v| instance_variable_set(k,v) }
    end
  end
end
