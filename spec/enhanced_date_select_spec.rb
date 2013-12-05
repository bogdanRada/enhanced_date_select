require "spec_helper"

describe "Enhanced DateSelect" do
  include ActionView::Helpers::FormOptionsHelper
  let(:student) {Object.new}
  let(:form_builder){ ActionView::Helpers::FormBuilder.new(:birthday, student, self, {}, nil)}

  let(:instance_tag) { ActionView::Helpers::InstanceTag.new(student.class, 'birthday', self, student )}
  let(:rails4_instance_tag) {ActionView::Helpers::Tags::Base.new(student.class, 'birthday', self, student ) }
  let(:datetime){{:year => 2001, :month => 2, :day => 3}}
  let(:html_options){{}}
  let(:options) {{ :discard_day =>true,
      :value => {:year => 2001, :month => 2, :day => 3},
      :order => [:day, :month, :year],
      :start_year => 2013,
      :end_year => 1940 }}
  let(:expected_result) {"<input id=\"birthday_birthday_3i\" name=\"birthday[birthday(3i)]\" type=\"hidden\" value=\"1\" />\n<select id=\"birthday_birthday_2i\" name=\"birthday[birthday(2i)]\">\n<option value=\"1\">January</option>\n<option selected=\"selected\" value=\"2\">February</option>\n<option value=\"3\">March</option>\n<option value=\"4\">April</option>\n<option value=\"5\">May</option>\n<option value=\"6\">June</option>\n<option value=\"7\">July</option>\n<option value=\"8\">August</option>\n<option value=\"9\">September</option>\n<option value=\"10\">October</option>\n<option value=\"11\">November</option>\n<option value=\"12\">December</option>\n</select>\n<select id=\"birthday_birthday_1i\" name=\"birthday[birthday(1i)]\">\n<option value=\"2012\">2012</option>\n<option value=\"2011\">2011</option>\n<option value=\"2010\">2010</option>\n<option value=\"2009\">2009</option>\n<option value=\"2008\">2008</option>\n<option value=\"2007\">2007</option>\n<option value=\"2006\">2006</option>\n<option value=\"2005\">2005</option>\n<option value=\"2004\">2004</option>\n<option value=\"2003\">2003</option>\n<option value=\"2002\">2002</option>\n<option selected=\"selected\" value=\"2001\">2001</option>\n<option value=\"2000\">2000</option>\n<option value=\"1999\">1999</option>\n<option value=\"1998\">1998</option>\n<option value=\"1997\">1997</option>\n<option value=\"1996\">1996</option>\n<option value=\"1995\">1995</option>\n<option value=\"1994\">1994</option>\n<option value=\"1993\">1993</option>\n<option value=\"1992\">1992</option>\n<option value=\"1991\">1991</option>\n<option value=\"1990\">1990</option>\n<option value=\"1989\">1989</option>\n<option value=\"1988\">1988</option>\n<option value=\"1987\">1987</option>\n<option value=\"1986\">1986</option>\n<option value=\"1985\">1985</option>\n<option value=\"1984\">1984</option>\n<option value=\"1983\">1983</option>\n<option value=\"1982\">1982</option>\n<option value=\"1981\">1981</option>\n<option value=\"1980\">1980</option>\n<option value=\"1979\">1979</option>\n<option value=\"1978\">1978</option>\n<option value=\"1977\">1977</option>\n<option value=\"1976\">1976</option>\n<option value=\"1975\">1975</option>\n<option value=\"1974\">1974</option>\n<option value=\"1973\">1973</option>\n<option value=\"1972\">1972</option>\n<option value=\"1971\">1971</option>\n<option value=\"1970\">1970</option>\n<option value=\"1969\">1969</option>\n<option value=\"1968\">1968</option>\n<option value=\"1967\">1967</option>\n<option value=\"1966\">1966</option>\n<option value=\"1965\">1965</option>\n<option value=\"1964\">1964</option>\n<option value=\"1963\">1963</option>\n<option value=\"1962\">1962</option>\n<option value=\"1961\">1961</option>\n<option value=\"1960\">1960</option>\n<option value=\"1959\">1959</option>\n<option value=\"1958\">1958</option>\n<option value=\"1957\">1957</option>\n<option value=\"1956\">1956</option>\n<option value=\"1955\">1955</option>\n<option value=\"1954\">1954</option>\n<option value=\"1953\">1953</option>\n<option value=\"1952\">1952</option>\n<option value=\"1951\">1951</option>\n<option value=\"1950\">1950</option>\n<option value=\"1949\">1949</option>\n<option value=\"1948\">1948</option>\n<option value=\"1947\">1947</option>\n<option value=\"1946\">1946</option>\n<option value=\"1945\">1945</option>\n<option value=\"1944\">1944</option>\n<option value=\"1943\">1943</option>\n<option value=\"1942\">1942</option>\n<option value=\"1941\">1941</option>\n<option value=\"1940\">1940</option>\n</select>\n"}
  before(:each) do
   student.stub(:delete).and_return(student)
     if ( Rails::VERSION::MAJOR.to_i <= 3 )
    @instance_tag =  instance_tag
    else
    @instance_tag = rails4_instance_tag
    end
    @enhanced_datetime_selector = ActionView::Helpers::EnhancedDateTimeSelector.new(datetime, options, {})
  end


  describe ".enhanced_date_select" do
  	it "constructs 3 selectboxes" do
      form_builder.enhanced_date_select(:birthday,{ :prompt => {
            :day => "please select one",
            :month => "please select one",
            :year => "please select one" },
          :value => {:year => 2001, :month => 2, :day => 3},
          :order => [:day, :month, :year],
          :start_year => 2013,
          :end_year => 1940 } ).should == "<select id=\"birthday_birthday_3i\" name=\"birthday[birthday(3i)]\">\n<option value=\"\">please select one</option>\n<option value=\"1\">1</option>\n<option value=\"2\">2</option>\n<option selected=\"selected\" value=\"3\">3</option>\n<option value=\"4\">4</option>\n<option value=\"5\">5</option>\n<option value=\"6\">6</option>\n<option value=\"7\">7</option>\n<option value=\"8\">8</option>\n<option value=\"9\">9</option>\n<option value=\"10\">10</option>\n<option value=\"11\">11</option>\n<option value=\"12\">12</option>\n<option value=\"13\">13</option>\n<option value=\"14\">14</option>\n<option value=\"15\">15</option>\n<option value=\"16\">16</option>\n<option value=\"17\">17</option>\n<option value=\"18\">18</option>\n<option value=\"19\">19</option>\n<option value=\"20\">20</option>\n<option value=\"21\">21</option>\n<option value=\"22\">22</option>\n<option value=\"23\">23</option>\n<option value=\"24\">24</option>\n<option value=\"25\">25</option>\n<option value=\"26\">26</option>\n<option value=\"27\">27</option>\n<option value=\"28\">28</option>\n<option value=\"29\">29</option>\n<option value=\"30\">30</option>\n<option value=\"31\">31</option>\n</select>\n<select id=\"birthday_birthday_2i\" name=\"birthday[birthday(2i)]\">\n<option value=\"\">please select one</option>\n<option value=\"1\">January</option>\n<option selected=\"selected\" value=\"2\">February</option>\n<option value=\"3\">March</option>\n<option value=\"4\">April</option>\n<option value=\"5\">May</option>\n<option value=\"6\">June</option>\n<option value=\"7\">July</option>\n<option value=\"8\">August</option>\n<option value=\"9\">September</option>\n<option value=\"10\">October</option>\n<option value=\"11\">November</option>\n<option value=\"12\">December</option>\n</select>\n<select id=\"birthday_birthday_1i\" name=\"birthday[birthday(1i)]\">\n<option value=\"\">please select one</option>\n<option value=\"2013\">2013</option>\n<option value=\"2012\">2012</option>\n<option value=\"2011\">2011</option>\n<option value=\"2010\">2010</option>\n<option value=\"2009\">2009</option>\n<option value=\"2008\">2008</option>\n<option value=\"2007\">2007</option>\n<option value=\"2006\">2006</option>\n<option value=\"2005\">2005</option>\n<option value=\"2004\">2004</option>\n<option value=\"2003\">2003</option>\n<option value=\"2002\">2002</option>\n<option selected=\"selected\" value=\"2001\">2001</option>\n<option value=\"2000\">2000</option>\n<option value=\"1999\">1999</option>\n<option value=\"1998\">1998</option>\n<option value=\"1997\">1997</option>\n<option value=\"1996\">1996</option>\n<option value=\"1995\">1995</option>\n<option value=\"1994\">1994</option>\n<option value=\"1993\">1993</option>\n<option value=\"1992\">1992</option>\n<option value=\"1991\">1991</option>\n<option value=\"1990\">1990</option>\n<option value=\"1989\">1989</option>\n<option value=\"1988\">1988</option>\n<option value=\"1987\">1987</option>\n<option value=\"1986\">1986</option>\n<option value=\"1985\">1985</option>\n<option value=\"1984\">1984</option>\n<option value=\"1983\">1983</option>\n<option value=\"1982\">1982</option>\n<option value=\"1981\">1981</option>\n<option value=\"1980\">1980</option>\n<option value=\"1979\">1979</option>\n<option value=\"1978\">1978</option>\n<option value=\"1977\">1977</option>\n<option value=\"1976\">1976</option>\n<option value=\"1975\">1975</option>\n<option value=\"1974\">1974</option>\n<option value=\"1973\">1973</option>\n<option value=\"1972\">1972</option>\n<option value=\"1971\">1971</option>\n<option value=\"1970\">1970</option>\n<option value=\"1969\">1969</option>\n<option value=\"1968\">1968</option>\n<option value=\"1967\">1967</option>\n<option value=\"1966\">1966</option>\n<option value=\"1965\">1965</option>\n<option value=\"1964\">1964</option>\n<option value=\"1963\">1963</option>\n<option value=\"1962\">1962</option>\n<option value=\"1961\">1961</option>\n<option value=\"1960\">1960</option>\n<option value=\"1959\">1959</option>\n<option value=\"1958\">1958</option>\n<option value=\"1957\">1957</option>\n<option value=\"1956\">1956</option>\n<option value=\"1955\">1955</option>\n<option value=\"1954\">1954</option>\n<option value=\"1953\">1953</option>\n<option value=\"1952\">1952</option>\n<option value=\"1951\">1951</option>\n<option value=\"1950\">1950</option>\n<option value=\"1949\">1949</option>\n<option value=\"1948\">1948</option>\n<option value=\"1947\">1947</option>\n<option value=\"1946\">1946</option>\n<option value=\"1945\">1945</option>\n<option value=\"1944\">1944</option>\n<option value=\"1943\">1943</option>\n<option value=\"1942\">1942</option>\n<option value=\"1941\">1941</option>\n<option value=\"1940\">1940</option>\n</select>\n"
    end

  	it "construct withoud the day dropdown" do
      form_builder.enhanced_date_select(:birthday,{ :discard_day =>true,
          :value => {:year => 2001, :month => 2, :day => 3},
          :order => [:day, :month, :year],
          :start_year => 2013,
          :end_year => 1940 } ).should =="<input id=\"birthday_birthday_3i\" name=\"birthday[birthday(3i)]\" type=\"hidden\" value=\"1\" />\n<select id=\"birthday_birthday_2i\" name=\"birthday[birthday(2i)]\">\n<option value=\"1\">January</option>\n<option selected=\"selected\" value=\"2\">February</option>\n<option value=\"3\">March</option>\n<option value=\"4\">April</option>\n<option value=\"5\">May</option>\n<option value=\"6\">June</option>\n<option value=\"7\">July</option>\n<option value=\"8\">August</option>\n<option value=\"9\">September</option>\n<option value=\"10\">October</option>\n<option value=\"11\">November</option>\n<option value=\"12\">December</option>\n</select>\n<select id=\"birthday_birthday_1i\" name=\"birthday[birthday(1i)]\">\n<option value=\"2013\">2013</option>\n<option value=\"2012\">2012</option>\n<option value=\"2011\">2011</option>\n<option value=\"2010\">2010</option>\n<option value=\"2009\">2009</option>\n<option value=\"2008\">2008</option>\n<option value=\"2007\">2007</option>\n<option value=\"2006\">2006</option>\n<option value=\"2005\">2005</option>\n<option value=\"2004\">2004</option>\n<option value=\"2003\">2003</option>\n<option value=\"2002\">2002</option>\n<option selected=\"selected\" value=\"2001\">2001</option>\n<option value=\"2000\">2000</option>\n<option value=\"1999\">1999</option>\n<option value=\"1998\">1998</option>\n<option value=\"1997\">1997</option>\n<option value=\"1996\">1996</option>\n<option value=\"1995\">1995</option>\n<option value=\"1994\">1994</option>\n<option value=\"1993\">1993</option>\n<option value=\"1992\">1992</option>\n<option value=\"1991\">1991</option>\n<option value=\"1990\">1990</option>\n<option value=\"1989\">1989</option>\n<option value=\"1988\">1988</option>\n<option value=\"1987\">1987</option>\n<option value=\"1986\">1986</option>\n<option value=\"1985\">1985</option>\n<option value=\"1984\">1984</option>\n<option value=\"1983\">1983</option>\n<option value=\"1982\">1982</option>\n<option value=\"1981\">1981</option>\n<option value=\"1980\">1980</option>\n<option value=\"1979\">1979</option>\n<option value=\"1978\">1978</option>\n<option value=\"1977\">1977</option>\n<option value=\"1976\">1976</option>\n<option value=\"1975\">1975</option>\n<option value=\"1974\">1974</option>\n<option value=\"1973\">1973</option>\n<option value=\"1972\">1972</option>\n<option value=\"1971\">1971</option>\n<option value=\"1970\">1970</option>\n<option value=\"1969\">1969</option>\n<option value=\"1968\">1968</option>\n<option value=\"1967\">1967</option>\n<option value=\"1966\">1966</option>\n<option value=\"1965\">1965</option>\n<option value=\"1964\">1964</option>\n<option value=\"1963\">1963</option>\n<option value=\"1962\">1962</option>\n<option value=\"1961\">1961</option>\n<option value=\"1960\">1960</option>\n<option value=\"1959\">1959</option>\n<option value=\"1958\">1958</option>\n<option value=\"1957\">1957</option>\n<option value=\"1956\">1956</option>\n<option value=\"1955\">1955</option>\n<option value=\"1954\">1954</option>\n<option value=\"1953\">1953</option>\n<option value=\"1952\">1952</option>\n<option value=\"1951\">1951</option>\n<option value=\"1950\">1950</option>\n<option value=\"1949\">1949</option>\n<option value=\"1948\">1948</option>\n<option value=\"1947\">1947</option>\n<option value=\"1946\">1946</option>\n<option value=\"1945\">1945</option>\n<option value=\"1944\">1944</option>\n<option value=\"1943\">1943</option>\n<option value=\"1942\">1942</option>\n<option value=\"1941\">1941</option>\n<option value=\"1940\">1940</option>\n</select>\n"
    end
  end


  describe ActionView::Helpers::FormOptionsHelper do


    before(:each) do
      if ( Rails::VERSION::MAJOR.to_i <= 3 )
      ActionView::Helpers::InstanceTag.stub(:new).and_return(@instance_tag)
      @class = ActionView::Helpers::InstanceTag
      else
      ActionView::Helpers::Tags::Base.stub(:new).and_return(@instance_tag)
       @class = ActionView::Helpers::Tags::Base
      end
    end

    it "should call the instance tag with argument" do
     if ( Rails::VERSION::MAJOR.to_i <= 3 )
      @class.should_receive(:new).with(student, 'birthday', self, options.delete(:object)).and_return(@instance_tag)
    else
        @class.should_receive(:new).with(student, 'birthday', self, options).and_return(@instance_tag)
        end
      enhanced_date_select(student,'birthday',options )
    end
    it "should call the tp date_select_tag method" do
      @instance_tag.should_receive(:to_enhanced_date_select_tag).with(options, {})
      enhanced_date_select(student,'birthday',options )
    end

  end

 if ( Rails::VERSION::MAJOR.to_i <= 3 )
  describe ActionView::Helpers::InstanceTag do

    before(:each) do
       @instance_tag.stub(:enhanced_datetime_selector).and_return(@enhanced_datetime_selector)
    end


    it "should call the datetimeselector" do
      @instance_tag.should_receive(:enhanced_datetime_selector).with(options, html_options).and_return(@enhanced_datetime_selector)
      @instance_tag.to_enhanced_date_select_tag(options, html_options)
    end

       it "should call the datetimeselector" do
      @enhanced_datetime_selector.should_receive(:enhanced_select_date).and_return(expected_result)
      @instance_tag.to_enhanced_date_select_tag(options, html_options)
    end



  end

  else
   describe ActionView::Helpers::Tags::Base do

    before(:each) do
       @instance_tag.stub(:enhanced_datetime_selector).and_return(@enhanced_datetime_selector)
    end


    it "should call the datetimeselector" do
      @instance_tag.should_receive(:enhanced_datetime_selector).with(options, html_options).and_return(@enhanced_datetime_selector)
      @instance_tag.to_enhanced_date_select_tag(options, html_options)
    end

       it "should call the datetimeselector" do
      @enhanced_datetime_selector.should_receive(:enhanced_select_date).and_return(expected_result)
      @instance_tag.to_enhanced_date_select_tag(options, html_options)
    end



  end

end

end
