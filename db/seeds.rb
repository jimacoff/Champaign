# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 1. make actionkit page types
  actionkit_page_type = ActionkitPageType.create!({actionkit_page_type: 'petition'})

# 2. make languages
  language = Language.create!({language_code: 'EN/US', language_name: 'English'})

# 3  make campaigns
  campaign = Campaign.create!({campaign_name: 'Test campaign'})

# 4. make widget types

  WidgetType.create!([
    {
      widget_name: 'image',
      specifications: {
        width: 'integer',
        height: 'integer',
        image_url: 'string'
      },
      active: true
    },
    {
      widget_name: 'petition_form',
      specifications: {
        petition_text: 'string',
        require_full_name: 'boolean',
        require_email_address: 'boolean',
        require_state: 'boolean',
        require_country: 'boolean',
        require_postal_code: 'boolean',
        require_address: 'boolean',
        require_city: 'boolean',
        require_phone: 'boolean',
        checkboxes: 'array',
        select_box: 'dictionary',
        comment_textarea: 'dictionary',
        call_in_form: 'dictionary',
        letter_sent_form: 'dictionary',
        form_button_text: 'string'
      },
      active: true
    },
    {
      widget_name: 'thermometer',
      specifications: {
        goal: 'integer',
        autoincrement: 'boolean',
        # thermometers should have a way of storing action table IDs for the campaign_page_widgets that will be linked 
        # to the thermometer, as a new way of linking several campaign pages to the same thermometer
        linked_actions: 'array',
        count: 'integer' 
      },
      active: true,
    },
    {
      widget_name: 'text_body',
      specifications: {
        text_body_html: 'string'
      },
      action_table_name: nil,
      active: true
    },
    {
      widget_name: 'donation',
      specifications: {
        # a hash containing location / currency / multiplier for the donation amounts
        currencies_and_multipliers: {

        },
      },
      active: true
    }

  ])

# 5. make a campaign page

  campaign_page = CampaignPage.create!({
    language_id: (Language.find_by language_code: 'EN/US').id,
    title: 'Test page',
    slug: 'test_name',
    active: false,
    featured: false
  })

# 6. create a widget for the campaign page

  campaign_page_widget = campaign_page.campaign_pages_widgets.create!({
    widget_type_id: (WidgetType.find_by widget_name: 'text_body').id,
    content: {text_body_html: "<p>Sign this petition to save the jumping spiders!</p>"},
    page_display_order: 1,
  })

# 7. create an actionkit page match for the campaign page widget
  campaign_page_widget.create_actionkit_page({actionkit_id: 123, actionkit_page_type_id: (ActionkitPageType.find_by actionkit_page_type: 'petition').id})

# 8. make members 
