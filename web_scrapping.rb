require 'nokogiri'
require 'httparty'

def scrapper
  url = "https://candidato.computrabajo.cl/Acceso/?gclid=CjwKCAjw4KyJBhAbEiwAaAQbE0NCdc3ANmJ-3r9c1U-PQbEsVdeT2FNQt_cDAYChEqM3ZQMC5Uvo_xoCmQQQAvD_BwE"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page.body)
  job_listings = parsed_page.css('div.iO') # ('h2.iO') || ('h2.t0')
  #job_listings = parsed_page.css('div.iO').text
  #puts job_listings
  #puts unparsed_page
  # bussines = job_listings.css('span[itemprop="name"]')
  #bussines = bussines.text
  # puts bussines
  #puts job_listings.count #first
  job_listings.css('span[itemprop="name"]').each do |link|
    nuevo = link.content
    nuevo = nuevo.strip
    puts nuevo
  end
  per_page = job_listings.count
  array = []
  total = parsed_page.css('div.pg_grid span').text
  total = total-scan(/\d+/){ |i| array.push(i.to_i) }
  total = array[-1]
  last_page = (total.to_f / per_page.to_f).round
  page = 1
  puts total
  while page <= 1 last_page
    puts "Page: #{page}"
    pagination_url = "https://..."
    puts pagination_url
    # paginación de la página
    pagination_unparsed_page = HTTParty.get(pagination_url)
    pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page.body)
    pagination_job_listings = pagination_parsed_page.css('div.iO')
    pagination_job_listings.each do |jobs_listing|
      bussiness = scrapper_company(jobs_listing)
      job = {
        title: jobs_listing.css('h2.tO').text,
        company: bussines,
        url: pagination_url
        # url: "https://www..." + job-listing.css('a')[0].attributes['href'].value
      }
      #puts job
      job.each do |k, v|
        puts "#{k} => #{v}"
      end
      #puts bussines
    end
    page += 1
  end
end

def scrapper_company(jobs_listing)
  job_listing.css('span[itemprop="name"]').each do |link|
    nuevo = link.content
    nuevo = nuevo.strip
    return nuevo
  end
end

scrapper