require 'spec_helper'

describe 'Enhanced DateSelect' do
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::FormHelper
  let(:student) { Object.new }
  let(:deprecated_form_builder) { ActionView::Helpers::FormBuilder.new(:birthday, student, self, {}, nil) }
  let(:rails41_form_builder) { ActionView::Helpers::FormBuilder.new(:birthday, student, self, {}) }
  let(:tag_name) { 'birthday' }
  let(:instance_tag) { ActionView::Helpers::InstanceTag.new(student.class, tag_name, self, student) }
  let(:rails4_instance_tag) { ActionView::Helpers::Tags::Base.new(student.class, tag_name, self, student) }
  let(:datetime) { { year: 2001, month: 2, day: 3 } }
  let(:html_options) { {} }
  let(:options) do
    { discard_day: true,
      value: { year: 2001, month: 2, day: 3 },
      order: %w(day month year).map(&:to_sym),
      start_year: 2013,
      end_year: 1940 }
  end
  let(:expected_result) do
    "#{hidden_field(tag_name.to_sym, "#{tag_name}(3i)", value: 1)}
    #{select_month(options[:value][:month],
                   field_name: "#{tag_name}(2i)",
                   prefix: tag_name)}
    #{select_year(options[:value][:year],
                  start_year: options['start_year'],
                  end_year: options['end_year'],
                  field_name: "#{tag_name}(1i)",
                  prefix: tag_name)}"
  end
  before(:each) do
    student.stub(:delete).and_return(student)
    if (Rails::VERSION::MAJOR.to_i <= 3)
      @instance_tag = instance_tag
    else
      @instance_tag = rails4_instance_tag
    end
    if Rails::VERSION::MAJOR.to_i >= 4 && Rails::VERSION::MINOR >= 1
      @form_builder = rails41_form_builder
    else
      @form_builder = deprecated_form_builder
    end

    @enhanced_datetime_selector = ActionView::Helpers::EnhancedDateTimeSelector.new(datetime, options, {})
  end

  describe '.enhanced_date_select' do
    it 'constructs 3 selectboxes' do
      custom = { prompt: {
        day: 'please select one',
        month: 'please select one',
        year: 'please select one' } }
      @form_builder.enhanced_date_select(:birthday, options.merge(custom)).should ==
        "#{hidden_field(tag_name.to_sym, "#{tag_name}_3i", value: 1, name: "#{tag_name}[#{tag_name}(3i)]")}
#{select_month(options[:value][:month],
               field_name: "#{tag_name}(2i)",
               prefix: tag_name,
               prompt: custom[:prompt][:month])}#{select_year(options[:value][:year],
                                                              start_year: options[:start_year],
                                                              end_year: options[:end_year],
                                                              field_name: "#{tag_name}(1i)",
                                                              prefix: tag_name,
                                                              prompt: custom[:prompt][:year])}"
    end

    it 'construct withoud the day dropdown' do
      @form_builder.enhanced_date_select(:birthday, options).should == "#{hidden_field(tag_name.to_sym, "#{tag_name}_3i", value: 1, name: "#{tag_name}[#{tag_name}(3i)]")}
#{select_month(options[:value][:month],
               field_name: "#{tag_name}(2i)",
               prefix: tag_name)}#{select_year(options[:value][:year],
                                               start_year: options[:start_year],
                                               end_year: options[:end_year],
                                               field_name: "#{tag_name}(1i)",
                                               prefix: tag_name)}"
    end
  end

  describe ActionView::Helpers::FormOptionsHelper do
    before(:each) do
      if (Rails::VERSION::MAJOR.to_i <= 3)
        ActionView::Helpers::InstanceTag.stub(:new).and_return(@instance_tag)
        @class = ActionView::Helpers::InstanceTag
      else
        ActionView::Helpers::Tags::Base.stub(:new).and_return(@instance_tag)
        @class = ActionView::Helpers::Tags::Base
      end
    end

    it 'should call the instance tag with argument' do
      if (Rails::VERSION::MAJOR.to_i <= 3)
        @class.should_receive(:new).with(student, 'birthday', self, options.delete(:object)).and_return(@instance_tag)
      else
        @class.should_receive(:new).with(student, 'birthday', self, options).and_return(@instance_tag)
      end
      enhanced_date_select(student, 'birthday', options)
    end

    it 'should call the tp date_select_tag method' do
      @instance_tag.should_receive(:to_enhanced_date_select_tag).with(options, {})
      enhanced_date_select(student, 'birthday', options)
    end
  end

  if (Rails::VERSION::MAJOR.to_i <= 3)
    describe ActionView::Helpers::InstanceTag do
      before(:each) do
        @instance_tag.stub(:enhanced_datetime_selector).and_return(@enhanced_datetime_selector)
      end

      it 'should call the datetimeselector' do
        @instance_tag.should_receive(:enhanced_datetime_selector).with(options, html_options).and_return(@enhanced_datetime_selector)
        @instance_tag.to_enhanced_date_select_tag(options, html_options)
      end

      it 'should call the datetimeselector' do
        @enhanced_datetime_selector.should_receive(:enhanced_select_date).and_return(expected_result)
        @instance_tag.to_enhanced_date_select_tag(options, html_options)
      end
    end

  else
    describe ActionView::Helpers::Tags::Base do
      before(:each) do
        @instance_tag.stub(:enhanced_datetime_selector).and_return(@enhanced_datetime_selector)
      end

      it 'should call the datetimeselector' do
        @instance_tag.should_receive(:enhanced_datetime_selector).with(options, html_options).and_return(@enhanced_datetime_selector)
        @instance_tag.to_enhanced_date_select_tag(options, html_options)
      end

      it 'should call the datetimeselector' do
        @enhanced_datetime_selector.should_receive(:enhanced_select_date).and_return(expected_result)
        @instance_tag.to_enhanced_date_select_tag(options, html_options)
      end
    end

  end
end
