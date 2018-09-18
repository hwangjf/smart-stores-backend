require 'clearbit'

subscription_api_key = ENV['SUBSCRIPTION_API_KEY']

Clearbit.key = subscription_api_key

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
HelloFresh.com
HonestCompany.com
Ipsy.com
LipMonthly.com
LootCrate.com
LoveGoodly.com
LoveWithFood.com
MyBookBox.com
NatureBox.com
Plated.com
Scribbler.com
PupJoy.com
SockPanda.com
StitchFix.com
JustFab.com
TrunkClub.com
Nicelynoted.com
Urthbox.com
Netflix.com
Hulu.com
InstaCart.com
Spotify.com"

company_array = info.split("\n")

company_array.map! do |title|
  title.gsub(" ", "")
end

company_array.each do |company_url| 
  company = Clearbit::Enrichment::Company.find(domain: company_url)
  if company.pending?
    continue
  end
  Subscription.create(name: company["name"], info: company)
end

