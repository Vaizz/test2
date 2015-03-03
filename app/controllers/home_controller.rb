class HomeController < ApplicationController

  require 'open-uri'

  def index
  end

  def show
    source = 'http://time.jsontest.com/'
    value = JSON.load ( open (source) )

    get_date(value)

    get_time(value)

    sum = @date + ' ' + @time

    hash = Hash.new
    hash['datetime'] = sum

    render json: hash
  end

  def get_date(value)
    # получение даты в формате гггг-мм-дд
    get_date = value.find {|k, v| v if k == 'date'}
    @date = []
    get_date[1].split('-').reverse.each do |val|
      @date << val
    end
    @date = @date.join("-")
  end

  def get_time(value)
    # получение времени
    get_time = value.find {|k, v| v if k == 'time'}
    @time = []
    @time_zone = 3
    get_time[1].split(' ').first.split(':').each_with_index do |val, i|
      val = val.to_i + 12 + @time_zone if i == 0
      @time << val
    end
    @time = @time.join(":")
  end

end
