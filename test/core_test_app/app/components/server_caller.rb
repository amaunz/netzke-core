class ServerCaller < Netzke::Base
  action :bug_server # Actual action's text is set in en.yml
  action :no_response
  action :multiple_arguments
  action :array_as_argument

  # this action is using generic endpoint callback with scope
  action :call_with_generic_callback_and_scope

  js_configure do |c|
    c.title = "Server Caller"
    c.html = "Wow"
    c.mixin
  end

  def configure(c)
    super
    c.bbar = [:bug_server, :no_response, :multiple_arguments, :array_as_argument, :call_with_generic_callback_and_scope]

    # Alternative way of defining bbar:
    # c.docked_items = [{
    #   xtype: :toolbar,
    #   dock: :right,
    #   items: [:bug_server, :no_response, :multiple_arguments, :array_as_argument]
    # }]
  end

  endpoint :whats_up do |params, this|
    this.set_title("All quiet here on the server")
  end

  endpoint :no_response do |params, this|
  end

  endpoint :multiple_arguments do |params, this|
    this.take_two_arguments("First argument", "Second argument")
  end

  endpoint :array_as_argument do |params, this|
    this.take_array_as_argument(['Element 1', 'Element 2'])
  end

  endpoint :do_nothing do |params,this|
  end
end
