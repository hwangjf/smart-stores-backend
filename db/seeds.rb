require 'json'
require 'byebug'
require 'clearbit'

api_key = ENV['API_KEY']
project_key = ENV['PROJECT_KEY']
project_token = ENV['PROJECT_TOKEN']

Clearbit.key = api_key

Subscription.where(id: 2..5000).destroy_all()

info = "AtlasCoffeeClub.com
BarkBox.com
BeautyFix.com
BeeroftheMonth.com
BespokePost.com
Birchbox.com
BlueApron.com
Bluum.com
Bombfell.com
Bookroo.com
CocoaRunners.com
CraftCoffee.com
DollarShaveClub.com
FabFitFun.com
FabKids.com
Fabletics.com
FarmtoPeople.com
FiveFourClub.com
GeekFuel.com
Glossybox.com
Graze.com
HelloFresh.com
HonestCompany.com
Ipsy.com
LipMonthly.com
LootCrate.com
LoveGoodly.com
LoveWithFood.com
MyBookBox.com
NatureBox.com
NerdBlock.com
Plated.com
PupJoy.com
SockPanda.com
StitchFix.com
TrunkClub.com
Urthbox.com"

company_array = info.split("\n")

company_array.map! do |title|
  title.gsub(" ", "")
end

# RapidAPI.config(project: project_key, token: project_token)

company_array.each do |company_url| 
  company = Clearbit::Enrichment::Company.find(domain: company_url)
  if company.pending?
    continue
  end
  Subscription.create(name: company["name"], info: company)
end

