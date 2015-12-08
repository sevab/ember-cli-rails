require "ember_cli/capture"

module EmberRailsHelper
  def render_ember_app(name, &block)
    markup_capturer = EmberCli::Capture.new(sprockets: self, &block)

    head, body = markup_capturer.capture

    render inline: EmberCli[name].index_html(head: head, body: body)
  end
end
