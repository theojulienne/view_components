# frozen_string_literal: true

module Primer
  # Use the Flash component to inform users of successful or pending actions.
  class FlashComponent < Primer::Component
    status :beta

    # Optional action content showed on the right side of the component.
    #
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    renders_one :action, lambda { |**system_arguments|
      system_arguments[:tag] = :div
      system_arguments[:classes] = class_names(system_arguments[:classes], "flash-action")

      Primer::BaseComponent.new(**system_arguments)
    }

    DEFAULT_VARIANT = :default
    VARIANT_MAPPINGS = {
      DEFAULT_VARIANT => "",
      :warning => "flash-warn",
      :danger => "flash-error",
      :success => "flash-success"
    }.freeze
    # @example Variants
    #   <%= render(Primer::FlashComponent.new) { "This is a flash message!" } %>
    #   <%= render(Primer::FlashComponent.new(variant: :warning)) { "This is a warning flash message!" } %>
    #   <%= render(Primer::FlashComponent.new(variant: :danger)) { "This is a danger flash message!" } %>
    #   <%= render(Primer::FlashComponent.new(variant: :success)) { "This is a success flash message!" } %>
    #
    # @example Full width
    #   <%= render(Primer::FlashComponent.new(full: true)) { "This is a full width flash message!" } %>
    #
    # @example Dismissible
    #   <%= render(Primer::FlashComponent.new(dismissible: true)) { "This is a dismissible flash message!" } %>
    #
    # @example Icon
    #   <%= render(Primer::FlashComponent.new(icon: "people")) { "This is a flash message with an icon!" } %>
    #
    # @example With actions
    #   <%= render(Primer::FlashComponent.new) do |component| %>
    #     This is a flash message with actions!
    #     <% component.action do %>
    #       <%= render(Primer::ButtonComponent.new(variant: :small)) { "Take action" } %>
    #     <% end %>
    #   <% end %>
    #
    # @param full [Boolean] Whether the component should take up the full width of the screen.
    # @param spacious [Boolean] Whether to add margin to the bottom of the component.
    # @param dismissible [Boolean] Whether the component can be dismissed with an X button.
    # @param icon [String] Name of Octicon icon to use.
    # @param variant [Symbol] <%= one_of(Primer::FlashComponent::VARIANT_MAPPINGS.keys) %>
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    def initialize(full: false, spacious: false, dismissible: false, icon: nil, variant: DEFAULT_VARIANT, **system_arguments)
      @icon = icon
      @dismissible = dismissible
      @system_arguments = system_arguments
      @system_arguments[:tag] = :div
      @system_arguments[:classes] = class_names(
        @system_arguments[:classes],
        "flash",
        VARIANT_MAPPINGS[fetch_or_fallback(VARIANT_MAPPINGS.keys, variant, DEFAULT_VARIANT)],
        "flash-full": full
      )
      @system_arguments[:mb] ||= spacious ? 4 : nil
    end
  end
end
