# #EnhancedDateSelect
if defined?(Rails) && defined?(ActionView)
  module ActionView
    module Helpers
      module FormOptionsHelper
        def enhanced_date_select(object, method, options = {}, html_options = {})
          if Rails::VERSION::MAJOR.to_i <= 3
            #:nocov:
            @instance_tag = InstanceTag.new(object, method, self, options.delete(:object))
            #:nocov:
          else
            @instance_tag = Tags::Base.new(object, method, self, options)
          end
          @instance_tag.to_enhanced_date_select_tag(options, html_options)
        end
      end

      module EnhancedDateSelectTagHelper
        def to_enhanced_date_select_tag(options, html_options)
          enhanced_datetime_selector(options, html_options).enhanced_select_date.html_safe
        end

        def enhanced_datetime_selector(options, html_options)
          datetime = options[:value] || value(object) || default_datetime(options)

          @auto_index ||= nil

          options = options.dup
          options[:field_name] = @method_name
          options[:include_position] = true
          options[:prefix] ||= @object_name
          options[:index] = @auto_index if @auto_index && !options.key?(:index)

          EnhancedDateTimeSelector.new(datetime, options, html_options)
        end
      end

      class InstanceTag
        include EnhancedDateSelectTagHelper
      end

      module Tags
        class Base
          include EnhancedDateSelectTagHelper
        end
      end

      class EnhancedDateTimeSelector < DateTimeSelector
        def enhanced_select_date
          order = date_order.dup
          reset_options_enhanced(order)
          # If the day is hidden and the month is visible, the day should be set to the 1st so all month choices are valid (otherwise it could be 31 and February wouldn't be a valid date)
          if @datetime && @options[:discard_day] && !@options[:discard_month]
            if @datetime.is_a?(Hash)
              @datetime[:day] = 1
            else
              @datetime = @datetime.change(day: 1)
            end
          end
          %w(day month year).each do |o|
            order.unshift(o.to_sym) unless order.include?(o.to_sym)
          end
          build_selects_from_types(order)
        end

        def reset_options_enhanced(order)
          @options[:discard_hour] = true
          @options[:discard_minute] = true
          @options[:discard_second] = true
          @options[:discard_year] ||= true unless order.include?(:year)
          @options[:discard_month] ||= true unless order.include?(:month)
          @options[:discard_day] ||= true if @options[:discard_month] || !order.include?(:day)
        end

        %w( sec min hour day month year ).each do |method|
          define_method(method) do
            if @datetime
              if @datetime.is_a?(Fixnum)
                @datetime
              elsif @datetime.is_a?(Hash)
                @datetime[method.to_sym]
              else
                @datetime.send(method)
              end
            end
          end
        end
      end

      class FormBuilder
        def enhanced_date_select(method, options = {}, html_options = {})
          @template.enhanced_date_select(@object_name, method, objectify_options(options), html_options)
        end
      end
    end
  end
end
