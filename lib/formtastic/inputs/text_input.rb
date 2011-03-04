require 'inputs/new_base'

module Formtastic
  module Inputs
    
    # Outputs a simple `<label>` with a `<textarea>` wrapped in the standard
    # `<li>` wrapper. This is the default input choice for database columns of the `:text` type,
    # but can forced on any text-like input with `:as => :text`.
    #
    # @example Full form context and output
    # 
    #   <%= semantic_form_for(@user) do |f| %>
    #     <%= f.inputs do %>
    #       <%= f.input :first_name, :as => :string %>
    #     <% end %>
    #   <% end %>
    #
    #   <form...>
    #     <fieldset>
    #       <ol>
    #         <li class="string">
    #           <label for="user_first_name">First name</label>
    #           <input type="text" id="user_first_name" name="user[first_name]">
    #         </li>
    #       </ol>
    #     </fieldset>
    #   </form>
    #
    # @see Formtastic::Helpers::InputsHelper#input InputsHelper#input for full documetation of all possible options.
    class TextInput < NewBase
      
      def input_html_options
        { 
          :cols => builder.default_text_area_width,
          :rows => builder.default_text_area_height
        }.merge(super)
      end
      
      def to_html
        input_wrapping do
          builder.label(method, label_html_options) <<
          builder.text_area(method, input_html_options)
        end
      end
    
    end
  end
end