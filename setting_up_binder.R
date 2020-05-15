library(holepunch)
# I skipped this step because it gave me an error and copied the DESCRIPTION file myself
write_compendium_description(package = 'Your compendium name', 
                             description = 'Your compendium description')

write_dockerfile(maintainer = "your_name") 

generate_badge() 

build_binder()