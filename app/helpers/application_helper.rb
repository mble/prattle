module ApplicationHelper # :nodoc:
  TOAST_MAP = {
    'success' => 'green',
    'notice' => 'orange',
    'error' => 'red'
  }.freeze

  def toast_class(type)
    TOAST_MAP[type] || 'blue'
  end
end
