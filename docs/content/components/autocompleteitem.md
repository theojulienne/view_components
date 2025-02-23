---
title: AutoCompleteItem
status: Alpha
source: https://github.com/primer/view_components/tree/main/app/components/primer/auto_complete_item_component.rb
storybook: https://primer.style/view-components/stories/?path=/story/primer-auto-complete-item-component
---

import Example from '../../src/@primer/gatsby-theme-doctocat/components/example'

<!-- Warning: AUTO-GENERATED file, do not edit. Add code comments to your Ruby instead <3 -->

Use AutoCompleteItem to list results of an auto-completed search.

## Examples

### Default

<Example src="<li role='option' data-autocomplete-value='value' aria-selected='true' class='autocomplete-item '>  Selected</li><li role='option' data-autocomplete-value='value' class='autocomplete-item '>  Not selected</li>" />

```erb
<%= render(Primer::AutoCompleteItemComponent.new(selected: true, value: "value")) do |c| %>
  Selected
<% end %>
<%= render(Primer::AutoCompleteItemComponent.new(value: "value")) do |c| %>
  Not selected
<% end %>
```

## Arguments

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `value` | `String` | N/A | Value of the item. |
| `selected` | `Boolean` | `false` | Whether the item is selected. |
| `disabled` | `Boolean` | `false` | Whether the item is disabled. |
| `system_arguments` | `Hash` | N/A | [System arguments](/system-arguments) |
